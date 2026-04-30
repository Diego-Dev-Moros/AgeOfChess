extends SceneTree

func _initialize() -> void:
	var board := Board.new()
	root.add_child(board)
	board.setup_initial_position()
	_expect(board.get_all_alive_pieces().size() == 32, "initial setup has 32 pieces")
	_expect(board.get_all_legal_actions(0).size() == 20, "white has 20 legal opening actions")
	_expect(not board.is_player_in_check(0), "white is not initially in check")
	_expect(not board.is_player_in_check(1), "black is not initially in check")

	var white_pawn := board.get_piece_at(Vector2i(4, 6))
	_expect(white_pawn != null and white_pawn.piece_type == Piece.TYPE_PAWN, "white pawn at e2")
	var pawn_moves := board.get_legal_moves_for_piece(white_pawn)
	_expect(pawn_moves.has(Vector2i(4, 5)) and pawn_moves.has(Vector2i(4, 4)), "pawn has one- and two-step opening moves")

	var resolver := CombatResolver.new()
	var attacker := Piece.new("test_attacker", 0, Piece.TYPE_KNIGHT, Vector2i.ZERO)
	var defender := Piece.new("test_defender", 1, Piece.TYPE_BISHOP, Vector2i.ONE)
	var result := resolver.resolve_combat(attacker, defender, {
		"frenzy": false,
		"buff_by_player": {0: "stone_pieces", 1: ""},
		"debuff_by_player": {0: "", 1: ""},
		"terrain": "will",
		"corrupted_failure_by_player": {0: 0.0, 1: 0.0},
		"anti_stall_bonus": 0,
	})
	_expect(result.has("attacker_damage") and result.has("defender_damage"), "combat result has damage fields")
	print("Age of Chess smoke test passed.")
	quit(0)

func _expect(condition: bool, message: String) -> void:
	if condition:
		return
	push_error("Smoke test failed: %s" % message)
	quit(1)
