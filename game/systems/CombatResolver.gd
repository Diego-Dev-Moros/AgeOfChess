class_name CombatResolver
extends RefCounted

const MAX_USED_DICE := 3
const FAILURE_CAP := 0.20

var dice_roller := DiceRoller.new()

func resolve_combat(attacker: Piece, defender: Piece, context: Dictionary) -> Dictionary:
	var result := _empty_result(attacker, defender)
	if context.get("frenzy", false):
		result.defender_damage = defender.hp
		result.defender_died = true
		result.log.append("Frenzy capture: no dice rolled.")
		return result

	var failure_chance := _failure_chance(attacker, context)
	if dice_roller.chance(failure_chance):
		result.failed = true
		result.log.append("Attack failed before combat. Chance: %d%%" % roundi(failure_chance * 100.0))
		return result

	var attack_dice_count := _attack_dice_count(attacker, defender, context)
	var defense_dice_count := _defense_dice_count(attacker, defender, context)
	var capped_counts := _apply_equal_dice_cap(attack_dice_count, defense_dice_count, context)
	attack_dice_count = capped_counts.x
	defense_dice_count = capped_counts.y

	result.attacker_dice = dice_roller.roll_d6(attack_dice_count)
	result.defender_dice = dice_roller.roll_d6(defense_dice_count)
	result.used_attacker_dice = result.attacker_dice.slice(0, MAX_USED_DICE)
	result.used_defender_dice = result.defender_dice.slice(0, MAX_USED_DICE)

	var pair_count: int = min(result.used_attacker_dice.size(), result.used_defender_dice.size())
	var attacker_wins := 0
	for i in range(pair_count):
		var attack_roll: int = result.used_attacker_dice[i]
		var defense_roll: int = result.used_defender_dice[i]
		if attack_roll > defense_roll:
			result.defender_damage += 1
			attacker_wins += 1
			result.comparisons.append("%d>%d defender -1" % [attack_roll, defense_roll])
		elif defense_roll > attack_roll:
			result.attacker_damage += 1
			result.comparisons.append("%d<%d attacker -1" % [attack_roll, defense_roll])
		else:
			if attacker.hp >= 2 and defender.hp >= 2:
				result.attacker_damage += 1
				result.defender_damage += 1
				result.comparisons.append("%d=%d both -1" % [attack_roll, defense_roll])
			else:
				result.comparisons.append("%d=%d no tie damage" % [attack_roll, defense_roll])

	if pair_count > 0 and attacker_wins == pair_count:
		result.defender_damage += 1
		result.log.append("Momentum: defender +1 damage.")

	if result.attacker_damage + result.defender_damage == 0:
		result.attacker_damage = 1
		result.defender_damage = 1
		result.log.append("Minimum damage: both pieces take 1.")

	_apply_damage_modifiers(result, attacker, defender, context)

	result.attacker_died = attacker.hp - result.attacker_damage <= 0
	result.defender_died = defender.hp - result.defender_damage <= 0
	return result

func _empty_result(attacker: Piece, defender: Piece) -> Dictionary:
	return {
		"attacker_id": attacker.id,
		"defender_id": defender.id,
		"attacker_dice": [],
		"defender_dice": [],
		"used_attacker_dice": [],
		"used_defender_dice": [],
		"comparisons": [],
		"attacker_damage": 0,
		"defender_damage": 0,
		"attacker_died": false,
		"defender_died": false,
		"failed": false,
		"log": [],
	}

func _attack_dice_count(attacker: Piece, _defender: Piece, context: Dictionary) -> int:
	var count := attacker.attack_dice
	if context.get("debuff_by_player", {}).get(attacker.owner_id, "") == "immoral":
		count = attacker.defense_dice
	return max(1, count)

func _defense_dice_count(_attacker: Piece, defender: Piece, context: Dictionary) -> int:
	var count := defender.defense_dice
	if context.get("buff_by_player", {}).get(defender.owner_id, "") == "iron_age":
		count = defender.attack_dice
	return max(1, count)

func _apply_equal_dice_cap(attack_count: int, defense_count: int, context: Dictionary) -> Vector2i:
	if context.get("terrain", "") != "equal_conditions":
		return Vector2i(attack_count, defense_count)
	if attack_count > defense_count + 1:
		attack_count = defense_count + 1
	elif defense_count > attack_count + 1:
		defense_count = attack_count + 1
	return Vector2i(max(1, attack_count), max(1, defense_count))

func _failure_chance(attacker: Piece, context: Dictionary) -> float:
	var chance := float(context.get("corrupted_failure_by_player", {}).get(attacker.owner_id, 0.0))
	if context.get("debuff_by_player", {}).get(attacker.owner_id, "") == "cowardice":
		chance += 0.15
	if context.get("terrain", "") == "dirty_play":
		chance += 0.10
	return min(chance, FAILURE_CAP)

func _apply_damage_modifiers(result: Dictionary, attacker: Piece, defender: Piece, context: Dictionary) -> void:
	if context.get("buff_by_player", {}).get(attacker.owner_id, "") == "stone_pieces" and result.defender_damage > 0:
		if result.defender_damage < 2:
			result.defender_damage = 2
			result.log.append("Stone Pieces: defender damage floor set to 2.")

	if context.get("buff_by_player", {}).get(attacker.owner_id, "") == "giant_slayer":
		if attacker.value < defender.value and result.defender_damage > 0:
			result.defender_damage += 2
			result.log.append("Giant Slayer: defender +2 damage.")

	if context.get("terrain", "") == "will":
		if result.defender_damage > 0:
			result.defender_damage += 1
			result.log.append("Will: defender +1 damage.")
		if result.attacker_damage > 0:
			result.attacker_damage += 1
			result.log.append("Will: attacker +1 damage.")
	elif context.get("terrain", "") == "dirty_play" and result.defender_damage > 0:
		result.defender_damage += 1
		result.log.append("Dirty Play success: defender +1 damage.")

	var anti_stall_bonus: int = int(context.get("anti_stall_bonus", 0))
	if anti_stall_bonus > 0:
		result.attacker_damage += anti_stall_bonus
		result.defender_damage += anti_stall_bonus
		result.log.append("Anti-stall: both +%d damage." % anti_stall_bonus)
