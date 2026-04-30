# Dice

---

# 1. Purpose

Define the visual asset rules for dice icons and combat dice.

Game design connections:

- [[Systems/Combat/Dice_System|Dice System]]
- [[Systems/Combat/Combat_Flow|Combat Flow]]
- [[Systems/Combat/Damage_Calculation|Damage Calculation]]
- [[Systems/Timing/Timing_And_Priority|Timing And Priority]]

---

# 2. Gameplay Role

Dice communicate attack rolls, defense rolls, used values, ignored values, and buff/debuff modifications.

---

# 3. Visual Concept

Carved arcane six-sided dice made of stone or bone with high-contrast pips or rune cuts.

---

# 4. Shape and Readability

- Dice icon: 24x24 px.
- Combat dice: 32x32 px.
- Cube silhouette must be clear.
- Pips or values must be the highest-contrast element.
- Standard dice must not use decorative faces that replace readable values.

---

# 5. Shape and Silhouette Rules

Use a simple cube with 2-3 visible faces. Avoid complex perspective that makes values hard to read.

---

# 6. Color Rules

- Normal dice: stone gray, ivory, dark outline.
- Attack dice: warm gold or white accent.
- Defense dice: cool blue or teal accent.
- Buff dice: green or blue accent.
- Debuff dice: red or purple accent.
- Ignored dice: desaturated gray.

---

# 7. Lighting Rules

Top-left highlight on the cube edge. Lower-right shadow. Pips may glow but must remain countable.

---

# 8. Style

Dice should feel arcane and physical, not flat UI clipart.

---

# 9. Buff/Debuff Variations

Buff dice use clean green or blue glow and upward particles.

Debuff dice use cracks, purple or red glow, and slight distortion.

---

# 10. Readability Requirements

Dice values must be readable at 24x24 px on both dark and parchment backgrounds.

---

# 11. Variants

- Normal d6 faces 1-6.
- Attack dice faces 1-6.
- Defense dice faces 1-6.
- Buffed dice faces 1-6.
- Debuffed dice faces 1-6.
- Ignored dice faces 1-6.
- Used dice faces 1-6.
- Optional rolling animation frames.

---

# 12. Implementation Notes: Godot

Use dice face atlases at 24x24 and 32x32. Animate rolls with frame swaps, not blur. Hold final results long enough for parsing.

---

# 13. JSON Design Spec

```json
{
  "asset_name": "Combat Dice",
  "type": "icon_sprite",
  "category": "dice",
  "resolution": "24x24 px icon, 32x32 px combat display",
  "palette": {
    "primary": ["#A8B0A7", "#777E7A", "#3A3E42"],
    "secondary": ["#245D8F", "#2DB6A3", "#C4923A"],
    "accent": ["#FFFBE2", "#35C56F", "#B9342B", "#7131A4"]
  },
  "lighting": {
    "direction": "top-left",
    "intensity": "medium-high on pips and top edge",
    "contrast": "high for dice values"
  },
  "silhouette": {
    "complexity": "low cube silhouette with readable face marks",
    "readability_priority": true
  },
  "style": {
    "theme": "arcane tactical combat chance",
    "material": "carved stone, bone, rune-cut pips",
    "effects": ["pip glow", "state aura", "crack overlay", "used dice outline"]
  },
  "rules": {
    "must_follow": ["readable values", "six-sided identity", "distinct attack and defense states", "distinct used and ignored states", "top-left lighting"],
    "must_avoid": ["blurred rolling result", "decorative faces replacing values", "low-contrast pips", "overlarge glow hiding numbers"]
  }
}
```

---

END
