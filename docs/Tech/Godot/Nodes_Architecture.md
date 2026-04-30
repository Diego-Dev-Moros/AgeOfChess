# Nodes Architecture

---

# 1. Purpose

This document defines the Godot node hierarchy for the core scenes.

The goal is to keep scene trees readable, separate logic from visuals, and prevent gameplay rules from being hidden inside presentation nodes.

Primary references:

- [[Tech/Godot/Scenes|Scenes]]
- [[Tech/Godot/Scripts|Scripts]]
- [[Assets_Design/UI_Design|UI Design]]
- [[Art_Direction/Pixel_Standards|Pixel Standards]]

---

# 2. Node Architecture Principles

Rules:

- Use `Node2D` for board-world presentation.
- Use `Control` for UI.
- Use `CanvasLayer` for HUD and modal overlays.
- Keep authoritative state outside visual nodes.
- Use signals for interaction events.
- Use scene instances for repeated elements such as pieces and cards.
- Avoid one giant scene that owns every rule.

---

# 3. Main Scene

Path:

```txt
game/scenes/main/Main.tscn
```

Node hierarchy:

```txt
Main (Node)
├── Systems (Node)
│   ├── GameManager (Node)
│   ├── TurnStateMachine (Node)
│   ├── TimerSystem (Node)
│   ├── CardSystem (Node)
│   ├── TerrainSystem (Node)
│   ├── KingSystem (Node)
│   └── AIController (Node)
├── World (Node2D)
│   ├── Camera2D
│   └── Board (Board.tscn)
└── UI (CanvasLayer)
    └── MatchUI (MatchUI.tscn)
```

Responsibilities:

- `Systems`: non-visual runtime services.
- `World`: board-space visuals.
- `UI`: screen-space interface.

Camera standard:

- Fixed camera for MVP.
- No zoom or panning required for MVP.
- Future zoom must preserve pixel clarity.

---

# 4. Board Scene

Path:

```txt
game/scenes/board/Board.tscn
```

Node hierarchy:

```txt
Board (Node2D)
├── BoardVisual (Node2D)
│   ├── BaseTiles (TileMapLayer)
│   ├── TerrainOverlay (TileMapLayer)
│   └── CoordinateMarkers (Node2D)
├── Highlights (Node2D)
│   ├── SelectionHighlight (Node2D)
│   ├── LegalMoveHighlights (Node2D)
│   └── TargetHighlights (Node2D)
├── Pieces (Node2D)
├── FloatingFeedback (Node2D)
│   ├── DamageNumbers (Node2D)
│   └── WorldDiceAnchors (Node2D)
└── InputArea (Area2D)
    └── CollisionShape2D
```

Responsibilities:

- `BaseTiles`: 8x8 board tiles.
- `TerrainOverlay`: public terrain visuals.
- `Highlights`: legal moves, selected square, valid targets.
- `Pieces`: instances of `PieceView.tscn`.
- `FloatingFeedback`: world-space effects such as damage numbers.
- `InputArea`: board click detection.

Coordinate standard:

```txt
board coordinate: Vector2i(file, rank)
file range: 0..7
rank range: 0..7
tile size: 64x64 px
```

Visual origin:

- The board scene should define one stable origin.
- All piece positions are derived from board coordinates.
- No piece should store its own independent board-space truth.

---

# 5. Piece Scene

Path:

```txt
game/scenes/pieces/PieceView.tscn
```

Node hierarchy:

```txt
PieceView (Node2D)
├── Shadow (Sprite2D)
├── Sprite (Sprite2D)
├── StateOverlays (Node2D)
│   ├── SelectionOutline (Sprite2D)
│   ├── BuffOverlay (Sprite2D)
│   └── DebuffOverlay (Sprite2D)
├── HPAnchor (Marker2D)
├── AnimationPlayer
└── Hitbox (Area2D)
    └── CollisionShape2D
```

Responsibilities:

- `Sprite`: piece image.
- `StateOverlays`: visual states only.
- `HPAnchor`: position used by UI or floating HP indicators.
- `AnimationPlayer`: MVP movement and hit feedback.
- `Hitbox`: optional direct piece interaction.

Pixel standard:

- Piece sprites are 48x48 px.
- Tile size is 64x64 px.
- Piece base must align to tile center.

---

# 6. Match UI Scene

Path:

```txt
game/scenes/ui/MatchUI.tscn
```

Node hierarchy:

```txt
MatchUI (Control)
├── TopBar (Control)
│   ├── TurnIndicator (Label)
│   ├── GameStateLabel (Label)
│   ├── TimerLabel (Label)
│   └── KingStatusPanel (Control)
├── BoardFrameAnchor (Control)
├── RightPanel (Control)
│   ├── TerrainPanel (Control)
│   ├── SelectedPiecePanel (Control)
│   └── CombatLogPanel (Control)
├── BottomActionBar (Control)
│   ├── CardHand (HBoxContainer)
│   └── CardInfoPanel (Control)
├── FloatingLayer (Control)
│   ├── HPIndicators (Control)
│   ├── DamageNumbers (Control)
│   └── DiceResultOverlay (Control)
└── ModalLayer (Control)
    └── EventModal (EventModal.tscn)
```

Layout standard:

- Board remains central and prominent.
- Cards belong in the bottom action bar.
- Combat log and move history belong in the right panel.
- HP and damage feedback may float near pieces.
- Major events use modal layer only.

MVP UI priority:

1. Turn and active player.
2. Legal selection feedback.
3. Piece HP.
4. Dice and combat result.
5. Card reveal state.
6. Terrain state.
7. Move and combat history.

---

# 7. Combat Feedback Scene

Path:

```txt
game/scenes/ui/CombatFeedback.tscn
```

Node hierarchy:

```txt
CombatFeedback (Control)
├── AttackerPanel (Control)
│   ├── AttackerName (Label)
│   └── AttackerDiceRow (HBoxContainer)
├── DefenderPanel (Control)
│   ├── DefenderName (Label)
│   └── DefenderDiceRow (HBoxContainer)
├── ComparisonPanel (Control)
├── ModifierPanel (Control)
└── DamageSummary (Label)
```

Rules:

- Used dice are visually emphasized.
- Ignored dice are dimmed.
- Revealed card and terrain modifiers are shown.
- The scene receives `CombatResult`; it does not calculate combat.

---

# 8. Card View Scene

Path:

```txt
game/scenes/ui/CardView.tscn
```

Node hierarchy:

```txt
CardView (Control)
├── Frame (TextureRect)
├── CardArt (TextureRect)
├── TypeBadge (TextureRect)
├── TitleLabel (Label)
├── RulesText (RichTextLabel)
├── HiddenOverlay (TextureRect)
└── SelectionHighlight (TextureRect)
```

Rules:

- Card text is dynamic.
- Hidden cards use `HiddenOverlay`.
- Revealed cards show type and title clearly.
- Card art keeps a 2:3 ratio.

---

# 9. Main Menu Scene

Path:

```txt
game/scenes/ui/MainMenu.tscn
```

Node hierarchy:

```txt
MainMenu (Control)
├── Background (TextureRect)
├── TitleLabel (Label)
├── MenuButtons (VBoxContainer)
│   ├── StartGameButton (Button)
│   ├── SettingsButton (Button)
│   └── QuitButton (Button)
└── VersionLabel (Label)
```

MVP requirement:

- `StartGameButton` must start a playable match.

---

# 10. Input Priority

Input must resolve in this order:

1. Modal UI.
2. Active card or UI panel.
3. Board selection.
4. Piece selection.
5. Empty board click.

Rules:

- UI consumes input before the board.
- Board input emits action intent only.
- Turn state machine decides whether the action is legal.

---

# 11. Logic And Visual Separation

Allowed in visual nodes:

- Sprite changes.
- Highlight changes.
- Tweens.
- Local UI state.
- Signals for user intent.

Forbidden in visual nodes:

- Damage calculation.
- Dice rolling.
- Card effect rules.
- Checkmate logic.
- Terrain rule enforcement.
- AI move selection.

---

# 12. MVP Node Scope

Minimum required for the first playable build:

- `Main.tscn`
- `MainMenu.tscn`
- `Board.tscn`
- `PieceView.tscn`
- `MatchUI.tscn`
- `CardView.tscn`
- `CombatFeedback.tscn`

Optional for MVP:

- `MatchSetup.tscn`
- `Settings.tscn`
- Advanced event modals
- Drag-and-drop helper nodes

---

END
