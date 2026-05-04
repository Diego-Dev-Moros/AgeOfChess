class_name GameManager
extends Node

@export var board_path: NodePath
@export var ui_path: NodePath

const HUMAN_PLAYER := 0
const CPU_PLAYER := 1
const MAX_DIVINITY := 3
const DEMON_THRESHOLD := -3
const MATCH_DURATION_SECONDS := 600.0
const FRENZY_START_SECONDS := 60.0

@onready var board: Board = get_node(board_path)
@onready var match_ui: MatchUI = get_node(ui_path)

var turn_manager := TurnManager.new()
var combat_resolver := CombatResolver.new()
var selected_piece_id := ""
var legal_targets: Array[Vector2i] = []
var buff_by_player := {HUMAN_PLAYER: "stone_pieces", CPU_PLAYER: ""}
var debuff_by_player := {HUMAN_PLAYER: "", CPU_PLAYER: "cowardice"}
var active_terrain := "will"
var terrain_draw: Array[String] = ["will", "equal_conditions", "dirty_play"]
var effect_card_draw: Array[String] = ["stone_pieces", "cowardice", "iron_age"]
var selected_effect_card := "stone_pieces"
var applied_effect_card := "stone_pieces"
var cpu_effect_card_draw: Array[String] = ["cowardice", "crystal_pieces", "immoral"]
var cpu_selected_effect_card := "cowardice"
var cpu_applied_effect_card := "cowardice"
var ability_card_used := false
var setup_animation_running := false
var implemented_buff_pool: Array[String] = ["stone_pieces", "giant_slayer", "iron_age"]
var implemented_debuff_pool: Array[String] = ["cowardice", "crystal_pieces", "immoral"]
var implemented_terrain_pool: Array[String] = ["will", "equal_conditions", "dirty_play"]
var full_card_pool: Array[String] = [
	"stone_pieces",
	"giant_slayer",
	"iron_age",
	"last_will",
	"cowardice",
	"crystal_pieces",
	"immoral",
	"fatigue",
]
var divinity := {HUMAN_PLAYER: MAX_DIVINITY, CPU_PLAYER: MAX_DIVINITY}
var king_committed := {HUMAN_PLAYER: false, CPU_PLAYER: false}
var turns_without_divine_attack := {HUMAN_PLAYER: 0, CPU_PLAYER: 0}
var last_divine_attack_turn := {HUMAN_PLAYER: -99, CPU_PLAYER: -99}
var frenzy := false
var game_over := false
var timer_remaining := MATCH_DURATION_SECONDS
var rng := RandomNumberGenerator.new()
var match_serial := 0
var cpu_action_pending := false

func _ready() -> void:
	rng.randomize()
	add_child(turn_manager)
	board.square_clicked.connect(_on_board_square_clicked)
	turn_manager.state_changed.connect(_on_turn_state_changed)
	match_ui.frenzy_toggled.connect(_on_frenzy_toggled)
	match_ui.restart_requested.connect(start_match)
	match_ui.setup_shuffled.connect(_on_setup_shuffled)
	match_ui.effect_card_selected.connect(_on_effect_card_selected)
	match_ui.ability_card_used.connect(_on_ability_card_used)
	start_match()

func _process(delta: float) -> void:
	if game_over:
		return
	if setup_animation_running:
		_update_ui("")
		return
	timer_remaining = maxf(0.0, timer_remaining - delta)
	if not frenzy and timer_remaining <= FRENZY_START_SECONDS:
		_start_frenzy("Frenzy begins: timer reached 01:00.")
	if timer_remaining <= 0.0:
		_end_game("Time expired. Prototype result: draw.")
		return
	_update_ui("")

func start_match() -> void:
	match_serial += 1
	cpu_action_pending = false
	game_over = false
	frenzy = false
	timer_remaining = MATCH_DURATION_SECONDS
	selected_piece_id = ""
	legal_targets.clear()
	divinity = {HUMAN_PLAYER: MAX_DIVINITY, CPU_PLAYER: MAX_DIVINITY}
	king_committed = {HUMAN_PLAYER: false, CPU_PLAYER: false}
	turns_without_divine_attack = {HUMAN_PLAYER: 0, CPU_PLAYER: 0}
	last_divine_attack_turn = {HUMAN_PLAYER: -99, CPU_PLAYER: -99}
	_apply_selected_effect_card()
	board.setup_initial_position()
	board.set_active_terrain(active_terrain)
	if active_terrain == "will":
		board.apply_will_terrain()
	_apply_crystal_piece_debuffs()
	board.clear_selection()
	match_ui.clear_full_log()
	turn_manager.start_match()
	match_ui.add_log("Log file: %s" % match_ui.get_log_file_path())
	var start_message := "Match started. White Buff: %s. CPU Debuff: %s. Terrain: %s." % [
		_card_display_name(buff_by_player[HUMAN_PLAYER]),
		_card_display_name(debuff_by_player[CPU_PLAYER]),
		_terrain_display_name(active_terrain),
	]
	match_ui.add_log(start_message)
	_update_ui(start_message)
	_begin_current_turn()

func _on_setup_shuffled() -> void:
	if setup_animation_running:
		return
	setup_animation_running = true
	_shuffle_setup()
	_update_ui("Select one White card to continue. CPU has chosen %s." % _short_card_name(cpu_selected_effect_card))
	await match_ui.play_card_draw_sequence()
	while selected_effect_card == "" and setup_animation_running:
		await get_tree().create_timer(0.1).timeout
	_update_ui("White selected %s. Terrain draw begins." % _short_card_name(selected_effect_card))
	await match_ui.play_terrain_draw_sequence(terrain_draw, active_terrain)
	setup_animation_running = false
	start_match()

func _shuffle_setup() -> void:
	terrain_draw = _draw_unique(implemented_terrain_pool, 3)
	active_terrain = terrain_draw[rng.randi_range(0, terrain_draw.size() - 1)]
	var selectable_cards: Array[String] = []
	selectable_cards.append_array(implemented_buff_pool)
	selectable_cards.append_array(implemented_debuff_pool)
	effect_card_draw = _draw_unique(selectable_cards, 3)
	cpu_effect_card_draw = _draw_unique(selectable_cards, 3)
	selected_effect_card = ""
	cpu_selected_effect_card = cpu_effect_card_draw[rng.randi_range(0, cpu_effect_card_draw.size() - 1)] if not cpu_effect_card_draw.is_empty() else ""
	applied_effect_card = ""
	cpu_applied_effect_card = cpu_selected_effect_card
	ability_card_used = false

func _on_effect_card_selected(card_id: String) -> void:
	if not effect_card_draw.has(card_id):
		return
	selected_effect_card = card_id
	ability_card_used = false
	_update_ui("Selected ability card: %s." % _short_card_name(card_id))

func _on_ability_card_used() -> void:
	if selected_effect_card == "":
		match_ui.add_log("No ability card selected.")
		_update_ui("No ability card selected.")
		return
	applied_effect_card = selected_effect_card
	ability_card_used = true
	_apply_selected_effect_card()
	_apply_crystal_piece_debuffs()
	match_ui.add_log("Ability card used: %s." % _card_display_name(selected_effect_card))
	_update_ui("Ability card used: %s." % _short_card_name(selected_effect_card))

func _apply_selected_effect_card() -> void:
	buff_by_player[HUMAN_PLAYER] = ""
	debuff_by_player[CPU_PLAYER] = ""
	buff_by_player[CPU_PLAYER] = ""
	debuff_by_player[HUMAN_PLAYER] = ""
	_apply_effect_card_for_player(applied_effect_card, HUMAN_PLAYER)
	_apply_effect_card_for_player(cpu_applied_effect_card, CPU_PLAYER)

func _apply_effect_card_for_player(card_id: String, owner_id: int) -> void:
	if implemented_buff_pool.has(card_id):
		buff_by_player[owner_id] = card_id
	elif implemented_debuff_pool.has(card_id):
		debuff_by_player[1 - owner_id] = card_id

func _apply_crystal_piece_debuffs() -> void:
	for player_id in [HUMAN_PLAYER, CPU_PLAYER]:
		if debuff_by_player[player_id] == "crystal_pieces":
			board.apply_crystal_pieces(player_id)

func _on_board_square_clicked(coord: Vector2i) -> void:
	if game_over or setup_animation_running or turn_manager.current_player_id != HUMAN_PLAYER:
		return
	var clicked_piece := board.get_piece_at(coord)
	if selected_piece_id == "":
		if clicked_piece != null and clicked_piece.owner_id == HUMAN_PLAYER:
			_select_piece(clicked_piece)
		return
	if legal_targets.has(coord):
		_submit_move(selected_piece_id, coord)
	else:
		if clicked_piece != null and clicked_piece.owner_id == HUMAN_PLAYER:
			_select_piece(clicked_piece)
		else:
			_clear_selection()

func _select_piece(piece: Piece) -> void:
	if not _can_piece_act_this_turn(piece):
		_update_ui("%s cannot act because of King Commitment." % piece.display_code())
		return
	selected_piece_id = piece.id
	legal_targets = board.get_legal_moves_for_piece(piece)
	legal_targets = _filter_committed_king_targets(piece, legal_targets)
	board.set_selection(piece.board_coord, legal_targets)
	match_ui.set_selected_piece(piece, legal_targets)
	match_ui.add_log("Selected %s. Legal moves: %d." % [piece.display_code(), legal_targets.size()])

func _clear_selection() -> void:
	selected_piece_id = ""
	legal_targets.clear()
	board.clear_selection()
	match_ui.set_selected_piece(null, [])

func _submit_move(piece_id: String, target: Vector2i) -> void:
	var piece := board.get_piece(piece_id)
	if piece == null or not piece.alive:
		_clear_selection()
		return
	var action := ActionRequest.new(ActionRequest.ActionType.MOVE, turn_manager.current_player_id, piece.id, piece.board_coord, target)
	_resolve_action(action)

func _resolve_action(action: ActionRequest) -> void:
	if game_over:
		return
	var piece := board.get_piece(action.piece_id)
	if piece == null or not piece.alive or piece.owner_id != turn_manager.current_player_id:
		match_ui.add_log("Ignored invalid action for current turn.")
		return
	var legal := board.get_legal_moves_for_piece(piece)
	legal = _filter_committed_king_targets(piece, legal)
	if not legal.has(action.to_coord):
		match_ui.add_log("Illegal move ignored.")
		_update_ui("Illegal move ignored.")
		return

	turn_manager.set_state(TurnManager.TurnState.RESOLVING_COMBAT)
	var used_divine_attack := false
	var target_piece := board.get_piece_at(action.to_coord)
	var from_coord := piece.board_coord

	if target_piece != null and target_piece.owner_id != piece.owner_id:
		if piece.is_king() and not frenzy:
			used_divine_attack = _resolve_divine_attack(piece, target_piece, action.to_coord)
		elif piece.is_king() and frenzy:
			board.execute_quiet_move(piece, action.to_coord)
			match_ui.add_log("%s captured during Frenzy." % piece.display_code())
		else:
			_resolve_normal_combat(piece, target_piece, from_coord, action.to_coord)
	else:
		var move_result := board.execute_quiet_move(piece, action.to_coord)
		_log_quiet_move(piece, from_coord, action.to_coord, move_result)

	_clear_selection()
	_after_action_resolution(used_divine_attack)

func _resolve_normal_combat(attacker: Piece, defender: Piece, from_coord: Vector2i, target: Vector2i) -> void:
	var context := {
		"frenzy": frenzy,
		"buff_by_player": buff_by_player,
		"debuff_by_player": debuff_by_player,
		"terrain": active_terrain,
		"corrupted_failure_by_player": _corrupted_failure_by_player(),
		"anti_stall_bonus": turn_manager.anti_stall_bonus_for(attacker.id, defender.id),
	}
	var result := combat_resolver.resolve_combat(attacker, defender, context)
	result["from_coord"] = from_coord
	board.execute_combat_board_result(attacker, defender, target, result)
	board.show_combat_feedback(from_coord, target, result)
	match_ui.show_combat_result(result, attacker, defender)

func _resolve_divine_attack(king: Piece, target_piece: Piece, target: Vector2i) -> bool:
	if target_piece.is_king():
		match_ui.add_log("Divine Attack cannot target the opposing King.")
		return false
	if divinity[king.owner_id] <= 0:
		match_ui.add_log("King has no Divinity and cannot attack.")
		return false
	board.remove_piece(target_piece)
	board.move_piece_to(king, target)
	board.show_feedback("DIVINE KO", target, Color(1.0, 0.9, 0.35))
	divinity[king.owner_id] -= 1
	if turn_manager.turn_number - last_divine_attack_turn[king.owner_id] <= 4:
		divinity[king.owner_id] -= 1
		match_ui.add_log("Overuse penalty: %s King loses extra Divinity." % _player_name(king.owner_id))
	king_committed[king.owner_id] = true
	match_ui.add_log("%s King used Divine Attack. Divinity now %d." % [_player_name(king.owner_id), divinity[king.owner_id]])
	_apply_king_state_effects(king.owner_id)
	return true

func _after_action_resolution(used_divine_attack: bool) -> void:
	var acting_player := turn_manager.current_player_id
	var opponent := 1 - acting_player
	if board.is_checkmate(opponent):
		_end_game("%s wins by checkmate." % _player_name(acting_player))
		return
	if board.is_stalemate(opponent):
		_end_game("Draw by stalemate.")
		return
	if board.is_player_in_check(opponent):
		match_ui.add_log("%s is in check." % _player_name(opponent))

	_update_divinity_recovery(acting_player, used_divine_attack)
	if not used_divine_attack and king_committed[acting_player]:
		king_committed[acting_player] = false
		match_ui.add_log("%s King's commitment is cleared." % _player_name(acting_player))

	turn_manager.end_turn(used_divine_attack)
	_begin_current_turn()

func _begin_current_turn() -> void:
	if game_over:
		return
	_clear_selection()
	if _resolve_blocked_or_finished_turn(turn_manager.current_player_id):
		return
	_update_ui("")
	if turn_manager.current_player_id == CPU_PLAYER:
		_schedule_cpu_turn()

func _resolve_blocked_or_finished_turn(player_id: int) -> bool:
	var legal_actions := _legal_actions_for_player(player_id)
	if not legal_actions.is_empty():
		return false
	var raw_actions := board.get_all_legal_actions(player_id)
	if raw_actions.is_empty():
		if board.is_player_in_check(player_id):
			_end_game("%s wins by checkmate." % _player_name(1 - player_id))
		else:
			_end_game("Draw by stalemate.")
		return true
	if king_committed[player_id] and not board.is_player_in_check(player_id):
		king_committed[player_id] = false
		match_ui.add_log("%s King's commitment consumes the turn and is cleared." % _player_name(player_id))
		_update_divinity_recovery(player_id, false)
		turn_manager.end_turn(false)
		_begin_current_turn()
		return true
	match_ui.add_log("%s has no available prototype action." % _player_name(player_id))
	return true

func _schedule_cpu_turn() -> void:
	if cpu_action_pending:
		return
	cpu_action_pending = true
	var scheduled_match_serial: int = match_serial
	await get_tree().create_timer(0.45).timeout
	cpu_action_pending = false
	if scheduled_match_serial != match_serial or game_over or setup_animation_running or turn_manager.current_player_id != CPU_PLAYER:
		return
	_play_cpu_turn()

func _play_cpu_turn() -> void:
	if game_over or turn_manager.current_player_id != CPU_PLAYER:
		return
	if _resolve_blocked_or_finished_turn(CPU_PLAYER):
		return
	var actions := _legal_actions_for_player(CPU_PLAYER)
	var preferred: Array[ActionRequest] = []
	for action in actions:
		var moving_piece := board.get_piece(action.piece_id)
		var target_piece := board.get_piece_at(action.to_coord)
		if target_piece != null and target_piece.owner_id != moving_piece.owner_id:
			preferred.append(action)
	if preferred.is_empty():
		preferred = actions
	var selected_action := preferred[rng.randi_range(0, preferred.size() - 1)]
	match_ui.add_log("CPU moves %s to %s." % [board.get_piece(selected_action.piece_id).display_code(), _coord_name(selected_action.to_coord)])
	_resolve_action(selected_action)

func _legal_actions_for_player(player_id: int) -> Array[ActionRequest]:
	var actions := board.get_all_legal_actions(player_id)
	var filtered: Array[ActionRequest] = []
	for action in actions:
		var piece := board.get_piece(action.piece_id)
		var committed_targets := _filter_committed_king_targets(piece, [action.to_coord])
		if _can_piece_act_this_turn(piece) and committed_targets.has(action.to_coord):
			filtered.append(action)
	return filtered

func _can_piece_act_this_turn(piece: Piece) -> bool:
	if piece == null:
		return false
	if not piece.is_king():
		return true
	if not king_committed[piece.owner_id]:
		return true
	return board.is_player_in_check(piece.owner_id)

func _filter_committed_king_targets(piece: Piece, targets: Array) -> Array[Vector2i]:
	var typed_targets: Array[Vector2i] = []
	for target in targets:
		typed_targets.append(target)
	if piece == null or not piece.is_king():
		return typed_targets
	if not king_committed[piece.owner_id] or board.is_player_in_check(piece.owner_id):
		return typed_targets
	return []

func _update_divinity_recovery(player_id: int, used_divine_attack: bool) -> void:
	if used_divine_attack:
		turns_without_divine_attack[player_id] = 0
		last_divine_attack_turn[player_id] = turn_manager.turn_number
		return
	turns_without_divine_attack[player_id] += 1
	if turns_without_divine_attack[player_id] >= 3 and divinity[player_id] < MAX_DIVINITY:
		divinity[player_id] += 1
		turns_without_divine_attack[player_id] = 0
		match_ui.add_log("%s King recovers 1 Divinity." % _player_name(player_id))
	_apply_king_state_effects(player_id)

func _apply_king_state_effects(player_id: int) -> void:
	if divinity[player_id] < DEMON_THRESHOLD:
		board.apply_demon_king(player_id)
		match_ui.add_log("%s King is Demon King: allied non-King pieces are set to 1 HP." % _player_name(player_id))
	elif divinity[player_id] < 0:
		match_ui.add_log("%s King is Corrupted: allied attacks gain failure risk." % _player_name(player_id))
	elif divinity[player_id] == 0:
		match_ui.add_log("%s King is Thorn King: Divine Attack unavailable." % _player_name(player_id))

func _corrupted_failure_by_player() -> Dictionary:
	var failure := {HUMAN_PLAYER: 0.0, CPU_PLAYER: 0.0}
	for player_id in [HUMAN_PLAYER, CPU_PLAYER]:
		if divinity[player_id] < 0 and divinity[player_id] >= DEMON_THRESHOLD:
			failure[player_id] = minf(abs(divinity[player_id]) * 0.05, 0.20)
	return failure

func _on_frenzy_toggled() -> void:
	if frenzy:
		return
	_start_frenzy("Frenzy begins: manually toggled.")

func _start_frenzy(reason: String) -> void:
	if frenzy:
		return
	frenzy = true
	board.enter_frenzy()
	match_ui.add_log("%s HP set to 1, dice and Divine Attack disabled." % reason)
	_update_ui("")

func _on_turn_state_changed(_state_name: String) -> void:
	_update_ui("")

func _update_ui(message: String) -> void:
	match_ui.update_match_state({
		"current_player": turn_manager.current_player_id,
		"turn_number": turn_manager.turn_number,
		"state": TurnManager.TurnState.keys()[turn_manager.state],
		"divinity": divinity,
		"king_committed": king_committed,
		"terrain": active_terrain,
		"terrain_display_name": _terrain_display_name(active_terrain),
		"terrain_description": _terrain_description(active_terrain),
		"white_buff_display_name": _card_display_name(buff_by_player[HUMAN_PLAYER]),
		"white_debuff_display_name": _card_display_name(debuff_by_player[HUMAN_PLAYER]),
		"black_buff_display_name": _card_display_name(buff_by_player[CPU_PLAYER]),
		"black_debuff_display_name": _card_display_name(debuff_by_player[CPU_PLAYER]),
		"effect_card_draw": effect_card_draw,
		"effect_card_draw_names": _display_names_for(effect_card_draw, false),
		"selected_effect_card": selected_effect_card,
		"applied_effect_card": applied_effect_card,
		"cpu_effect_card_draw": cpu_effect_card_draw,
		"cpu_selected_effect_card": cpu_selected_effect_card,
		"cpu_applied_effect_card": cpu_applied_effect_card,
		"ability_card_used": ability_card_used,
		"terrain_draw": terrain_draw,
		"terrain_draw_names": _display_names_for(terrain_draw, true),
		"card_pool_names": _display_names_for(full_card_pool, false),
		"frenzy": frenzy,
		"timer_remaining": ceili(timer_remaining),
		"in_check": {
			HUMAN_PLAYER: board.is_player_in_check(HUMAN_PLAYER),
			CPU_PLAYER: board.is_player_in_check(CPU_PLAYER),
		},
		"message": message,
	})

func _end_game(message: String) -> void:
	game_over = true
	turn_manager.set_state(TurnManager.TurnState.GAME_OVER)
	match_ui.add_log(message)
	match_ui.set_game_over(message)

func _log_quiet_move(piece: Piece, from_coord: Vector2i, to_coord: Vector2i, move_result: Dictionary) -> void:
	var suffix := ""
	if move_result.castled:
		suffix = " Castling."
	elif move_result.en_passant:
		suffix = " En passant."
	elif move_result.promoted:
		suffix = " Promoted to Queen."
	match_ui.add_log("%s %s to %s.%s" % [piece.display_code(), _coord_name(from_coord), _coord_name(to_coord), suffix])

func _player_name(player_id: int) -> String:
	return "White" if player_id == HUMAN_PLAYER else "Black"

func _coord_name(coord: Vector2i) -> String:
	return "%s%d" % [String.chr(97 + coord.x), 8 - coord.y]

func _terrain_display_name(terrain_id: String) -> String:
	match terrain_id:
		"will":
			return "Will"
		"equal_conditions":
			return "Equal Conditions"
		"dirty_play":
			return "Dirty Play"
	return terrain_id.capitalize()

func _terrain_description(terrain_id: String) -> String:
	match terrain_id:
		"will":
			return "All non-King pieces start with +1 HP and deal +1 combat damage until Frenzy."
		"equal_conditions":
			return "Combat dice difference is capped at 1 until Frenzy."
		"dirty_play":
			return "All non-King attacks have failure risk and +1 damage on success until Frenzy."
		"holy_ground":
			return "First allied deaths grant HP. Listed for card pool, not active in this prototype shuffle."
		"hell":
			return "Early deaths reduce allied damage. Listed for card pool, not active in this prototype shuffle."
	return "No terrain effect description."

func _card_display_name(card_id: String) -> String:
	match card_id:
		"stone_pieces":
			return "Stone Pieces - allied combat damage floor becomes 2."
		"giant_slayer":
			return "Giant Slayer - lower-value attackers deal +2 damage to higher-value defenders."
		"iron_age":
			return "Iron Age - allied pieces defend with Attack Dice."
		"last_will":
			return "Last Will - death retaliation card. Listed, not active in prototype shuffle."
		"cowardice":
			return "Cowardice - affected attacks have a 15% failure chance."
		"crystal_pieces":
			return "Crystal Pieces - affected non-pawn pieces start with -1 HP."
		"immoral":
			return "Immoral - affected pieces attack with Defense Dice."
		"fatigue":
			return "Fatigue - friendly-fire redirect card. Listed, not active in prototype shuffle."
		"":
			return "None"
	return card_id.capitalize()

func _draw_unique(source: Array[String], count: int) -> Array[String]:
	var available: Array[String] = []
	available.append_array(source)
	var draw: Array[String] = []
	while draw.size() < count and not available.is_empty():
		var index: int = rng.randi_range(0, available.size() - 1)
		draw.append(available[index])
		available.remove_at(index)
	return draw

func _display_names_for(ids: Array[String], terrain_names: bool) -> Array[String]:
	var names: Array[String] = []
	for id in ids:
		if terrain_names:
			names.append(_terrain_display_name(id))
		else:
			names.append(_short_card_name(id))
	return names

func _short_card_name(card_id: String) -> String:
	match card_id:
		"stone_pieces":
			return "Stone Pieces"
		"giant_slayer":
			return "Giant Slayer"
		"iron_age":
			return "Iron Age"
		"last_will":
			return "Last Will"
		"cowardice":
			return "Cowardice"
		"crystal_pieces":
			return "Crystal Pieces"
		"immoral":
			return "Immoral"
		"fatigue":
			return "Fatigue"
	return card_id.capitalize()
