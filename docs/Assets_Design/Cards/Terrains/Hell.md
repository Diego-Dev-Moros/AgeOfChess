# Hell

---

# 1. Purpose

Define the visual asset rules for the Hell Terrain card.

Game design connections:

- [[Systems/Terrain/Hell|Hell Rules]]
- [[Systems/Terrain/Terrain|Terrain System]]
- [[Systems/Combat/Damage_Calculation|Damage Calculation]]
- [[Balancing/Card_Balance|Card Balance]]

---

# 2. Gameplay Role

Hell is an attrition battlefield. The art must communicate danger and heat without turning the board unreadable.

---

# 3. Card Type

Terrain.

---

# 4. Visual Concept

An 8x8 basalt board cracks with red lava seams while dice sink into ember-lit stone.

---

# 5. Border Rules

- Primary border: blackened metal and red.
- Secondary trim: burnt gold.
- Corners may include ember dice and cracked stone.

---

# 6. Layout Rules

- Title: `HELL`.
- Illustration: basalt board, lava cracks, threatening atmosphere.
- Text box: empty parchment rectangle.
- Icon usage: ember dice, flame cracks, black stone runes.
- Background design: dark red volcanic field.

---

# 7. Shape and Silhouette Rules

The board/grid motif must remain visible. Flame shapes must not fill the composition.

---

# 8. Color Rules

Use dark basalt, blood red, ember orange, and burnt gold.

---

# 9. Lighting Rules

Top-left light plus red underglow from cracks.

---

# 10. Readability Requirements

Must read as terrain hazard, not a debuff card applied to one player.

---

# 11. Variants

- Terrain card.
- Hell board overlay.
- Terrain icon.

---

# 12. Implementation Notes: Godot

Keep lava effects low in opacity under pieces; legal move indicators must remain above terrain.

---

# 13. JSON Design Spec

```json
{
  "asset_name": "Hell",
  "type": "card",
  "category": "terrain",
  "resolution": "768x1152 px master, 192x288 px thumbnail",
  "palette": {
    "primary": ["#080A0B", "#1B2421", "#3A3E42"],
    "secondary": ["#6B1618", "#B9342B", "#8C6324"],
    "accent": ["#FF6A4D", "#F47A32", "#F0C95A"]
  },
  "lighting": {
    "direction": "top-left with lava underglow",
    "intensity": "high in cracks, medium elsewhere",
    "contrast": "high"
  },
  "silhouette": {
    "complexity": "medium hazardous terrain composition",
    "readability_priority": true
  },
  "style": {
    "theme": "attrition battlefield hazard",
    "material": "basalt, lava seams, burnt metal",
    "effects": ["embers", "red cracks", "heat particles"]
  },
  "rules": {
    "must_follow": ["terrain identity", "basalt board motif", "red hazard language", "empty text box"],
    "must_avoid": ["unreadable flame clutter", "pure debuff card framing", "grid-obscuring lava"]
  }
}
```

---

END
