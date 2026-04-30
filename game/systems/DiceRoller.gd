class_name DiceRoller
extends RefCounted

var rng := RandomNumberGenerator.new()

func _init(seed_value: int = 0) -> void:
	if seed_value == 0:
		rng.randomize()
	else:
		rng.seed = seed_value

func roll_d6(count: int) -> Array[int]:
	var results: Array[int] = []
	for i in range(max(0, count)):
		results.append(rng.randi_range(1, 6))
	results.sort()
	results.reverse()
	return results

func chance(probability: float) -> bool:
	return rng.randf() < clamp(probability, 0.0, 1.0)
