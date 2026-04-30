# Naming Conventions

---

# 1. Purpose

This document defines naming rules for Age of Chess.

Consistent naming prevents confusion as systems, cards, pieces, terrain, assets, scenes, and scripts grow.

Primary references:

- [[Design_Node_Map]]
- [[Tech/Godot/Scenes|Scenes]]
- [[Tech/Godot/Scripts|Scripts]]
- [[Tech/Asset_Pipeline|Asset Pipeline]]

---

# 2. General Rules

Rules:

- Names must describe purpose, not implementation accidents.
- Use one name for one concept across docs, assets, and code.
- Do not mix abbreviations unless the abbreviation is defined.
- Avoid spaces in file names used by Godot.
- Keep Obsidian page names readable.
- Keep Godot asset paths lowercase where practical.

---

# 3. Obsidian Documents

Use readable `Pascal_Case` or title-style names matching the current vault.

Examples:

```txt
Rules.md
Combat_System.md
Timing_And_Priority.md
Giant_Slayer.md
Dirty_Play.md
```

System folders use plural or domain names:

```txt
Systems/Combat/
Systems/Cards/
Systems/Terrain/
Assets_Design/Pieces/
```

---

# 4. Godot Scene Files

Use `PascalCase`.

Examples:

```txt
Main.tscn
Board.tscn
PieceView.tscn
MatchUI.tscn
CardView.tscn
CombatFeedback.tscn
EventModal.tscn
```

Rule:

Scene file name should match the scene root node name.

---

# 5. GDScript Files

Use `PascalCase` for scripts that define classes or major systems.

Examples:

```txt
GameManager.gd
TurnStateMachine.gd
CombatResolver.gd
DamageCalculator.gd
CardSystem.gd
TerrainSystem.gd
KingSystem.gd
PieceModel.gd
PieceView.gd
```

Rule:

If a script has `class_name`, the file name should match the class name.

Example:

```gdscript
class_name CombatResolver
```

---

# 6. Godot Nodes

Use `PascalCase` for node names.

Examples:

```txt
GameManager
TurnStateMachine
BoardVisual
TerrainOverlay
LegalMoveHighlights
PieceSprite
BottomActionBar
CombatLogPanel
```

Rules:

- Node names should express scene responsibility.
- Avoid names like `Node2D`, `Control2`, or `Sprite`.
- Repeated generated nodes may include ids only when needed for debugging.

---

# 7. Variables And Functions

Use `snake_case` for variables and functions.

Examples:

```gdscript
var current_player: int
var selected_piece_id: String
var active_terrain_id: String

func validate_move(action_request: ActionRequest) -> bool:
func resolve_combat(attacker_id: String, defender_id: String) -> CombatResult:
func apply_card_modifiers(context: EffectContext) -> EffectResult:
```

Constants use `SCREAMING_SNAKE_CASE`.

Examples:

```gdscript
const BOARD_SIZE := 8
const TILE_SIZE := 64
const MAX_DIVINITY := 3
```

---

# 8. Signals

Use past-tense or event-style `snake_case`.

Examples:

```gdscript
signal action_requested(action_request)
signal turn_started(player_id)
signal combat_resolved(result)
signal card_revealed(card_id, owner_id)
signal game_over(result)
```

Rules:

- Signals report events.
- Signals should not sound like commands.

---

# 9. Enums

Use `PascalCase` enum names and `SCREAMING_SNAKE_CASE` values.

Example:

```gdscript
enum TurnState {
    MATCH_SETUP,
    TURN_START,
    AWAITING_ACTION,
    VALIDATING_ACTION,
    RESOLVING_MOVE,
    RESOLVING_COMBAT,
    APPLYING_EFFECTS,
    CHECK_VALIDATION,
    TURN_END,
    GAME_OVER
}
```

---

# 10. IDs

Use lowercase `snake_case` for serializable ids.

Examples:

```txt
pawn
white_king
giant_slayer
crystal_pieces
dirty_play
equal_conditions
```

Reason:

IDs are used in saves, multiplayer payloads, resources, and logs. They must stay stable.

---

# 11. Asset Files

Use lowercase `snake_case`.

Pattern:

```txt
category_subject_variant_state_size.ext
```

Examples:

```txt
piece_white_pawn_idle_48.png
piece_black_king_damaged_48.png
tile_board_light_64.png
tile_board_dark_64.png
terrain_holy_ground_overlay_64.png
card_buff_giant_slayer_thumb_192x288.png
card_back_default_192x288.png
ui_icon_divinity_24.png
dice_d6_face_6_24.png
```

Rules:

- Include size when multiple production sizes exist.
- Include faction when the asset is faction-specific.
- Include state when the asset represents a gameplay state.

---

# 12. Resource Files

Use lowercase `snake_case`.

Examples:

```txt
piece_stats_pawn.tres
piece_stats_queen.tres
card_buff_giant_slayer.tres
card_debuff_cowardice.tres
terrain_holy_ground.tres
terrain_dirty_play.tres
```

---

# 13. Folder Names

Use lowercase `snake_case` for Godot implementation folders.

Examples:

```txt
game/scripts/combat/
game/scripts/cards/
game/scripts/terrain/
game/scenes/ui/
game/resources/pieces/
assets/art/pieces/
```

Existing documentation folders may keep their current readable naming convention.

---

# 14. Prefix Standards

Use stable prefixes for asset and resource files.

| Prefix | Use |
| --- | --- |
| `piece_` | Piece sprites |
| `tile_` | Board tiles |
| `terrain_` | Terrain overlays and resources |
| `card_` | Card art and card resources |
| `dice_` | Dice icons and dice UI |
| `ui_` | Interface icons and panels |
| `sfx_` | Sound effects |
| `music_` | Music tracks |
| `anim_` | Animation resources |

---

# 15. Terminology Standard

Use these exact terms:

| Concept | Standard Term |
| --- | --- |
| Attack Dice | `attack_dice` |
| Defense Dice | `defense_dice` |
| Health Points | `hp` |
| Divinity | `divinity` |
| Frenzy Phase | `frenzy` |
| Buff | `buff` |
| Debuff | `debuff` |
| Terrain | `terrain` |
| Combat Result | `combat_result` |
| Action Request | `action_request` |
| Board Coordinate | `board_coord` |

---

# 16. Anti-Patterns

Avoid:

```txt
new_script.gd
manager2.gd
piece_final_final.png
card_test.png
Sprite3
Node2D4
do_stuff()
```

Replace with:

```txt
CombatResolver.gd
TurnManager.gd
piece_white_rook_idle_48.png
card_buff_last_will_thumb_192x288.png
PieceSprite
BoardVisual
resolve_combat()
```

---

END
