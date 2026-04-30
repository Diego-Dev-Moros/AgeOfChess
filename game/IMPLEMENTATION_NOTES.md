# Age of Chess Prototype Implementation

## Project Structure

```txt
game/
  project.godot
  scenes/
    Main.tscn
  core/
    ActionRequest.gd
  managers/
    GameManager.gd
  pieces/
    Piece.gd
  systems/
    Board.gd
    CombatResolver.gd
    DiceRoller.gd
    TurnManager.gd
  ui/
    MatchUI.gd
```

## Scene Setup

`Main.tscn` is the playable entry scene.

```txt
Main (Node)
  GameManager (Node)
  World (Node2D)
    Board (Node2D)
  UI (CanvasLayer)
    MatchUI (Control)
```

The board uses placeholder rectangles and text labels. There are no production assets yet.

## Current Playable Loop

1. White clicks a piece.
2. `Board.gd` returns legal chess targets, including castling, en passant, promotion, check, and checkmate restrictions.
3. White clicks a highlighted target.
4. `GameManager.gd` submits an `ActionRequest`.
5. Empty-square moves resolve immediately.
6. Non-King attacks resolve through `CombatResolver.gd`.
7. King attacks use Divine Attack if Divinity is available.
8. Board state, HP, Divinity, check, checkmate, and UI are updated.
9. Black CPU chooses a legal action, preferring captures.

## MVP Systems Included

- Board: 8x8 logical and visual board.
- Pieces: type, owner, AD, DD, HP, value, movement state.
- Chess rules: castling, en passant, promotion, check, checkmate, stalemate.
- Combat: D6 rolls, sorting, top-3 dice, pair comparison, ties, momentum, minimum damage, anti-stall.
- HP: pieces survive combat and are removed at HP <= 0.
- King: Divinity, Divine Attack, commitment, recovery, overuse, Thorn, Corrupted, Demon state.
- Card/Terrain MVP: Stone Pieces for White, Cowardice affecting CPU, Will terrain for both sides.
- Frenzy: UI toggle sets all non-King pieces to 1 HP and disables dice/Divine Attack.
- CPU: basic legal-move AI with capture preference.

## Validation Plan

1. Open `game/project.godot` in Godot 4.
2. Run `Main.tscn`.
3. Verify White can select and move legal pieces only.
4. Verify Black CPU responds automatically.
5. Test pawn double move followed by en passant.
6. Clear castling lanes and verify castling appears only when legal.
7. Attack an enemy piece and verify dice, HP, and board position resolve.
8. Move King onto enemy non-King piece and verify Divinity decreases.
9. Toggle Frenzy and verify captures are instant.

Headless smoke test, when Godot is available on PATH:

```txt
godot --headless --path game --script res://tests/SmokeTest.gd
```

## Known Prototype Tradeoffs

- Promotion auto-selects Queen to keep the first loop fast.
- Card assignment is deterministic for testing: White has Stone Pieces, CPU is affected by Cowardice, terrain is Will.
- CPU is intentionally simple and uses no strategic search yet.
