# Equal Conditions

---

# 1. Purpose

Define the visual asset rules for the Equal Conditions Terrain card.

---

# 2. Gameplay Role

Equal Conditions reduces extreme dice gaps. The art must communicate symmetry and balance.

---

# 3. Card Type

Terrain.

---

# 4. Visual Concept

A perfectly balanced stone board shows mirrored dice and equal glowing lines between opposing pieces.

---

# 5. Border Rules

- Primary border: cool gray and blue.
- Secondary trim: gold.
- Corners may use mirrored dice symbols.

---

# 6. Layout Rules

- Title: `EQUAL CONDITIONS`.
- Illustration: symmetrical board, paired dice, opposing pieces balanced.
- Text box: empty parchment rectangle.
- Icon usage: scales, mirrored dice, grid motif.
- Background design: calm blue-gray battlefield.

---

# 7. Shape and Silhouette Rules

The composition must be symmetrical and readable.

---

# 8. Color Rules

Use cool gray, blue, white, and restrained gold.

---

# 9. Lighting Rules

Top-left lighting, balanced ambient fill.

---

# 10. Readability Requirements

Must read as global terrain balance, not a player-specific buff.

---

# 11. Variants

- Terrain card.
- Board terrain preview.
- Small terrain icon.

---

# 12. Implementation Notes: Godot

Use the same blue dice-rune motif for the terrain badge and board overlay.

---

# 13. JSON Design Spec

```json
{
  "asset_name": "Equal Conditions",
  "type": "card",
  "category": "terrain",
  "resolution": "768x1152 px master, 192x288 px thumbnail",
  "palette": {
    "primary": ["#3A3E42", "#555B5D", "#777E7A"],
    "secondary": ["#245D8F", "#3CA7D9", "#C4923A"],
    "accent": ["#9DE7FF", "#FFFBE2", "#F0C95A"]
  },
  "lighting": {
    "direction": "top-left with balanced ambient fill",
    "intensity": "medium",
    "contrast": "medium-high"
  },
  "silhouette": {
    "complexity": "medium symmetrical terrain composition",
    "readability_priority": true
  },
  "style": {
    "theme": "balanced public battlefield",
    "material": "cool stone, carved dice runes, gold trim",
    "effects": ["mirrored dice glow", "grid lines", "calm particles"]
  },
  "rules": {
    "must_follow": ["terrain identity", "symmetry", "blue-gray balance language", "empty text box"],
    "must_avoid": ["player-specific faction glow", "chaotic composition", "buff-only green dominance"]
  }
}
```

---

END
