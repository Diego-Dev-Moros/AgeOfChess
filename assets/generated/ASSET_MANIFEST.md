# Generated Asset Pack

---

# 1. Purpose

This folder contains the first generated visual asset pack for Age of Chess.

These assets were generated with the built-in ChatGPT image generation workflow using the project art direction and asset design documents as the source style guide.

---

# 2. Source Sheets

| Asset Group | Raw Sheet |
| --- | --- |
| Pieces | `pieces/pieces_sprite_sheet_raw.png` |
| Terrain boards | `boards/terrain_boards_sheet_raw.png` |
| Buff cards | `cards/buff_cards_sheet_raw.png` |
| Debuff cards | `cards/debuff_cards_sheet_raw.png` |
| Terrain cards | `cards/terrain_cards_sheet_raw.png` |
| Dice | `dice/dice_sheet_raw.png` |

---

# 3. Usable Extracted Assets

## Pieces

Transparent extracted cells:

- `pieces/individual_alpha_cells/`

Normalized game previews:

- `pieces/sprites_128/`
- `pieces/sprites_48/`

Files:

- `light_pawn.png`
- `light_knight.png`
- `light_bishop.png`
- `light_rook.png`
- `light_queen.png`
- `light_king.png`
- `dark_pawn.png`
- `dark_knight.png`
- `dark_bishop.png`
- `dark_rook.png`
- `dark_queen.png`
- `dark_king.png`

## Boards

Clean board crops:

- `boards/boards_clean/`

Normalized board assets:

- `boards/boards_512/`

Files:

- `neutral.png`
- `holy_ground.png`
- `hell.png`
- `corrupted.png`
- `equal_conditions.png`
- `dirty_play.png`

## Cards

Clean full crops:

- `cards/buffs_clean/`
- `cards/debuffs_clean/`
- `cards/terrains_clean/`

Normalized card previews:

- `cards/buffs_192x288/`
- `cards/debuffs_192x288/`
- `cards/terrains_192x288/`

Buff files:

- `giant_slayer.png`
- `iron_age.png`
- `last_will.png`
- `stone_pieces.png`

Debuff files:

- `cowardice.png`
- `crystal_pieces.png`
- `fatigue.png`
- `immoral.png`

Terrain files:

- `equal_conditions.png`
- `holy_ground.png`
- `hell.png`
- `will.png`
- `dirty_play.png`

## Dice

Transparent extracted cells:

- `dice/individual_alpha_cells/`

Normalized icons:

- `dice/icons_64/`
- `dice/icons_32/`

Dice rows:

- `normal_1.png` through `normal_6.png`
- `attack_1.png` through `attack_6.png`
- `defense_1.png` through `defense_6.png`
- `debuffed_1.png` through `debuffed_6.png`

---

# 4. Production Notes

These are first-pass generated designs, not final hand-cleaned production art.

Known limitations:

- Piece and dice transparency was created from chroma-key removal. Some generated glow may be reduced in the transparent versions.
- The 48x48 piece exports are readable but small; the 128x128 versions are better for visual review.
- Card title plates and text boxes are intentionally blank so Godot can render text dynamically.
- Board crops are normalized to 512x512 for immediate prototype use.

Recommended next step:

1. Wire `boards/boards_512/` into the board background.
2. Wire `pieces/sprites_48/` or `pieces/sprites_128/` into piece rendering.
3. Use card preview folders for selection/reveal UI.
4. Use `dice/icons_32/` for combat UI.
5. After testing in game, hand-clean the chosen assets or regenerate targeted replacements.

---

END
