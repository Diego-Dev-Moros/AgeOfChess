class_name Board
extends Node2D

signal square_clicked(board_coord: Vector2i)

const BOARD_SIZE := 8
const TILE_SIZE := 64
const LIGHT_TILE := Color(0.78, 0.78, 0.70)
const DARK_TILE := Color(0.38, 0.45, 0.42)
const WHITE_PIECE := Color(0.92, 0.92, 0.86)
const BLACK_PIECE := Color(0.12, 0.12, 0.14)
const SELECTED_COLOR := Color(0.95, 0.82, 0.24, 0.75)
const MOVE_COLOR := Color(0.20, 0.75, 0.35, 0.50)
const TARGET_COLOR := Color(0.85, 0.20, 0.20, 0.55)

var pieces: Dictionary = {}
var occupancy: Dictionary = {}
var selected_coord := Vector2i(-1, -1)
var legal_target_coords: Array[Vector2i] = []
var en_passant_target := Vector2i(-1, -1)
var last_move := {}

func _ready() -> void:
	set_process_unhandled_input(true)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var local_pos := to_local(event.position)
		var coord := world_to_board(local_pos)
		if is_inside_board(coord):
			square_clicked.emit(coord)
			get_viewport().set_input_as_handled()

func _draw() -> void:
	_draw_tiles()
	_draw_highlights()
	_draw_pieces()

func setup_initial_position() -> void:
	pieces.clear()
	occupancy.clear()
	en_passant_target = Vector2i(-1, -1)
	last_move.clear()
	var back_rank := [
		Piece.TYPE_ROOK,
		Piece.TYPE_KNIGHT,
		Piece.TYPE_BISHOP,
		Piece.TYPE_QUEEN,
		Piece.TYPE_KING,
		Piece.TYPE_BISHOP,
		Piece.TYPE_KNIGHT,
		Piece.TYPE_ROOK,
	]
	for file in range(BOARD_SIZE):
		_add_piece(0, back_rank[file], Vector2i(file, 7))
		_add_piece(0, Piece.TYPE_PAWN, Vector2i(file, 6))
		_add_piece(1, back_rank[file], Vector2i(file, 0))
		_add_piece(1, Piece.TYPE_PAWN, Vector2i(file, 1))
	queue_redraw()

func apply_will_terrain() -> void:
	for piece in pieces.values():
		if piece.alive and not piece.is_king():
			piece.max_hp += 1
			piece.hp += 1
	queue_redraw()

func apply_crystal_pieces(target_player_id: int) -> void:
	for piece in pieces.values():
		if piece.alive and piece.owner_id == target_player_id and not piece.is_king() and not piece.is_pawn():
			piece.max_hp = max(1, piece.max_hp - 1)
			piece.hp = min(piece.hp, piece.max_hp)
	queue_redraw()

func apply_demon_king(target_player_id: int) -> void:
	for piece in pieces.values():
		if piece.alive and piece.owner_id == target_player_id and not piece.is_king():
			piece.max_hp = 1
			piece.hp = 1
	queue_redraw()

func enter_frenzy() -> void:
	for piece in pieces.values():
		if piece.alive and not piece.is_king():
			piece.hp = 1
			piece.max_hp = 1
	queue_redraw()

func get_piece(piece_id: String) -> Piece:
	return pieces.get(piece_id)

func get_piece_at(coord: Vector2i) -> Piece:
	return pieces.get(occupancy.get(_coord_key(coord), ""))

func get_alive_pieces_for(player_id: int) -> Array[Piece]:
	var result: Array[Piece] = []
	for piece in pieces.values():
		if piece.alive and piece.owner_id == player_id:
			result.append(piece)
	return result

func get_all_alive_pieces() -> Array[Piece]:
	var result: Array[Piece] = []
	for piece in pieces.values():
		if piece.alive:
			result.append(piece)
	return result

func set_selection(coord: Vector2i, legal_coords: Array[Vector2i]) -> void:
	selected_coord = coord
	legal_target_coords = legal_coords
	queue_redraw()

func clear_selection() -> void:
	selected_coord = Vector2i(-1, -1)
	legal_target_coords.clear()
	queue_redraw()

func board_to_world(coord: Vector2i) -> Vector2:
	return Vector2(coord.x * TILE_SIZE, coord.y * TILE_SIZE)

func world_to_board(local_pos: Vector2) -> Vector2i:
	return Vector2i(floori(local_pos.x / TILE_SIZE), floori(local_pos.y / TILE_SIZE))

func is_inside_board(coord: Vector2i) -> bool:
	return coord.x >= 0 and coord.x < BOARD_SIZE and coord.y >= 0 and coord.y < BOARD_SIZE

func get_legal_moves_for_piece(piece: Piece) -> Array[Vector2i]:
	if piece == null or not piece.alive:
		return []
	var legal: Array[Vector2i] = []
	for target in _get_pseudo_moves_for_piece(piece, true):
		if not _would_leave_king_in_check(piece, target):
			legal.append(target)
	return legal

func get_all_legal_actions(player_id: int) -> Array[ActionRequest]:
	var actions: Array[ActionRequest] = []
	for piece in get_alive_pieces_for(player_id):
		for target in get_legal_moves_for_piece(piece):
			actions.append(ActionRequest.new(ActionRequest.ActionType.MOVE, player_id, piece.id, piece.board_coord, target))
	return actions

func is_player_in_check(player_id: int) -> bool:
	var king := _find_king(player_id)
	if king == null:
		return false
	return is_square_attacked(king.board_coord, 1 - player_id)

func is_checkmate(player_id: int) -> bool:
	if not is_player_in_check(player_id):
		return false
	return get_all_legal_actions(player_id).is_empty()

func is_stalemate(player_id: int) -> bool:
	if is_player_in_check(player_id):
		return false
	return get_all_legal_actions(player_id).is_empty()

func is_square_attacked(coord: Vector2i, by_player_id: int) -> bool:
	return _is_square_attacked_in_map(coord, by_player_id, pieces)

func move_piece_to(piece: Piece, target: Vector2i) -> void:
	occupancy.erase(_coord_key(piece.board_coord))
	piece.board_coord = target
	piece.has_moved = true
	occupancy[_coord_key(target)] = piece.id
	queue_redraw()

func remove_piece(piece: Piece) -> void:
	if piece == null:
		return
	piece.alive = false
	occupancy.erase(_coord_key(piece.board_coord))
	queue_redraw()

func execute_quiet_move(piece: Piece, target: Vector2i) -> Dictionary:
	var result := {"castled": false, "en_passant": false, "promoted": false, "captured_piece": null}
	var from_coord := piece.board_coord
	var target_piece := get_piece_at(target)
	if target_piece != null:
		result.captured_piece = target_piece
		remove_piece(target_piece)
	elif piece.is_pawn() and target == en_passant_target:
		var captured := get_piece_at(Vector2i(target.x, from_coord.y))
		if captured != null and captured.is_pawn() and captured.owner_id != piece.owner_id:
			result.en_passant = true
			result.captured_piece = captured
			remove_piece(captured)

	if piece.is_king() and abs(target.x - from_coord.x) == 2:
		_execute_castle_rook(piece.owner_id, target)
		result.castled = true

	move_piece_to(piece, target)
	_update_en_passant_target(piece, from_coord, target)

	if piece.is_pawn() and (target.y == 0 or target.y == 7):
		piece.set_type(Piece.TYPE_QUEEN)
		result.promoted = true

	last_move = {"piece_id": piece.id, "from": from_coord, "to": target}
	return result

func execute_combat_board_result(attacker: Piece, defender: Piece, target: Vector2i, combat_result: Dictionary) -> void:
	if combat_result.failed:
		queue_redraw()
		return

	attacker.take_damage(combat_result.attacker_damage)
	defender.take_damage(combat_result.defender_damage)

	if not defender.alive:
		remove_piece(defender)
	if not attacker.alive:
		remove_piece(attacker)

	if attacker.alive and not defender.alive:
		move_piece_to(attacker, target)
		if attacker.is_pawn() and (target.y == 0 or target.y == 7):
			attacker.set_type(Piece.TYPE_QUEEN)

	_update_en_passant_target(attacker, combat_result.get("from_coord", attacker.board_coord), target)
	queue_redraw()

func _add_piece(owner_id: int, piece_type: String, coord: Vector2i) -> Piece:
	var piece_id := "%s_%s_%d_%d" % ["white" if owner_id == 0 else "black", piece_type, coord.x, coord.y]
	var piece := Piece.new(piece_id, owner_id, piece_type, coord)
	pieces[piece_id] = piece
	occupancy[_coord_key(coord)] = piece_id
	return piece

func _get_pseudo_moves_for_piece(piece: Piece, include_castling: bool) -> Array[Vector2i]:
	match piece.piece_type:
		Piece.TYPE_PAWN:
			return _pawn_moves(piece)
		Piece.TYPE_KNIGHT:
			return _jump_moves(piece, [Vector2i(1, 2), Vector2i(2, 1), Vector2i(2, -1), Vector2i(1, -2), Vector2i(-1, -2), Vector2i(-2, -1), Vector2i(-2, 1), Vector2i(-1, 2)])
		Piece.TYPE_BISHOP:
			return _slide_moves(piece, [Vector2i(1, 1), Vector2i(1, -1), Vector2i(-1, 1), Vector2i(-1, -1)])
		Piece.TYPE_ROOK:
			return _slide_moves(piece, [Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1), Vector2i(0, -1)])
		Piece.TYPE_QUEEN:
			return _slide_moves(piece, [Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1), Vector2i(0, -1), Vector2i(1, 1), Vector2i(1, -1), Vector2i(-1, 1), Vector2i(-1, -1)])
		Piece.TYPE_KING:
			return _king_moves(piece, include_castling)
	return []

func _pawn_moves(piece: Piece) -> Array[Vector2i]:
	var moves: Array[Vector2i] = []
	var direction := -1 if piece.owner_id == 0 else 1
	var one_step := piece.board_coord + Vector2i(0, direction)
	if is_inside_board(one_step) and get_piece_at(one_step) == null:
		moves.append(one_step)
		var two_step := piece.board_coord + Vector2i(0, direction * 2)
		if not piece.has_moved and is_inside_board(two_step) and get_piece_at(two_step) == null:
			moves.append(two_step)
	for dx in [-1, 1]:
		var capture := piece.board_coord + Vector2i(dx, direction)
		if not is_inside_board(capture):
			continue
		var target_piece := get_piece_at(capture)
		if target_piece != null and target_piece.owner_id != piece.owner_id and not target_piece.is_king():
			moves.append(capture)
		elif capture == en_passant_target:
			moves.append(capture)
	return moves

func _jump_moves(piece: Piece, offsets: Array[Vector2i]) -> Array[Vector2i]:
	var moves: Array[Vector2i] = []
	for offset in offsets:
		var target := piece.board_coord + offset
		if not is_inside_board(target):
			continue
		var target_piece := get_piece_at(target)
		if target_piece == null or (target_piece.owner_id != piece.owner_id and not target_piece.is_king()):
			moves.append(target)
	return moves

func _slide_moves(piece: Piece, directions: Array[Vector2i]) -> Array[Vector2i]:
	var moves: Array[Vector2i] = []
	for direction in directions:
		var target := piece.board_coord + direction
		while is_inside_board(target):
			var target_piece := get_piece_at(target)
			if target_piece == null:
				moves.append(target)
			else:
				if target_piece.owner_id != piece.owner_id and not target_piece.is_king():
					moves.append(target)
				break
			target += direction
	return moves

func _king_moves(piece: Piece, include_castling: bool) -> Array[Vector2i]:
	var moves := _jump_moves(piece, [Vector2i(1, 0), Vector2i(1, 1), Vector2i(0, 1), Vector2i(-1, 1), Vector2i(-1, 0), Vector2i(-1, -1), Vector2i(0, -1), Vector2i(1, -1)])
	if include_castling:
		moves.append_array(_castle_moves(piece))
	return moves

func _castle_moves(king: Piece) -> Array[Vector2i]:
	var moves: Array[Vector2i] = []
	if king.has_moved or is_player_in_check(king.owner_id):
		return moves
	var rank := king.board_coord.y
	var enemy := 1 - king.owner_id
	var king_side_rook := get_piece_at(Vector2i(7, rank))
	if king_side_rook != null and king_side_rook.piece_type == Piece.TYPE_ROOK and not king_side_rook.has_moved:
		if get_piece_at(Vector2i(5, rank)) == null and get_piece_at(Vector2i(6, rank)) == null:
			if not is_square_attacked(Vector2i(5, rank), enemy) and not is_square_attacked(Vector2i(6, rank), enemy):
				moves.append(Vector2i(6, rank))
	var queen_side_rook := get_piece_at(Vector2i(0, rank))
	if queen_side_rook != null and queen_side_rook.piece_type == Piece.TYPE_ROOK and not queen_side_rook.has_moved:
		if get_piece_at(Vector2i(1, rank)) == null and get_piece_at(Vector2i(2, rank)) == null and get_piece_at(Vector2i(3, rank)) == null:
			if not is_square_attacked(Vector2i(2, rank), enemy) and not is_square_attacked(Vector2i(3, rank), enemy):
				moves.append(Vector2i(2, rank))
	return moves

func _would_leave_king_in_check(piece: Piece, target: Vector2i) -> bool:
	var simulated := _clone_pieces()
	_apply_classical_move_to_map(simulated, piece.id, target)
	return _is_king_in_check_in_map(simulated, piece.owner_id)

func _clone_pieces() -> Dictionary:
	var cloned := {}
	for piece_id in pieces:
		cloned[piece_id] = pieces[piece_id].clone()
	return cloned

func _apply_classical_move_to_map(piece_map: Dictionary, piece_id: String, target: Vector2i) -> void:
	var moving: Piece = piece_map[piece_id]
	var from := moving.board_coord
	for other_id in piece_map:
		var other: Piece = piece_map[other_id]
		if other.alive and other.board_coord == target and other.owner_id != moving.owner_id:
			other.alive = false
	if moving.is_pawn() and target == en_passant_target:
		for other_id in piece_map:
			var other: Piece = piece_map[other_id]
			if other.alive and other.board_coord == Vector2i(target.x, from.y) and other.owner_id != moving.owner_id and other.is_pawn():
				other.alive = false
	if moving.is_king() and abs(target.x - from.x) == 2:
		var rook_from_x := 7 if target.x > from.x else 0
		var rook_to_x := 5 if target.x > from.x else 3
		for other_id in piece_map:
			var rook: Piece = piece_map[other_id]
			if rook.alive and rook.owner_id == moving.owner_id and rook.piece_type == Piece.TYPE_ROOK and rook.board_coord == Vector2i(rook_from_x, from.y):
				rook.board_coord = Vector2i(rook_to_x, from.y)
	moving.board_coord = target
	moving.has_moved = true

func _is_king_in_check_in_map(piece_map: Dictionary, player_id: int) -> bool:
	var king_coord := Vector2i(-1, -1)
	for piece in piece_map.values():
		if piece.alive and piece.owner_id == player_id and piece.is_king():
			king_coord = piece.board_coord
			break
	if king_coord == Vector2i(-1, -1):
		return true
	return _is_square_attacked_in_map(king_coord, 1 - player_id, piece_map)

func _is_square_attacked_in_map(coord: Vector2i, by_player_id: int, piece_map: Dictionary) -> bool:
	for piece in piece_map.values():
		if not piece.alive or piece.owner_id != by_player_id:
			continue
		if _piece_attacks_square_in_map(piece, coord, piece_map):
			return true
	return false

func _piece_attacks_square_in_map(piece: Piece, target: Vector2i, piece_map: Dictionary) -> bool:
	var delta := target - piece.board_coord
	match piece.piece_type:
		Piece.TYPE_PAWN:
			var direction := -1 if piece.owner_id == 0 else 1
			return delta.y == direction and abs(delta.x) == 1
		Piece.TYPE_KNIGHT:
			return [Vector2i(1, 2), Vector2i(2, 1)].has(Vector2i(abs(delta.x), abs(delta.y)))
		Piece.TYPE_KING:
			return max(abs(delta.x), abs(delta.y)) == 1
		Piece.TYPE_BISHOP:
			return abs(delta.x) == abs(delta.y) and _path_clear_in_map(piece.board_coord, target, piece_map)
		Piece.TYPE_ROOK:
			return (delta.x == 0 or delta.y == 0) and _path_clear_in_map(piece.board_coord, target, piece_map)
		Piece.TYPE_QUEEN:
			var straight: bool = delta.x == 0 or delta.y == 0
			var diagonal: bool = abs(delta.x) == abs(delta.y)
			return (straight or diagonal) and _path_clear_in_map(piece.board_coord, target, piece_map)
	return false

func _path_clear_in_map(from_coord: Vector2i, to_coord: Vector2i, piece_map: Dictionary) -> bool:
	var step := Vector2i(int(sign(to_coord.x - from_coord.x)), int(sign(to_coord.y - from_coord.y)))
	var cursor := from_coord + step
	while cursor != to_coord:
		for piece in piece_map.values():
			if piece.alive and piece.board_coord == cursor:
				return false
		cursor += step
	return true

func _find_king(player_id: int) -> Piece:
	for piece in pieces.values():
		if piece.alive and piece.owner_id == player_id and piece.is_king():
			return piece
	return null

func _execute_castle_rook(owner_id: int, king_target: Vector2i) -> void:
	var rank := king_target.y
	var rook_from := Vector2i(7, rank) if king_target.x == 6 else Vector2i(0, rank)
	var rook_to := Vector2i(5, rank) if king_target.x == 6 else Vector2i(3, rank)
	var rook := get_piece_at(rook_from)
	if rook != null and rook.owner_id == owner_id:
		move_piece_to(rook, rook_to)

func _update_en_passant_target(piece: Piece, from_coord: Vector2i, target: Vector2i) -> void:
	en_passant_target = Vector2i(-1, -1)
	if piece.is_pawn() and abs(target.y - from_coord.y) == 2:
		en_passant_target = Vector2i(from_coord.x, (from_coord.y + target.y) / 2)

func _draw_tiles() -> void:
	for y in range(BOARD_SIZE):
		for x in range(BOARD_SIZE):
			var color := LIGHT_TILE if (x + y) % 2 == 0 else DARK_TILE
			draw_rect(Rect2(Vector2(x, y) * TILE_SIZE, Vector2.ONE * TILE_SIZE), color)

func _draw_highlights() -> void:
	if is_inside_board(selected_coord):
		draw_rect(Rect2(board_to_world(selected_coord), Vector2.ONE * TILE_SIZE), SELECTED_COLOR)
	for coord in legal_target_coords:
		var target_piece := get_piece_at(coord)
		var color := TARGET_COLOR if target_piece != null else MOVE_COLOR
		draw_rect(Rect2(board_to_world(coord), Vector2.ONE * TILE_SIZE), color)

func _draw_pieces() -> void:
	var font := ThemeDB.fallback_font
	for piece in get_all_alive_pieces():
		var rect := Rect2(board_to_world(piece.board_coord) + Vector2(6, 6), Vector2(TILE_SIZE - 12, TILE_SIZE - 12))
		var color := WHITE_PIECE if piece.owner_id == 0 else BLACK_PIECE
		draw_rect(rect, color, true, 0.0)
		draw_rect(rect, Color.BLACK, false, 2.0)
		var text_color := Color.BLACK if piece.owner_id == 0 else Color.WHITE
		draw_string(font, board_to_world(piece.board_coord) + Vector2(13, 31), piece.display_code(), HORIZONTAL_ALIGNMENT_LEFT, -1, 18, text_color)
		if not piece.is_king():
			draw_string(font, board_to_world(piece.board_coord) + Vector2(10, 55), "HP %d" % piece.hp, HORIZONTAL_ALIGNMENT_LEFT, -1, 13, text_color)
		else:
			draw_string(font, board_to_world(piece.board_coord) + Vector2(10, 55), "KING", HORIZONTAL_ALIGNMENT_LEFT, -1, 12, text_color)

func _coord_key(coord: Vector2i) -> String:
	return "%d,%d" % [coord.x, coord.y]
