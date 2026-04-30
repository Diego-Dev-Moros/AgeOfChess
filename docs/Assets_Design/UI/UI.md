# UI

---

# 1. Purpose

Define the visual asset rules for the Age of Chess user interface.

---

# 2. Gameplay Role

The UI communicates turn state, selected piece information, HP, dice results, cards, terrain, and interaction feedback.

---

# 3. Visual Concept

A restrained magical medieval strategy interface using parchment, stone panels, dark metal, and gold trim.

---

# 4. Minimal vs Decorative UI

Functional UI must be minimal. Decorative treatment is reserved for card frames, reveal moments, main match panels, and endgame states.

---

# 5. Shape and Silhouette Rules

- Icons use 16x16 px or 24x24 px.
- Panels use square or lightly rounded pixel corners.
- Buttons should be icon-first.
- Avoid ornate controls for frequent actions.

---

# 6. Color Rules

- Neutral UI: dark stone, parchment, antique gold.
- Buff states: green or blue.
- Debuff states: purple or red.
- Terrain states: terrain-specific accent.
- Disabled states: desaturated gray.

---

# 7. Lighting Rules

Top-left bevel highlights. Active states may glow softly. No blur.

---

# 8. Card Display Rules

- Hidden cards use a card back with dice and rune motifs.
- Revealed cards show type color, title, and illustration.
- Text should be rendered dynamically.
- Small previews prioritize type color over illustration detail.

---

# 9. HP Indicators

HP must be readable over every terrain. Use pips, compact chips, or numeric badges with dark backing.

---

# 10. Dice Display

Dice UI must distinguish attack dice, defense dice, rolled values, used top 3 dice, ignored dice, and modified dice.

---

# 11. Readability Requirements

The UI must show current turn, selected piece, HP, dice values, and card type without requiring decorative interpretation.

---

# 12. Variants

- Normal panel.
- Active panel.
- Disabled panel.
- Hovered button.
- Selected button.
- Hidden card slot.
- Revealed card slot.
- HP normal, damaged, critical.
- Dice normal, used, ignored, modified.

---

# 13. Implementation Notes: Godot

Use `Control` nodes, `TextureRect`, `NinePatchRect`, and theme resources. Disable filtering. Keep changing values dynamic and localizable.

---

# 14. JSON Design Spec

```json
{
  "asset_name": "Game UI",
  "type": "interface",
  "category": "ui",
  "resolution": "16x16 px and 24x24 px icons, scalable pixel panels",
  "palette": {
    "primary": ["#111817", "#3A3E42", "#E7C985"],
    "secondary": ["#8C6324", "#C4923A", "#F0C95A"],
    "accent": ["#35C56F", "#3CA7D9", "#B9342B", "#7131A4"]
  },
  "lighting": {
    "direction": "top-left",
    "intensity": "medium on active elements, low on passive panels",
    "contrast": "high for text and values, medium for decoration"
  },
  "silhouette": {
    "complexity": "low functional shapes with moderate fantasy trim",
    "readability_priority": true
  },
  "style": {
    "theme": "restrained magical medieval strategy interface",
    "material": "parchment, stone, dark metal, gold trim",
    "effects": ["pixel bevel", "state glow", "hard shadow", "small rune accents"]
  },
  "rules": {
    "must_follow": ["dynamic text", "readable HP", "clear dice values", "icon-first controls", "consistent state colors"],
    "must_avoid": ["ornament over information", "large unreadable panels", "blurred UI", "baked gameplay values", "terrain-colored selection ambiguity"]
  }
}
```

---

END
