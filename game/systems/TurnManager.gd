class_name TurnManager
extends Node

signal turn_started(player_id: int, turn_number: int)
signal state_changed(state_name: String)

enum TurnState {
	IDLE,
	SELECTING_PIECE,
	SELECTING_TARGET,
	RESOLVING_COMBAT,
	END_TURN,
	GAME_OVER
}

var current_player_id := 0
var turn_number := 1
var state := TurnState.IDLE
var selected_piece_id := ""
var turns_without_divine_attack := {0: 0, 1: 0}
var last_divine_turn := {0: -99, 1: -99}
var king_committed := {0: false, 1: false}
var last_combat_pair := ""
var repeated_combat_count := 0

func start_match() -> void:
	current_player_id = 0
	turn_number = 1
	set_state(TurnState.SELECTING_PIECE)
	turn_started.emit(current_player_id, turn_number)

func set_state(new_state: TurnState) -> void:
	state = new_state
	state_changed.emit(TurnState.keys()[state])

func end_turn(used_divine_attack: bool) -> void:
	if used_divine_attack:
		turns_without_divine_attack[current_player_id] = 0
		last_divine_turn[current_player_id] = turn_number
	else:
		turns_without_divine_attack[current_player_id] += 1
	current_player_id = 1 - current_player_id
	turn_number += 1
	selected_piece_id = ""
	set_state(TurnState.SELECTING_PIECE)
	turn_started.emit(current_player_id, turn_number)

func current_player_name() -> String:
	return "White" if current_player_id == 0 else "Black"

func anti_stall_bonus_for(attacker_id: String, defender_id: String) -> int:
	var ids := [attacker_id, defender_id]
	ids.sort()
	var pair_key := "%s:%s" % [ids[0], ids[1]]
	if pair_key == last_combat_pair:
		repeated_combat_count += 1
	else:
		last_combat_pair = pair_key
		repeated_combat_count = 0
	return repeated_combat_count
