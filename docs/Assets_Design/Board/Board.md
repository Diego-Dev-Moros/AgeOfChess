# Board

---

# 1. Purpose

Define the visual asset rules for the Age of Chess board.

Game design connections:

- [[Game_Design/Rules|Rules]]
- [[Game_Design/Turn_System|Turn System]]
- [[Systems/Terrain/Terrain|Terrain System]]
- [[Systems/Frenzy/Frenzy_Phase|Frenzy Phase]]

---

# 2. Gameplay Role

The board is the tactical play surface. It must show exact piece positions, legal movement, attack targets, and active terrain without visual ambiguity.

---

# 3. Visual Concept

An ancient magical 8x8 stone chess arena with restrained terrain overlays.

---

# 4. Tile Clarity Rules

- Tile size: 64x64 px.
- Playable board size: 512x512 px.
- Grid must remain exact and unwarped.
- Alternating tiles must be separable by value.
- Terrain overlays must not cover more than 25 percent of a tile interior.

---

# 5. Shape and Silhouette Rules

- Board is square.
- Optional decorative frame must stay outside the playable grid.
- Tile edges must not be hidden by props or particles.

---

# 6. Color Rules

Use stone gray as the base, with terrain accents from the shared palette. Selection and move indicators use UI colors, not terrain colors.

---

# 7. Lighting Rules

Top-left light applies to tile bevels. Terrain glow must remain below piece brightness.

---

# 8. Contrast Requirements

Pieces must have stronger visual priority than tile texture. Legal moves and attacks must remain clearer than terrain decoration.

---

# 9. Terrain Variations

| Terrain | Visual Rule |
| --- | --- |
| Neutral | Worn stone, subtle cracks |
| Holy Ground | Pale stone, gold seams, white-blue glow |
| Hell | Basalt, red cracks, ember edges |
| Corrupted | Dark stone, purple stains, toxic green cracks |
| Equal Conditions | Cool gray, blue dice runes, symmetrical motifs |
| Will | Old stone, green growth, gold motes |
| Dirty Play | Muddy stone, red-brown stains, purple shadow marks |

---

# 10. Visual Noise Limits

Avoid large props, heavy particles, high-contrast cracks under pieces, and symbols that resemble legal move indicators.

---

# 11. Readability Requirements

The board must pass:

- 8x8 grid recognized instantly.
- Light and dark pieces readable on all tiles.
- Terrain identity visible but secondary.
- Legal move indicators visible on every terrain.

---

# 12. Variants

- Neutral board.
- Holy Ground board.
- Hell board.
- Corrupted board.
- Equal Conditions board.
- Will board.
- Dirty Play board.

---

# 13. Implementation Notes: Godot

Use `TileMapLayer` or a 512x512 base image with aligned overlays. Keep gameplay highlights above tiles and below pieces. Disable texture filtering.

---

# 14. JSON Design Spec

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
