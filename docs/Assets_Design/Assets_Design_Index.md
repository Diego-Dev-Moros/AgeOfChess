# Assets Design Index

---

# 1. Purpose

This folder defines the production rules for Age of Chess visual assets.

It translates the art direction into practical asset specifications for:

- Cards.
- Chess pieces.
- Board and terrain.
- UI.
- Dice.

All assets must follow the standards defined in:

- [[Art_Direction/Style_Guide|Style Guide]]
- [[Art_Direction/Color_Palette|Color Palette]]
- [[Art_Direction/Lighting_and_Shading|Lighting and Shading]]
- [[Art_Direction/Visual_Identity|Visual Identity]]
- [[Art_Direction/Pixel_Standards|Pixel Standards]]

---

# 2. Structure

```txt
Assets_Design/
|-- Cards/
|   |-- Buffs/
|   |   |-- Giant_Slayer.md
|   |   |-- Iron_Age.md
|   |   |-- Last_Will.md
|   |   |-- Stone_Pieces.md
|   |-- Debuffs/
|   |   |-- Cowardice.md
|   |   |-- Crystal_Pieces.md
|   |   |-- Fatigue.md
|   |   |-- Immoral.md
|   |-- Terrains/
|   |   |-- Dirty_Play.md
|   |   |-- Equal_Conditions.md
|   |   |-- Hell.md
|   |   |-- Holy_Ground.md
|   |   |-- Will.md
|-- Pieces/
|   |-- Pawn.md
|   |-- Knight.md
|   |-- Bishop.md
|   |-- Rook.md
|   |-- Queen.md
|   |-- King.md
|-- Board/
|   |-- Board.md
|-- UI/
|   |-- UI.md
|-- Dice/
|   |-- Dice.md
```

---

# 3. Folder Rules

| Folder | Purpose |
| --- | --- |
| [[Assets_Design/Cards/Cards_Index|Cards]] | Per-card visual specs organized by Buffs, Debuffs, and Terrains |
| [[Assets_Design/Pieces/Pieces_Index|Pieces]] | One file per chess piece |
| [[Assets_Design/Board/Board_Index|Board]] | Board grid and terrain rendering rules |
| [[Assets_Design/UI/UI_Index|UI]] | Interface, card display, HP, and dice display rules |
| [[Assets_Design/Dice/Dice_Index|Dice]] | Dice icon and combat dice rules |

---

# 4. Asset Navigation

## Cards

- [[Assets_Design/Cards/Buffs/Buffs_Assets_Index|Buff Cards Asset Index]]
- [[Assets_Design/Cards/Debuffs/Debuffs_Assets_Index|Debuff Cards Asset Index]]
- [[Assets_Design/Cards/Terrains/Terrains_Assets_Index|Terrain Cards Asset Index]]

## Pieces

- [[Assets_Design/Pieces/Pawn|Pawn Asset]]
- [[Assets_Design/Pieces/Knight|Knight Asset]]
- [[Assets_Design/Pieces/Bishop|Bishop Asset]]
- [[Assets_Design/Pieces/Rook|Rook Asset]]
- [[Assets_Design/Pieces/Queen|Queen Asset]]
- [[Assets_Design/Pieces/King|King Asset]]

## Core Surfaces

- [[Assets_Design/Board/Board|Board Asset]]
- [[Assets_Design/UI/UI|UI Asset]]
- [[Assets_Design/Dice/Dice|Dice Asset]]

---

# 5. Global Asset Rule

No asset should be approved only because it looks good in isolation.

Every asset must be checked against:

- Gameplay readability.
- Shared palette.
- Shared top-left lighting.
- Pixel scale.
- Compatibility with board, cards, UI, and pieces.

---

END
