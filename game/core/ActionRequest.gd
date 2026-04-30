class_name ActionRequest
extends RefCounted

enum ActionType {
	MOVE,
	DIVINE_ATTACK,
	PROMOTE
}

var action_type: ActionType
var player_id: int
var piece_id: String
var from_coord: Vector2i
var to_coord: Vector2i
var promotion_type: String

func _init(
	p_action_type: ActionType = ActionType.MOVE,
	p_player_id: int = 0,
	p_piece_id: String = "",
	p_from_coord: Vector2i = Vector2i.ZERO,
	p_to_coord: Vector2i = Vector2i.ZERO,
	p_promotion_type: String = "queen"
) -> void:
	action_type = p_action_type
	player_id = p_player_id
	piece_id = p_piece_id
	from_coord = p_from_coord
	to_coord = p_to_coord
	promotion_type = p_promotion_type

func to_dictionary() -> Dictionary:
	return {
		"action_type": action_type,
		"player_id": player_id,
		"piece_id": piece_id,
		"from_coord": from_coord,
		"to_coord": to_coord,
		"promotion_type": promotion_type,
	}
