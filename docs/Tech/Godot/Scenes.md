# Scenes

---

# 1. Purpose

This document defines the Godot scene structure for Age of Chess.

The scene architecture must bridge the design source of truth in `docs/` with the implementation in `game/`.

Primary references:

- [[Game_Design/Rules|Rules]]
- [[Systems/Timing/Timing_And_Priority|Timing And Priority]]
- [[Systems/Combat/Combat_Flow|Combat Flow]]
- [[Systems/Cards/Cards_System|Cards System Reference]]
- [[Systems/Terrain/Terrain|Terrain]]
- [[Systems/King/King|King]]
- [[Assets_Design/UI_Design|UI Design]]
- [[Art_Direction/Pixel_Standards|Pixel Standards]]

---

# 2. Technical Baseline

| Decision | Standard |
| --- | --- |
| Engine | Godot 4.x |
| Target platform | Desktop first |
| Future platform | Web export possible, not required for MVP |
| Base resolution | 1280x720 |
| Stretch mode | `canvas_items` |
| Aspect ratio | `keep` |
| Board scale | 8x8 board using 64x64 px tiles |
| Board visual size | 512x512 px |
| MVP input | Click-to-select and click-to-move |
| Future input | Drag-and-drop |
| MVP animation | Minimal feedback only |
| Turn handling | State machine |
| MVP mode | Singleplayer vs AI |
| Future mode | Multiplayer-ready state model |

---

# 3. Scene Principles

Scenes must be functional units.

Rules:

- A scene owns presentation and local node structure.
- Core rules live in scripts and data resources, not in scene trees.
- Game state must be serializable for future multiplayer.
- UI must not directly mutate board state.
- Board visuals must not own combat rules.
- Systems must communicate through managers, signals, and explicit command objects.

---

# 4. MVP Scene List

## 4.1 Main Scene

Path:

```txt
game/scenes/main/Main.tscn
```

Purpose:

The main runtime container for a playable match.

Responsibilities:

- Load and connect board, UI, camera, and system managers.
- Start match setup.
- Hold top-level references to game services.
- Own global match lifecycle.
- Route high-level signals between systems.

Must not:

- Contain chess movement rules.
- Resolve combat directly.
- Store card effect logic directly.

Connections:

- Instantiates `Board.tscn`.
- Instantiates `MatchUI.tscn`.
- Owns or references `GameManager.gd`.
- Starts the `TurnStateMachine.gd`.

Lifecycle:

1. Load match configuration.
2. Initialize terrain, cards, pieces, and timers.
3. Build board visuals.
4. Enable input.
5. Run turn state machine.
6. Resolve game over.
7. Return to menu or restart.

---

## 4.2 Main Menu Scene

Path:

```txt
game/scenes/ui/MainMenu.tscn
```

Purpose:

Entry scene for the downloadable MVP.

Responsibilities:

- Start new match.
- Open settings.
- Quit game.
- Later: choose AI difficulty, local profile, multiplayer entry.

MVP requirement:

- Include at least a direct `Start Game` flow.

---

## 4.3 Match Setup Scene

Path:

```txt
game/scenes/ui/MatchSetup.tscn
```

Purpose:

Prepare a match before loading the board.

Responsibilities:

- Select or randomize terrain.
- Assign hidden buff and debuff cards.
- Select side and AI opponent settings.
- Build `MatchConfig` data.

MVP allowance:

- This can be simplified into automatic setup if the first playable build needs faster delivery.

---

## 4.4 Board Scene

Path:

```txt
game/scenes/board/Board.tscn
```

Purpose:

Render and interact with the chess board.

Responsibilities:

- Display the 8x8 board.
- Display terrain overlays.
- Display pieces.
- Display legal move highlights.
- Convert mouse input into board coordinates.
- Emit board interaction requests.

Must not:

- Decide if a move is legal.
- Apply combat damage.
- Apply card effects.
- Determine checkmate.

Connections:

- Uses `BoardController.gd`.
- Uses `TileMapLayer` or Godot 4 TileMap workflow for board visuals.
- Spawns `PieceView.tscn` for each active piece.
- Sends input requests to `InputController.gd` or `GameManager.gd`.

---

## 4.5 Piece Scene

Path:

```txt
game/scenes/pieces/PieceView.tscn
```

Purpose:

Visual representation of one piece.

Responsibilities:

- Display piece sprite.
- Display selection state.
- Display HP indicator anchor.
- Display status overlays.
- Play movement, hit, death, and future pixel animations.

Must not:

- Store authoritative HP.
- Decide valid movement.
- Resolve attacks.

Authoritative piece data belongs to `PieceModel.gd` or a serializable state object.

---

## 4.6 Match UI Scene

Path:

```txt
game/scenes/ui/MatchUI.tscn
```

Purpose:

Main in-match interface.

Layout standard:

- Center: board.
- Top: turn indicator, game state, timer, King Divinity.
- Bottom: card hand and selected card information.
- Right: combat log and move history.
- Floating: HP bars, damage numbers, dice results.
- Modal layer: game over and major King state events.

Responsibilities:

- Display current player.
- Display match timer and Frenzy state.
- Display selected piece information.
- Display card hand and reveal states.
- Display terrain.
- Display combat logs and dice results.
- Display game over state.

Must not:

- Mutate game state directly.
- Roll dice.
- Apply card effects.

---

## 4.7 Combat Feedback Scene

Path:

```txt
game/scenes/ui/CombatFeedback.tscn
```

Purpose:

Show combat resolution without owning combat rules.

Responsibilities:

- Display attack dice and defense dice.
- Highlight top 3 used dice.
- Dim ignored dice.
- Display damage assignment.
- Display card or terrain modifiers that reveal publicly.

MVP scope:

- Can be a simple panel or floating UI.
- Dice animation is optional.

Future scope:

- Dice roll animation.
- Combat camera emphasis.
- Pixel-art hit and death effects.

---

## 4.8 Card Scene

Path:

```txt
game/scenes/ui/CardView.tscn
```

Purpose:

Display one card in hand, revealed state, hidden state, or log state.

Responsibilities:

- Render card frame.
- Render card title.
- Render dynamic text.
- Render hidden or revealed state.
- Emit selection requests for future active cards.

MVP rule:

- Current cards are passive and secretly active from match start.
- Manual card activation is not required for MVP.

---

## 4.9 Modal Scene

Path:

```txt
game/scenes/ui/EventModal.tscn
```

Purpose:

Display high-impact events.

Allowed uses:

- Game over.
- Checkmate.
- Frenzy begins.
- Major King state changes.
- Future multiplayer disconnect or reconnect states.

Must not be used for:

- Routine combat.
- Normal move confirmation.
- Basic card reveal.

---

# 5. Future Scene Extensions

The following scenes are allowed after the MVP foundation is stable:

| Scene | Purpose |
| --- | --- |
| `Settings.tscn` | Resolution, audio, input, accessibility |
| `CardCollection.tscn` | Inspect available cards |
| `MultiplayerLobby.tscn` | Matchmaking or direct connection |
| `ReplayViewer.tscn` | State replay from command history |
| `DebugMatch.tscn` | Developer test board and forced scenarios |

---

# 6. Scene Connection Flow

```txt
MainMenu
  -> MatchSetup
    -> Main
      -> Board
        -> PieceView
      -> MatchUI
        -> CardView
        -> CombatFeedback
        -> EventModal
```

---

# 7. Scene Lifecycle Contract

Runtime scenes must follow this sequence:

1. Data loaded.
2. Systems initialized.
3. Scene visuals built from state.
4. Input enabled.
5. Player or AI submits an action request.
6. State machine validates and resolves the request.
7. Visuals update from final state.
8. Logs and UI update.
9. Turn advances.

Visuals are always downstream of authoritative state.

---

END
