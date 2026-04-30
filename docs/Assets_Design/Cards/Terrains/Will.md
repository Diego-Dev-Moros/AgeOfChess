# Will

---

# 1. Purpose

Define the visual asset rules for the Will Terrain card.

---

# 2. Gameplay Role

Will suggests global growth, resilience, or scaling pressure. The art must communicate battlefield momentum.

---

# 3. Card Type

Terrain.

---

# 4. Visual Concept

Ancient stone tiles sprout controlled green-gold energy as chess pieces stand more firmly over time.

---

# 5. Border Rules

- Primary border: gold with green accents.
- Secondary trim: stone and parchment.
- Corners may include growing runes and dice seeds.

---

# 6. Layout Rules

- Title: `WILL`.
- Illustration: board grid with rising green-gold energy.
- Text box: empty parchment rectangle.
- Icon usage: growth runes, dice seeds, upward particle lines.
- Background design: ancient stone with controlled life magic.

---

# 7. Shape and Silhouette Rules

Growth effects must stay controlled and not become plant clutter.

---

# 8. Color Rules

Use green, gold, stone gray, and warm parchment.

---

# 9. Lighting Rules

Top-left light plus subtle upward energy.

---

# 10. Readability Requirements

Must read as public scaling terrain, not a single buff.

---

# 11. Variants

- Terrain card.
- Will board overlay.
- Terrain icon.

---

# 12. Implementation Notes: Godot

Use small repeatable motes on board edges, not dense tile interiors.

---

# 13. JSON Design Spec

```json
{
  "asset_name": "Will",
  "type": "card",
  "category": "terrain",
  "resolution": "768x1152 px master, 192x288 px thumbnail",
  "palette": {
    "primary": ["#1F8A4C", "#35C56F", "#8CFFB1"],
    "secondary": ["#8C6324", "#C4923A", "#F0C95A"],
    "accent": ["#A8B0A7", "#FFFBE2", "#2DB6A3"]
  },
  "lighting": {
    "direction": "top-left with subtle upward energy",
    "intensity": "medium-high",
    "contrast": "medium-high"
  },
  "silhouette": {
    "complexity": "medium controlled growth terrain",
    "readability_priority": true
  },
  "style": {
    "theme": "global resilience and scaling momentum",
    "material": "old stone, gold seams, life magic",
    "effects": ["green-gold motes", "rising runes", "subtle board energy"]
  },
  "rules": {
    "must_follow": ["public terrain identity", "green-gold scaling language", "visible board motif", "empty text box"],
    "must_avoid": ["dense vines", "single-card buff confusion", "tile-cluttering growth"]
  }
}
```

---

END
