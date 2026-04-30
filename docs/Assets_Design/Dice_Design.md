# Dice Design

---

# 1. Purpose

Dice visualize combat uncertainty and must make roll results immediately readable.

---

# 2. Gameplay Role

Dice communicate:

- Attack dice.
- Defense dice.
- Roll values.
- Compared pairs.
- Used top 3 dice.
- Ignored dice.
- Buffed or debuffed dice modifications.

Dice should feel like part of the world, not generic UI stock icons.

---

# 3. Visual Concept

Dice are carved arcane six-sided stones with high-contrast pips or rune faces.

They may appear as:

- Small UI icons.
- Larger combat dice.
- Subtle background symbols in cards.
- Magical dice motifs on terrain or card frames.

---

# 4. Shape and Readability Rules

- Dice icon size: 24x24 px.
- Combat dice size: 32x32 px.
- Use clear cube silhouette with 2-3 visible faces when perspective is needed.
- Pips or values must be the highest contrast element.
- Face values must remain readable after tinting.
- Do not use complex illustrated faces for standard dice.

---

# 5. Style Rules

Default dice style:

- Stone or polished bone body.
- Dark outline.
- Bright pips or rune cuts.
- Top-left highlight.
- Lower-right shadow.

Arcane dice may include:

- Blue-white pips for normal magic.
- Green or blue aura for buffs.
- Red or purple distortion for debuffs.
- Gold edge for terrain or special rule emphasis.

---

# 6. Buff and Debuff Variations

Buff dice:

- Green or blue glow.
- Cleaner highlights.
- Upward particles.
- Used for increased dice, protected dice, or favorable modifiers.

Debuff dice:

- Purple or red glow.
- Cracked face.
- Slight offset or distortion.
- Used for reduced dice, failed attacks, or cursed rolls.

Ignored dice:

- Desaturated.
- Lower brightness.
- Smaller or pushed to the side.

Used dice:

- Brighter outline.
- Stronger value contrast.
- Paired with visible comparison line or impact marker.

---

# 7. Color Rules

- Normal dice: stone gray, ivory, dark outline.
- Attack dice: warm gold or white accent.
- Defense dice: cool blue or teal accent.
- Buff dice: green or blue accent.
- Debuff dice: red or purple accent.
- Ignored dice: gray and low saturation.

---

# 8. Lighting Rules

- Top-left highlight on upper cube edge.
- Lower-right shadow.
- Pips may glow, but they must remain countable.
- Combat impact effects must not hide the rolled value.

---

# 9. Readability Requirements

Dice must pass:

- Value readable at 24x24 px.
- Value readable on dark and parchment UI backgrounds.
- Buff and debuff states distinct without relying only on hue.
- Used and ignored dice distinguishable.

---

# 10. Variants

Required:

- Normal d6 faces 1-6.
- Attack dice faces 1-6.
- Defense dice faces 1-6.
- Buffed dice faces 1-6.
- Debuffed dice faces 1-6.
- Ignored dice faces 1-6.
- Used dice faces 1-6.

Optional:

- Rolling animation frames.
- Critical result flash.
- Failed attack dice shatter.
- Terrain-modified dice frame.

---

# 11. Implementation Notes: Godot

- Use dice face atlases for 24x24 and 32x32 sizes.
- Keep attack, defense, buff, and debuff variants as separate atlases or shader-tinted overlays.
- Use nearest-neighbor scaling.
- Animate dice rolls with frame swaps, not blur.
- Keep final roll result static long enough for players to parse.

---

# 12. Dice JSON

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
