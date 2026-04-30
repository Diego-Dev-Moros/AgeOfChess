class_name GameManager
extends Node

@export var board_path: NodePath
@export var ui_path: NodePath

const HUMAN_PLAYER := 0
const CPU_PLAYER := 1
const MAX_DIVINITY := 3
const DEMON_THRESHOLD := -3

@onready var board: Board = get_node(board_path)
@onready var match_ui: MatchUI = get_node(ui_path)

var turn_manager := TurnManager.new()
var combat_resolver := CombatResolver.new()
var selected_piece_id := ""
var legal_targets: Array[Vector2i] = []
var buff_by_player := {HUMAN_PLAYER: "stone_pieces", CPU_PLAYER: ""}
var debuff_by_player := {HUMAN_PLAYER: "", CPU_PLAYER: "cowardice"}
var active_terrain := "will"
var divinity := {HUMAN_PLAYER: MAX_DIVINITY, CPU_PLAYER: MAX_DIVINITY}
var king_committed := {HUMAN_PLAYER: false, CPU_PLAYER: false}
var turns_without_divine_attack := {HUMAN_PLAYER: 0, CPU_PLAYER: 0}
var last_divine_attack_turn := {HUMAN_PLAYER: -99, CPU_PLAYER: -99}
var frenzy := false
var game_over := false
var rng := RandomNumberGenerator.new()

func _ready() -> void:
	rng.randomize()
	add_child(turn_manager)
	board.square_clicked.connect(_on_board_square_clicked)
	turn_manager.state_changed.connect(_on_turn_state_changed)
	match_ui.frenzy_toggled.connect(_on_frenzy_toggled)
	match_ui.restart_requested.connect(start_match)
	start_match()

func start_match() -> void:
	game_over = false
	frenzy = false
	selected_piece_id = ""
	legal_targets.clear()
	divinity = {HUMAN_PLAYER: MAX_DIVINITY, CPU_PLAYER: MAX_DIVINITY}
	king_committed = {HUMAN_PLAYER: false, CPU_PLAYER: false}
	turns_without_divine_attack = {HUMAN_PLAYER: 0, CPU_PLAYER: 0}
	last_divine_attack_turn = {HUMAN_PLAYER: -99, CPU_PLAYER: -99}
	board.setup_initial_position()
	if active_terrain == "will":
		board.apply_will_terrain()
	board.clear_selection()
	match_ui.clear_full_log()
	turn_manager.start_match()
	_update_ui("Match started. Player has Stone Pieces. CPU is affected by Cowardice. Terrain: Will.")

func _on_board_square_clicked(coord: Vector2i) -> void:
	if game_over or turn_manager.current_player_id != HUMAN_PLAYER:
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
		return
	var legal := board.get_legal_moves_for_piece(piece)
	legal = _filter_committed_king_targets(piece, legal)
	if not legal.has(action.to_coord):
		_update_ui("Illegal move.")
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
	_update_ui("")
	if turn_manager.current_player_id == CPU_PLAYER:
		await get_tree().create_timer(0.45).timeout
		_play_cpu_turn()

func _play_cpu_turn() -> void:
	if game_over or turn_manager.current_player_id != CPU_PLAYER:
		return
	var actions := _legal_actions_for_player(CPU_PLAYER)
	if actions.is_empty():
		if board.is_player_in_check(CPU_PLAYER):
			_end_game("White wins by checkmate.")
		else:
			_end_game("Draw by stalemate.")
		return
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
			failure[player_id] = min(abs(divinity[player_id]) * 0.05, 0.20)
	return failure

func _on_frenzy_toggled() -> void:
	if frenzy:
		return
	frenzy = true
	board.enter_frenzy()
	match_ui.add_log("Frenzy begins: HP set to 1, dice and Divine Attack disabled.")
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
		"frenzy": frenzy,
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
