# Cowardice

---

# 1. Purpose

Define the visual asset rules for the Cowardice Debuff card.

Game design connections:

- [[Systems/Cards/Debuffs/Cowardice|Cowardice Rules]]
- [[Systems/Cards/Debuffs|Debuffs]]
- [[Systems/Timing/Timing_And_Priority|Timing And Priority]]
- [[Balancing/Card_Balance|Card Balance]]

---

# 2. Gameplay Role

Cowardice represents attack hesitation and failed aggression. The art must communicate fear disrupting action.

---

# 3. Card Type

Debuff.

---

# 4. Visual Concept

A chess piece recoils from a shadowed enemy shape while cracked purple dice hover behind it.

---

# 5. Border Rules

- Primary border: corrupt purple.
- Secondary trim: tarnished gold.
- Corners may show broken dice and retreating pawn icons.

---

# 6. Layout Rules

- Title: `COWARDICE`.
- Illustration: piece hesitating, shadow pressure, cracked dice.
- Text box: empty parchment rectangle.
- Icon usage: broken dice, downward arrow, shadowed pawn.
- Background design: cold dark field with purple smoke.

---

# 7. Shape and Silhouette Rules

The recoiling piece silhouette must be readable. Distortion must not hide the chess identity.

---

# 8. Color Rules

Use purple, dark stone, tarnished gold, and small red warning accents.

---

# 9. Lighting Rules

Top-left key light is weak; purple shadow glow dominates the lower-right.

---

# 10. Readability Requirements

Must read as fear or hesitation, not damage or death.

---

# 11. Variants

- Revealed Debuff frame.
- Failed-attack pulse.
- Hidden card back.

---

# 12. Implementation Notes: Godot

Use the cracked purple dice motif for failed attack feedback on the combat UI.

---

# 13. JSON Design Spec

```json
{
  "asset_name": "Cowardice",
  "type": "card",
  "category": "debuff",
  "resolution": "768x1152 px master, 192x288 px thumbnail",
  "palette": {
    "primary": ["#37184F", "#7131A4", "#C27CFF"],
    "secondary": ["#111817", "#3A3E42", "#8C6324"],
    "accent": ["#B9342B", "#FFFBE2", "#91E36A"]
  },
  "lighting": {
    "direction": "top-left with purple lower-right pressure",
    "intensity": "medium",
    "contrast": "high"
  },
  "silhouette": {
    "complexity": "medium-high with recoiling piece focal point",
    "readability_priority": true
  },
  "style": {
    "theme": "fear and failed aggression",
    "material": "dark stone, cracked dice, corrupt smoke",
    "effects": ["purple smoke", "cracked dice", "downward particles"]
  },
  "rules": {
    "must_follow": ["purple debuff identity", "hesitation visual", "readable chess piece", "empty text box"],
    "must_avoid": ["heroic glow", "green buff dominance", "death imagery as primary read"]
  }
}
```

---

END
