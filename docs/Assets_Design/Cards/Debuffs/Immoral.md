# Immoral

---

# 1. Purpose

Define the visual asset rules for the Immoral Debuff card.

---

# 2. Gameplay Role

Immoral reduces honorable offensive strength by forcing pieces into weaker attack behavior.

---

# 3. Card Type

Debuff.

---

# 4. Visual Concept

A corrupted chess piece reaches for a cracked red die while its weapon-like glow drains into purple shadow.

---

# 5. Border Rules

- Primary border: red-purple.
- Secondary trim: blackened metal and tarnished gold.
- Corners may include broken attack icons.

---

# 6. Layout Rules

- Title: `IMMORAL`.
- Illustration: corrupted attacking piece losing clean force.
- Text box: empty parchment rectangle.
- Icon usage: cracked attack die, broken sword-like rune, corrupt smoke.
- Background design: dark ritual field with red and purple pressure.

---

# 7. Shape and Silhouette Rules

The attacking piece must remain readable. Corruption should wrap around it, not replace it.

---

# 8. Color Rules

Use red, purple, blackened stone, and small tarnished gold highlights.

---

# 9. Lighting Rules

Top-left light is partially swallowed by corrupt local glow.

---

# 10. Readability Requirements

Must read as corrupted offense, not generic damage.

---

# 11. Variants

- Revealed Debuff frame.
- Attack-reduction trigger pulse.
- Corruption overlay.

---

# 12. Implementation Notes: Godot

Reuse the cracked red attack die in combat UI when the effect changes dice count.

---

# 13. JSON Design Spec

```json
{
  "asset_name": "Immoral",
  "type": "card",
  "category": "debuff",
  "resolution": "768x1152 px master, 192x288 px thumbnail",
  "palette": {
    "primary": ["#6B1618", "#B9342B", "#7131A4"],
    "secondary": ["#080A0B", "#3A3E42", "#8C6324"],
    "accent": ["#FF6A4D", "#C27CFF", "#FFFBE2"]
  },
  "lighting": {
    "direction": "top-left interrupted by corrupt glow",
    "intensity": "medium-high",
    "contrast": "high"
  },
  "silhouette": {
    "complexity": "medium-high with readable corrupted attacker",
    "readability_priority": true
  },
  "style": {
    "theme": "corrupted offensive weakness",
    "material": "blackened stone, cracked dice, corrupt magic",
    "effects": ["red-purple smoke", "cracked attack die", "draining glow"]
  },
  "rules": {
    "must_follow": ["corrupted attack theme", "red-purple debuff identity", "readable piece", "empty text box"],
    "must_avoid": ["buff-like empowerment", "unclear dice purpose", "generic skull or horror symbols"]
  }
}
```

---

END
