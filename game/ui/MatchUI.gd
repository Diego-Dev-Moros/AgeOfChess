class_name MatchUI
extends Control

signal frenzy_toggled
signal restart_requested
signal setup_shuffled
signal effect_card_selected(card_id: String)
signal ability_card_used

var turn_label: Label
var turn_banner_label: Label
var state_label: Label
var timer_label: Label
var king_label: Label
var terrain_label: Label
var cards_label: Label
var setup_label: Label
var selected_label: Label
var combat_label: Label
var log_label: RichTextLabel
var message_label: Label
var effect_card_row: HBoxContainer
var cpu_effect_card_row: HBoxContainer
var terrain_card_row: HBoxContainer
var attack_dice_row: HBoxContainer
var defense_dice_row: HBoxContainer
var audio_player: AudioStreamPlayer
var shuffle_button: Button
var ability_button: Button
var frenzy_button: Button
var restart_button: Button
var log_lines: Array[String] = []
var ui_built := false
var full_log_entries: Array[Dictionary] = []
var log_folder_path := "res://Logs"
var log_file_path := ""
var match_log_id := ""
var rendered_effect_cards_key := ""
var rendered_cpu_effect_cards_key := ""
var rendered_terrain_cards_key := ""
var terrain_animation_running := false

const BUFF_CARD_ASSETS: Dictionary = {
	"stone_pieces": "res://assets/art/cards/buffs/card_buff_stone_pieces_192x288.png",
	"giant_slayer": "res://assets/art/cards/buffs/card_buff_giant_slayer_192x288.png",
	"iron_age": "res://assets/art/cards/buffs/card_buff_iron_age_192x288.png",
	"last_will": "res://assets/art/cards/buffs/card_buff_last_will_192x288.png",
}
const DEBUFF_CARD_ASSETS: Dictionary = {
	"cowardice": "res://assets/art/cards/debuffs/card_debuff_cowardice_192x288.png",
	"crystal_pieces": "res://assets/art/cards/debuffs/card_debuff_crystal_pieces_192x288.png",
	"immoral": "res://assets/art/cards/debuffs/card_debuff_immoral_192x288.png",
	"fatigue": "res://assets/art/cards/debuffs/card_debuff_fatigue_192x288.png",
}
const TERRAIN_CARD_ASSETS: Dictionary = {
	"will": "res://assets/art/cards/terrain/card_terrain_will_192x288.png",
	"equal_conditions": "res://assets/art/cards/terrain/card_terrain_equal_conditions_192x288.png",
	"dirty_play": "res://assets/art/cards/terrain/card_terrain_dirty_play_192x288.png",
	"holy_ground": "res://assets/art/cards/terrain/card_terrain_holy_ground_192x288.png",
	"hell": "res://assets/art/cards/terrain/card_terrain_hell_192x288.png",
}

func _ready() -> void:
	_ensure_ui()

func update_match_state(state: Dictionary) -> void:
	_ensure_ui()
	var current_player: int = int(state.get("current_player", 0))
	var player_name: String = "White" if current_player == 0 else "Black"
	var turn_context: String = "YOUR MOVE" if current_player == 0 else "CPU THINKING"
	var terrain_draw_names: Array = Array(state.get("terrain_draw_names", []))
	var card_pool_names: Array = Array(state.get("card_pool_names", []))
	var terrain_draw: Array = Array(state.get("terrain_draw", []))
	var effect_card_draw: Array = Array(state.get("effect_card_draw", []))
	var selected_card: String = String(state.get("selected_effect_card", ""))
	var applied_card: String = String(state.get("applied_effect_card", ""))
	var cpu_effect_card_draw: Array = Array(state.get("cpu_effect_card_draw", []))
	var cpu_selected_card: String = String(state.get("cpu_selected_effect_card", ""))
	var cpu_applied_card: String = String(state.get("cpu_applied_effect_card", ""))
	var active_terrain: String = String(state.get("terrain", ""))
	turn_banner_label.text = "%s TURN - %s" % [player_name.to_upper(), turn_context]
	turn_banner_label.modulate = Color(0.95, 0.92, 0.68) if current_player == 0 else Color(0.75, 0.84, 1.0)
	turn_label.text = "Turn %d - %s" % [int(state.get("turn_number", 1)), player_name]
	state_label.text = "State: %s | Terrain: %s | Frenzy: %s" % [String(state.get("state", "")), active_terrain, "ON" if bool(state.get("frenzy", false)) else "OFF"]
	timer_label.text = "Timer: %s" % _format_time(int(state.get("timer_remaining", 0)))
	terrain_label.text = "Active Terrain: %s\n%s" % [String(state.get("terrain_display_name", "")), String(state.get("terrain_description", ""))]
	cards_label.text = "Active Cards\nWhite selected: %s\nWhite applied: %s\nCPU selected: %s\nCPU applied: %s\nWhite Buff: %s\nWhite Debuff: %s\nCPU Buff: %s\nCPU Debuff: %s" % [
		_short_card_name(selected_card),
		_short_card_name(applied_card),
		_short_card_name(cpu_selected_card),
		_short_card_name(cpu_applied_card),
		String(state.get("white_buff_display_name", "")),
		String(state.get("white_debuff_display_name", "")),
		String(state.get("black_buff_display_name", "")),
		String(state.get("black_debuff_display_name", "")),
	]
	setup_label.text = "Setup Draw\nTerrains: %s\nActive: %s\nCard Pool: %s" % [
		", ".join(terrain_draw_names),
		String(state.get("terrain_display_name", "")),
		", ".join(card_pool_names),
	]
	var divinity: Dictionary = Dictionary(state.get("divinity", {}))
	var committed: Dictionary = Dictionary(state.get("king_committed", {}))
	king_label.text = "White Divinity: %d%s | Black Divinity: %d%s" % [
		divinity[0],
		" committed" if committed[0] else "",
		divinity[1],
		" committed" if committed[1] else "",
	]
	_render_effect_cards(effect_card_row, effect_card_draw, selected_card, applied_card, true)
	_render_effect_cards(cpu_effect_card_row, cpu_effect_card_draw, cpu_selected_card, cpu_applied_card, false)
	if not terrain_animation_running:
		_render_terrain_cards(terrain_draw, active_terrain)
	if String(state.get("message", "")) != "":
		message_label.text = String(state.get("message", ""))

func set_selected_piece(piece: Piece, legal_targets: Array[Vector2i]) -> void:
	_ensure_ui()
	if piece == null:
		selected_label.text = "Selected: none"
		return
	var hp_text := "King" if piece.is_king() else "HP %d/%d" % [piece.hp, piece.max_hp]
	selected_label.text = "Selected: %s %s | %s | Legal targets: %d" % [
		"White" if piece.owner_id == 0 else "Black",
		piece.piece_type.capitalize(),
		hp_text,
		legal_targets.size(),
	]

func show_combat_result(result: Dictionary, attacker: Piece, defender: Piece) -> void:
	_ensure_ui()
	_play_dice_roll_sequence(result)
	var lines: Array[String] = []
	if result.failed:
		lines.append("Combat failed: %s vs %s" % [attacker.display_code(), defender.display_code()])
	else:
		lines.append("Combat: %s attacks %s" % [attacker.display_code(), defender.display_code()])
		lines.append("Attacker dice: rolled %s | used %s" % [str(result.attacker_dice), str(result.used_attacker_dice)])
		lines.append("Defender dice: rolled %s | used %s" % [str(result.defender_dice), str(result.used_defender_dice)])
		lines.append("Comparisons:")
		for comparison in result.comparisons:
			lines.append("- %s" % comparison)
		lines.append("Final damage: attacker takes %d, defender takes %d" % [result.attacker_damage, result.defender_damage])
	for entry in result.log:
		lines.append("Modifier: %s" % entry)
	combat_label.text = "\n".join(lines)
	add_log(combat_label.text.replace("\n", " | "))

func add_log(message: String) -> void:
	_ensure_ui()
	if message == "":
		return
	if match_log_id == "":
		start_new_log_file()
	full_log_entries.append(_make_log_entry(message))
	_save_full_log()
	log_lines.push_front(message)
	while log_lines.size() > 12:
		log_lines.pop_back()
	log_label.text = "\n".join(log_lines)

func set_game_over(message: String) -> void:
	_ensure_ui()
	message_label.text = message

func _ensure_ui() -> void:
	if ui_built:
		return
	_build_ui()

func clear_full_log() -> void:
	start_new_log_file()

func start_new_log_file() -> void:
	var datetime := Time.get_datetime_dict_from_system()
	match_log_id = "partida_%04d%02d%02d_%02d%02d%02d" % [
		datetime.year,
		datetime.month,
		datetime.day,
		datetime.hour,
		datetime.minute,
		datetime.second,
	]
	log_file_path = "%s/%s.json" % [log_folder_path, match_log_id]
	full_log_entries.clear()
	_save_full_log()

func get_log_file_path() -> String:
	return log_file_path

func _save_full_log() -> void:
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(log_folder_path))
	var file := FileAccess.open(log_file_path, FileAccess.WRITE)
	if file == null:
		push_warning("Could not write match log to %s" % log_file_path)
		return
	var payload := {
		"partida_id": match_log_id,
		"created_at": _current_timestamp(),
		"entries": full_log_entries,
	}
	file.store_string(JSON.stringify(payload, "\t"))

func _make_log_entry(message: String) -> Dictionary:
	return {
		"entry_id": full_log_entries.size() + 1,
		"timestamp": _current_timestamp(),
		"message": message,
	}

func _current_timestamp() -> String:
	var datetime := Time.get_datetime_dict_from_system()
	return "%04d-%02d-%02dT%02d:%02d:%02d" % [
		datetime.year,
		datetime.month,
		datetime.day,
		datetime.hour,
		datetime.minute,
		datetime.second,
	]

func _build_ui() -> void:
	ui_built = true
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	var scroll := ScrollContainer.new()
	scroll.mouse_filter = Control.MOUSE_FILTER_PASS
	scroll.anchor_left = 0.54
	scroll.anchor_right = 0.98
	scroll.anchor_top = 0.04
	scroll.anchor_bottom = 0.96
	scroll.offset_left = 0
	scroll.offset_right = 0
	scroll.offset_top = 0
	scroll.offset_bottom = 0
	add_child(scroll)

	var root := VBoxContainer.new()
	root.mouse_filter = Control.MOUSE_FILTER_PASS
	root.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	scroll.add_child(root)

	turn_label = Label.new()
	turn_label.text = "Turn"
	root.add_child(turn_label)

	turn_banner_label = Label.new()
	turn_banner_label.text = "WHITE TURN - YOUR MOVE"
	turn_banner_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	root.add_child(turn_banner_label)

	state_label = Label.new()
	root.add_child(state_label)

	timer_label = Label.new()
	root.add_child(timer_label)

	king_label = Label.new()
	king_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	root.add_child(king_label)

	terrain_label = Label.new()
	terrain_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	root.add_child(terrain_label)

	cards_label = Label.new()
	cards_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	root.add_child(cards_label)

	setup_label = Label.new()
	setup_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	root.add_child(setup_label)

	var terrain_draw_title := Label.new()
	terrain_draw_title.text = "Terrain Draw"
	root.add_child(terrain_draw_title)

	terrain_card_row = HBoxContainer.new()
	terrain_card_row.add_theme_constant_override("separation", 8)
	root.add_child(terrain_card_row)

	var card_draw_title := Label.new()
	card_draw_title.text = "White Card Draw"
	root.add_child(card_draw_title)

	effect_card_row = HBoxContainer.new()
	effect_card_row.add_theme_constant_override("separation", 8)
	root.add_child(effect_card_row)

	var cpu_card_draw_title := Label.new()
	cpu_card_draw_title.text = "CPU Card Draw"
	root.add_child(cpu_card_draw_title)

	cpu_effect_card_row = HBoxContainer.new()
	cpu_effect_card_row.add_theme_constant_override("separation", 8)
	root.add_child(cpu_effect_card_row)

	ability_button = Button.new()
	ability_button.mouse_filter = Control.MOUSE_FILTER_STOP
	ability_button.text = "Use Ability Card"
	ability_button.pressed.connect(func() -> void: ability_card_used.emit())
	root.add_child(ability_button)

	message_label = Label.new()
	message_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	root.add_child(message_label)

	selected_label = Label.new()
	selected_label.text = "Selected: none"
	selected_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	root.add_child(selected_label)

	combat_label = Label.new()
	combat_label.text = "Combat: none"
	combat_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	root.add_child(combat_label)

	var attack_dice_title := Label.new()
	attack_dice_title.text = "Attacker Dice"
	root.add_child(attack_dice_title)

	attack_dice_row = HBoxContainer.new()
	attack_dice_row.add_theme_constant_override("separation", 4)
	root.add_child(attack_dice_row)

	var defense_dice_title := Label.new()
	defense_dice_title.text = "Defender Dice"
	root.add_child(defense_dice_title)

	defense_dice_row = HBoxContainer.new()
	defense_dice_row.add_theme_constant_override("separation", 4)
	root.add_child(defense_dice_row)

	shuffle_button = Button.new()
	shuffle_button.mouse_filter = Control.MOUSE_FILTER_STOP
	shuffle_button.text = "Shuffle Cards/Terrain"
	shuffle_button.pressed.connect(func() -> void: setup_shuffled.emit())
	root.add_child(shuffle_button)

	frenzy_button = Button.new()
	frenzy_button.mouse_filter = Control.MOUSE_FILTER_STOP
	frenzy_button.text = "Toggle Frenzy"
	frenzy_button.pressed.connect(func() -> void: frenzy_toggled.emit())
	root.add_child(frenzy_button)

	restart_button = Button.new()
	restart_button.mouse_filter = Control.MOUSE_FILTER_STOP
	restart_button.text = "Restart"
	restart_button.pressed.connect(func() -> void: restart_requested.emit())
	root.add_child(restart_button)

	var log_title := Label.new()
	log_title.text = "Log"
	root.add_child(log_title)

	log_label = RichTextLabel.new()
	log_label.fit_content = true
	log_label.custom_minimum_size = Vector2(420, 260)
	root.add_child(log_label)

	audio_player = AudioStreamPlayer.new()
	add_child(audio_player)

func _format_time(total_seconds: int) -> String:
	var clamped_seconds: int = maxi(0, total_seconds)
	return "%02d:%02d" % [int(clamped_seconds / 60), clamped_seconds % 60]

func play_card_draw_sequence() -> void:
	_ensure_ui()
	_pulse_row(effect_card_row)
	_pulse_row(cpu_effect_card_row)
	await get_tree().create_timer(0.35).timeout

func play_terrain_draw_sequence(terrain_ids: Array[String], active_terrain: String) -> void:
	_ensure_ui()
	terrain_animation_running = true
	message_label.text = "Terrain cards revealed..."
	_render_terrain_cards(terrain_ids, "")
	await get_tree().create_timer(2.0).timeout
	message_label.text = "Shuffling terrain..."
	for i in range(10):
		var shuffled: Array[String] = []
		shuffled.append_array(terrain_ids)
		shuffled.shuffle()
		_render_terrain_cards(shuffled, "")
		_pulse_row(terrain_card_row)
		await get_tree().create_timer(0.12).timeout
	message_label.text = "Terrain drawn: %s" % active_terrain.capitalize()
	_render_terrain_cards(terrain_ids, active_terrain)
	_pulse_row(terrain_card_row)
	await get_tree().create_timer(0.55).timeout
	terrain_animation_running = false

func _render_effect_cards(row: HBoxContainer, card_ids: Array, selected_card: String, applied_card: String, clickable: bool) -> void:
	var key := "%s|%s|%s|%s" % [str(card_ids), selected_card, applied_card, str(clickable)]
	if clickable and key == rendered_effect_cards_key:
		return
	if not clickable and key == rendered_cpu_effect_cards_key:
		return
	if clickable:
		rendered_effect_cards_key = key
	else:
		rendered_cpu_effect_cards_key = key
	_clear_children(row)
	for card_id_variant in card_ids:
		var card_id := String(card_id_variant)
		var button := Button.new()
		button.custom_minimum_size = Vector2(72, 108)
		button.mouse_filter = Control.MOUSE_FILTER_STOP if clickable else Control.MOUSE_FILTER_IGNORE
		button.tooltip_text = _short_card_name(card_id)
		button.expand_icon = true
		button.icon = _texture_for_card(card_id)
		button.text = ""
		if card_id == selected_card:
			button.modulate = Color(1.0, 0.96, 0.55)
		if card_id == applied_card:
			button.text = "USED"
		if clickable:
			button.pressed.connect(_on_effect_card_button_pressed.bind(card_id))
		row.add_child(button)

func _render_terrain_cards(terrain_ids: Array, active_terrain: String) -> void:
	var key := "%s|%s" % [str(terrain_ids), active_terrain]
	if key == rendered_terrain_cards_key:
		return
	rendered_terrain_cards_key = key
	_clear_children(terrain_card_row)
	for terrain_id_variant in terrain_ids:
		var terrain_id := String(terrain_id_variant)
		var card := TextureRect.new()
		card.custom_minimum_size = Vector2(62, 93)
		card.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		card.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		card.texture = _load_texture(String(TERRAIN_CARD_ASSETS.get(terrain_id, "")))
		card.tooltip_text = terrain_id.capitalize()
		card.modulate = Color.WHITE if terrain_id == active_terrain else Color(0.45, 0.45, 0.45)
		terrain_card_row.add_child(card)

func _render_dice_row(row: HBoxContainer, dice_values: Array, dice_kind: String, used_count: int) -> void:
	_clear_children(row)
	for index in range(dice_values.size()):
		var value := int(dice_values[index])
		var dice_button := Button.new()
		dice_button.custom_minimum_size = Vector2(36, 36)
		dice_button.mouse_filter = Control.MOUSE_FILTER_STOP
		dice_button.expand_icon = true
		dice_button.icon = _load_texture("res://assets/art/dice/dice_%s_%d_32.png" % [dice_kind, value])
		dice_button.text = ""
		dice_button.modulate = Color.WHITE if index < used_count else Color(0.45, 0.45, 0.45, 0.7)
		dice_button.tooltip_text = "%s die: %d%s" % [dice_kind.capitalize(), value, " used" if index < used_count else " ignored"]
		dice_button.pressed.connect(_react_dice_button.bind(dice_button))
		row.add_child(dice_button)

func _on_effect_card_button_pressed(card_id: String) -> void:
	effect_card_selected.emit(card_id)

func _react_dice_button(button: Button) -> void:
	var tween := create_tween()
	tween.tween_property(button, "position", button.position + Vector2(0, -8), 0.06)
	tween.tween_property(button, "position", button.position, 0.12)

func _play_dice_roll_sequence(result: Dictionary) -> void:
	_play_sfx("res://assets/audio/sfx_dice_roll_placeholder.wav")
	var attacker_dice: Array = Array(result.get("attacker_dice", []))
	var defender_dice: Array = Array(result.get("defender_dice", []))
	var used_attacker_count: int = Array(result.get("used_attacker_dice", [])).size()
	var used_defender_count: int = Array(result.get("used_defender_dice", [])).size()
	var attacker_count: int = maxi(1, attacker_dice.size())
	var defender_count: int = maxi(1, defender_dice.size())
	for i in range(8):
		_render_dice_row(attack_dice_row, _random_dice_values(attacker_count), "attack", attacker_count)
		_render_dice_row(defense_dice_row, _random_dice_values(defender_count), "defense", defender_count)
		_pulse_row(attack_dice_row)
		_pulse_row(defense_dice_row)
		await get_tree().create_timer(0.055).timeout
	_render_dice_row(attack_dice_row, attacker_dice, "attack", used_attacker_count)
	_render_dice_row(defense_dice_row, defender_dice, "defense", used_defender_count)

func _random_dice_values(count: int) -> Array[int]:
	var values: Array[int] = []
	for i in range(count):
		values.append(randi_range(1, 6))
	return values

func _pulse_row(row: Control) -> void:
	var tween := create_tween()
	row.pivot_offset = row.size * 0.5
	tween.tween_property(row, "scale", Vector2(1.04, 1.04), 0.08)
	tween.tween_property(row, "scale", Vector2.ONE, 0.12)

func _play_sfx(path: String) -> void:
	if audio_player == null or not ResourceLoader.exists(path):
		return
	var stream: AudioStream = load(path) as AudioStream
	if stream == null:
		return
	audio_player.stream = stream
	audio_player.play()

func _texture_for_card(card_id: String) -> Texture2D:
	if BUFF_CARD_ASSETS.has(card_id):
		return _load_texture(String(BUFF_CARD_ASSETS[card_id]))
	if DEBUFF_CARD_ASSETS.has(card_id):
		return _load_texture(String(DEBUFF_CARD_ASSETS[card_id]))
	return null

func _load_texture(path: String) -> Texture2D:
	if path == "" or not ResourceLoader.exists(path):
		return null
	return load(path) as Texture2D

func _clear_children(node: Node) -> void:
	for child in node.get_children():
		child.queue_free()

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
		"":
			return "None"
	return card_id.capitalize()
