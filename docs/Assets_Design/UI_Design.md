# UI Design

---

# 1. Purpose

The UI presents game state, card information, HP, dice results, turn state, and interaction feedback.

It must be fast to read and visually compatible with the pixel art world.

---

# 2. Gameplay Role

The UI supports:

- Current turn.
- Selected piece information.
- HP display.
- Dice display.
- Card display.
- Buff and debuff reveal state.
- Terrain display.
- Action confirmation and feedback.

---

# 3. Visual Concept

The UI uses restrained medieval fantasy styling:

- Parchment for readable information zones.
- Stone or dark metal for panels.
- Gold trim for important containers.
- Arcane color accents for states.

UI decoration must stay secondary to information.

---

# 4. Minimal vs Decorative UI

Default UI is minimal.

Decorative treatment is allowed only for:

- Card frames.
- Main match panels.
- Turn banner.
- Endgame or reveal moments.

Functional controls should use simple icon-first pixel buttons with clear hover and selected states.

---

# 5. Card Display Rules

- Cards use their own art frame.
- UI should render card text dynamically when possible.
- Hidden cards use a card back with dice and rune motifs.
- Revealed cards show type color and title clearly.
- Small card previews must preserve type color more than illustration detail.

---

# 6. HP Indicators

HP indicators must be readable over every board terrain.

Allowed styles:

- Small pips.
- Compact heart/stone chips.
- Numeric HP badge.

Rules:

- Use a dark backing plate or outline.
- Do not place HP directly over noisy tile detail.
- Damaged state must also show on piece sprite, but HP UI is the authority.

---

# 7. Dice Display

Dice display must show:

- Attack dice.
- Defense dice.
- Rolled values.
- Top 3 used dice.
- Ignored dice when relevant.

Used dice should be brighter and closer to the combat focal area. Ignored dice should be dimmed, not removed, if the roll is being explained.

---

# 8. Shape and Silhouette Rules

- Buttons use 16x16 or 24x24 icons.
- Panels use square or lightly rounded corners.
- Avoid large rounded pill buttons unless they already exist in the final UI system.
- UI icons should be readable before decorative trim.

---

# 9. Color Rules

- Neutral UI: dark stone, parchment, antique gold.
- Buff states: green or blue.
- Debuff states: purple or red.
- Terrain states: terrain-specific accent.
- Disabled states: desaturated stone gray.

---

# 10. Lighting Rules

- UI panels use top-left bevel highlights.
- Active elements may glow softly.
- Avoid soft blur. Use pixel shadows and hard-edged highlights.

---

# 11. Readability Requirements

UI must pass:

- HP readable at gameplay zoom.
- Current turn visible immediately.
- Selected piece identity visible without opening a menu.
- Dice values readable in combat.
- Card type visible at small preview size.

---

# 12. Variants

Required:

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

- Use `Control` nodes for UI layout.
- Use `TextureRect` or `NinePatchRect` for pixel panels.
- Disable filtering for UI textures.
- Keep text dynamic and localizable.
- Do not bake changing values into textures.
- Use separate UI theme resources for colors, fonts, and panel textures.

---

# 14. UI JSON

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
