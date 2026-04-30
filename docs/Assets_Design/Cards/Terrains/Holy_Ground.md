# Holy Ground

---

# 1. Purpose

Define the visual asset rules for the Holy Ground Terrain card.

Game design connections:

- [[Systems/Terrain/Holy_Ground|Holy Ground Rules]]
- [[Systems/Terrain/Terrain|Terrain System]]
- [[Systems/Combat/Damage_Calculation|Damage Calculation]]
- [[Balancing/Card_Balance|Card Balance]]

---

# 2. Gameplay Role

Holy Ground is a recovery or sacred battlefield condition. The art must communicate sanctified terrain without hiding tactical clarity.

---

# 3. Card Type

Terrain.

---

# 4. Visual Concept

A pale stone board is crossed by gold seams and shrine-like light, with chess pieces standing inside a controlled sacred glow.

---

# 5. Border Rules

- Primary border: gold.
- Secondary trim: pale stone and blue-white light.
- Corners may show shrine marks and dice halos.

---

# 6. Layout Rules

- Title: `HOLY GROUND`.
- Illustration: sanctified board tiles and radiant chess forms.
- Text box: empty parchment rectangle.
- Icon usage: halo dice, gold seams, sacred runes.
- Background design: luminous but not washed out.

---

# 7. Shape and Silhouette Rules

Board grid and chess forms must remain readable inside the glow.

---

# 8. Color Rules

Use pale stone, gold, white-blue highlights, and restrained shadow.

---

# 9. Lighting Rules

Top-left light plus soft sacred upglow from terrain cracks.

---

# 10. Readability Requirements

Must read as public holy terrain, not a single-piece buff.

---

# 11. Variants

- Terrain card.
- Holy board overlay.
- Terrain icon.

---

# 12. Implementation Notes: Godot

Use board glow below pieces and below legal move indicators.

---

# 13. JSON Design Spec

```json
{
  "asset_name": "Holy Ground",
  "type": "card",
  "category": "terrain",
  "resolution": "768x1152 px master, 192x288 px thumbnail",
  "palette": {
    "primary": ["#E7C985", "#F0DDA7", "#FFF1C2"],
    "secondary": ["#8C6324", "#C4923A", "#F0C95A"],
    "accent": ["#9DE7FF", "#FFFBE2", "#A8B0A7"]
  },
  "lighting": {
    "direction": "top-left plus sacred terrain glow",
    "intensity": "high but controlled",
    "contrast": "medium-high"
  },
  "silhouette": {
    "complexity": "medium radiant terrain composition",
    "readability_priority": true
  },
  "style": {
    "theme": "sanctified public battlefield",
    "material": "pale stone, gold seams, holy runes",
    "effects": ["white-blue glow", "gold motes", "halo dice"]
  },
  "rules": {
    "must_follow": ["holy terrain identity", "visible grid motif", "gold-white palette", "empty text box"],
    "must_avoid": ["overexposure", "single-piece buff read", "grid-obscuring light"]
  }
}
```

---

END
