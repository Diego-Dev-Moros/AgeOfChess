class_name Piece
extends RefCounted

const TYPE_PAWN := "pawn"
const TYPE_KNIGHT := "knight"
const TYPE_BISHOP := "bishop"
const TYPE_ROOK := "rook"
const TYPE_QUEEN := "queen"
const TYPE_KING := "king"

const STAT_TABLE := {
	TYPE_PAWN: {"attack_dice": 2, "defense_dice": 1, "hp": 1, "value": 1},
	TYPE_KNIGHT: {"attack_dice": 3, "defense_dice": 2, "hp": 2, "value": 3},
	TYPE_BISHOP: {"attack_dice": 3, "defense_dice": 2, "hp": 2, "value": 3},
	TYPE_ROOK: {"attack_dice": 4, "defense_dice": 3, "hp": 3, "value": 5},
	TYPE_QUEEN: {"attack_dice": 4, "defense_dice": 3, "hp": 4, "value": 9},
	TYPE_KING: {"attack_dice": 0, "defense_dice": 0, "hp": 0, "value": 0},
}

var id: String
var owner_id: int
var piece_type: String
var board_coord: Vector2i
var hp: int
var max_hp: int
var attack_dice: int
var defense_dice: int
var value: int
var has_moved := false
var alive := true

func _init(p_id: String, p_owner_id: int, p_piece_type: String, p_board_coord: Vector2i) -> void:
	id = p_id
	owner_id = p_owner_id
	piece_type = p_piece_type
	board_coord = p_board_coord
	var stats: Dictionary = STAT_TABLE[piece_type]
	attack_dice = stats.attack_dice
	defense_dice = stats.defense_dice
	max_hp = stats.hp
	hp = max_hp
	value = stats.value

func is_king() -> bool:
	return piece_type == TYPE_KING

func is_pawn() -> bool:
	return piece_type == TYPE_PAWN

func take_damage(amount: int) -> void:
	if is_king() or not alive:
		return
	hp -= max(0, amount)
	if hp <= 0:
		alive = false

func set_type(new_type: String) -> void:
	if not STAT_TABLE.has(new_type):
		return
	piece_type = new_type
	var stats: Dictionary = STAT_TABLE[piece_type]
	attack_dice = stats.attack_dice
	defense_dice = stats.defense_dice
	value = stats.value
	var previous_max_hp := max_hp
	max_hp = stats.hp
	hp = max(1, hp + max_hp - previous_max_hp)

func clone() -> Piece:
	var piece := Piece.new(id, owner_id, piece_type, board_coord)
	piece.hp = hp
	piece.max_hp = max_hp
	piece.attack_dice = attack_dice
	piece.defense_dice = defense_dice
	piece.value = value
	piece.has_moved = has_moved
	piece.alive = alive
	return piece

func display_code() -> String:
	var code := piece_type.substr(0, 1).to_upper()
	if piece_type == TYPE_KNIGHT:
		code = "N"
	return ("W" if owner_id == 0 else "B") + code
