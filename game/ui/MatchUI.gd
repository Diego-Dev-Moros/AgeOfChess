class_name MatchUI
extends Control

signal frenzy_toggled
signal restart_requested

var turn_label: Label
var state_label: Label
var king_label: Label
var selected_label: Label
var combat_label: Label
var log_label: RichTextLabel
var message_label: Label
var frenzy_button: Button
var restart_button: Button
var log_lines: Array[String] = []
var ui_built := false
var full_log_lines: Array[String] = []
var log_file_path := "user://age_of_chess_match_log.txt"

func _ready() -> void:
	_ensure_ui()

func update_match_state(state: Dictionary) -> void:
	_ensure_ui()
	var player_name := "White" if state.current_player == 0 else "Black"
	turn_label.text = "Turn %d - %s" % [state.turn_number, player_name]
	state_label.text = "State: %s | Terrain: %s | Frenzy: %s" % [state.state, state.terrain, "ON" if state.frenzy else "OFF"]
	var divinity: Dictionary = state.divinity
	var committed: Dictionary = state.king_committed
	king_label.text = "White Divinity: %d%s | Black Divinity: %d%s" % [
		divinity[0],
		" committed" if committed[0] else "",
		divinity[1],
		" committed" if committed[1] else "",
	]
	if state.message != "":
		message_label.text = state.message

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
	var lines: Array[String] = []
	if result.failed:
		lines.append("Combat failed: %s vs %s" % [attacker.display_code(), defender.display_code()])
	else:
		lines.append("%s rolls %s" % [attacker.display_code(), str(result.attacker_dice)])
		lines.append("%s rolls %s" % [defender.display_code(), str(result.defender_dice)])
		lines.append("Pairs: %s" % ", ".join(result.comparisons))
		lines.append("Damage: attacker %d, defender %d" % [result.attacker_damage, result.defender_damage])
	for entry in result.log:
		lines.append(entry)
	combat_label.text = "\n".join(lines)
	add_log(combat_label.text.replace("\n", " | "))

func add_log(message: String) -> void:
	_ensure_ui()
	if message == "":
		return
	full_log_lines.append(message)
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
	full_log_lines.clear()
	_save_full_log()

func _save_full_log() -> void:
	var file := FileAccess.open(log_file_path, FileAccess.WRITE)
	if file == null:
		push_warning("Could not write match log to %s" % log_file_path)
		return
	file.store_string("\n".join(full_log_lines))

func _build_ui() -> void:
	ui_built = true
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	var root := VBoxContainer.new()
	root.mouse_filter = Control.MOUSE_FILTER_PASS
	root.anchor_left = 0.54
	root.anchor_right = 0.98
	root.anchor_top = 0.04
	root.anchor_bottom = 0.96
	root.offset_left = 0
	root.offset_right = 0
	root.offset_top = 0
	root.offset_bottom = 0
	add_child(root)

	turn_label = Label.new()
	turn_label.text = "Turn"
	root.add_child(turn_label)

	state_label = Label.new()
	root.add_child(state_label)

	king_label = Label.new()
	king_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	root.add_child(king_label)

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
