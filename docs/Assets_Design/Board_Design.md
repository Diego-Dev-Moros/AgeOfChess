# Board Design

---

# 1. Purpose

The board is the tactical play surface.

Its main job is clarity, not spectacle.

Design node connections:

- [[Design_Node_Map]]
- [[Assets_Design/Board/Board_Index|Board Asset Design Index]]
- [[Assets_Design/Board/Board|Board Asset]]
- [[Game_Design/Rules|Rules]]
- [[Game_Design/Turn_System|Turn System]]
- [[Systems/Terrain/Terrain|Terrain System]]
- [[Systems/Frenzy/Frenzy_Phase|Frenzy Phase]]
- [[Art_Direction/Pixel_Standards|Pixel Standards]]
- [[Art_Direction/Color_Palette|Color Palette]]

---

# 2. Gameplay Role

The board must show:

- Exact 8x8 tile layout.
- Piece positions.
- Legal movement and attack targeting.
- Active terrain condition.
- Selection states.

The board must never compete with pieces for visual priority.

---

# 3. Visual Concept

The board is an ancient magical chess arena made of carved stone tiles.

Terrain changes alter texture, glow, and environmental accents, but the grid remains stable.

---

# 4. Tile Clarity Rules

- Tile size is 64x64 px.
- Full board base is 512x512 px.
- Light and dark tiles must remain distinguishable in value.
- Grid boundaries must be visible on every terrain.
- Tile texture must be clustered and low-noise.
- Terrain overlay must not cover more than 25 percent of a tile interior.

---

# 5. Contrast Requirements

- Piece silhouettes must remain stronger than tile texture.
- Active selection and attack indicators must be clearer than decorative terrain glow.
- Do not use pure black or pure white tiles.
- Terrain variants must preserve alternating tile readability.

---

# 6. Terrain Variations

| Terrain | Visual Treatment |
| --- | --- |
| Neutral | Worn stone, subtle cracks, low gold dust |
| Holy Ground | Pale stone, gold seams, white-blue shrine glow |
| Hell | Basalt stone, red cracks, ember edges |
| Corrupted | Dark stone, purple stains, toxic green cracks |
| Equal Conditions | Cool gray stone, blue dice runes, symmetrical motifs |
| Will | Old stone, green growth, small gold motes |
| Dirty Play | Muddy stone, scuffed edges, red-brown stains, subtle purple shadows |

---

# 7. Visual Noise Limits

Avoid:

- Large props inside playable tiles.
- Heavy grass, lava, smoke, or particles under pieces.
- High-contrast cracks crossing tile boundaries.
- Decorative symbols that resemble legal move indicators.
- Terrain effects that hide HP, selection, or targeting overlays.

Allowed:

- Low-value stone texture.
- Small corner chips.
- Subtle rune marks.
- Controlled edge glow.

---

# 8. Shape and Silhouette Rules

- Board is square.
- Tile grid is exact and unwarped.
- Optional arena border must not reduce playable tile size.
- If a decorative outer frame is used, keep it outside the 512x512 playable grid.

---

# 9. Color Rules

- Neutral board uses stone gray and parchment dust.
- Terrain accents use the palette defined in `Color_Palette.md`.
- Selection indicators should use consistent UI colors, not terrain colors.

---

# 10. Lighting Rules

- Top-left light applies to tile bevels and board frame.
- Terrain glow may be local but must remain below piece brightness.
- Contact shadows from pieces must be visible on all tile colors.

---

# 11. Readability Requirements

The board must pass:

- 8x8 grid recognized instantly.
- Legal moves visible on every terrain.
- Light and dark faction pieces readable on every tile.
- Terrain identity recognized without obscuring gameplay.

---

# 12. Variants

Required:

- Neutral board.
- Holy Ground.
- Hell.
- Corrupted.
- Equal Conditions.
- Will.
- Dirty Play.

Optional:

- Board edge frame.
- Animated terrain overlay.
- Low-intensity ambient particles outside the playable grid.

---

# 13. Implementation Notes: Godot

- Build the board from 64x64 tile assets or a 512x512 full-board image with a grid-aligned overlay.
- Use `TileMapLayer` or equivalent tile-based structure for terrain.
- Keep gameplay highlights in separate layers above tiles and below pieces.
- Disable filtering for board textures.
- Do not bake legal move indicators into board art.

---

# 14. Board JSON

```json
{
  "asset_name": "Chess Board",
  "type": "tilemap",
  "category": "board",
  "resolution": "64x64 px tile, 512x512 px playable board",
  "palette": {
    "primary": ["#3A3E42", "#555B5D", "#777E7A"],
    "secondary": ["#E7C985", "#8C6324", "#245D8F"],
    "accent": ["#F0C95A", "#FF6A4D", "#7131A4", "#91E36A"]
  },
  "lighting": {
    "direction": "top-left",
    "intensity": "low-medium on tiles, medium on outer frame",
    "contrast": "medium, lower than pieces"
  },
  "silhouette": {
    "complexity": "low grid complexity with restrained terrain detail",
    "readability_priority": true
  },
  "style": {
    "theme": "ancient magical chess arena",
    "material": "carved stone, marble, basalt, terrain magic",
    "effects": ["subtle runes", "low glow", "small cracks", "controlled terrain overlays"]
  },
  "rules": {
    "must_follow": ["exact 8x8 grid", "64x64 tile alignment", "clear alternating tiles", "terrain below piece priority", "low-noise tile interiors"],
    "must_avoid": ["cluttered tiles", "props inside gameplay cells", "grid-obscuring glow", "high-contrast texture under pieces"]
  }
}
```

---

END
