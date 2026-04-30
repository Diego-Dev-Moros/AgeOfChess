# Fatigue

---

# 1. Purpose

Define the visual asset rules for the Fatigue Debuff card.

Game design connections:

- [[Systems/Cards/Debuffs/Fatigue|Fatigue Rules]]
- [[Systems/Cards/Debuffs|Debuffs]]
- [[Edge_Cases]]
- [[Balancing/Card_Balance|Card Balance]]

---

# 2. Gameplay Role

Fatigue represents exhaustion, redirection pressure, or weakened action reliability.

---

# 3. Card Type

Debuff.

---

# 4. Visual Concept

A chess piece sinks under heavy red-purple haze while dice trails curve away from their intended target.

---

# 5. Border Rules

- Primary border: dark red-purple.
- Secondary trim: tarnished gold.
- Corners may show sagging runes or dim dice.

---

# 6. Layout Rules

- Title: `FATIGUE`.
- Illustration: tired piece with dragging shadow and misdirected dice path.
- Text box: empty parchment rectangle.
- Icon usage: dim dice, downward motion lines, cracked base.
- Background design: oppressive smoky gradient made from pixel clusters.

---

# 7. Shape and Silhouette Rules

The piece must look slowed, not destroyed. Keep posture lowered but recognizable.

---

# 8. Color Rules

Use muted red, purple, dark gray, and dim gold.

---

# 9. Lighting Rules

Reduced top-left highlight with heavy lower-right shadow.

---

# 10. Readability Requirements

Must read as exhaustion or pressure, not poison.

---

# 11. Variants

- Revealed Debuff frame.
- Redirection pulse.
- Dim inactive state.

---

# 12. Implementation Notes: Godot

Use slowed particle timing for card reveal; avoid screen blur.

---

# 13. JSON Design Spec

```json
{
  "asset_name": "Fatigue",
  "type": "card",
  "category": "debuff",
  "resolution": "768x1152 px master, 192x288 px thumbnail",
  "palette": {
    "primary": ["#6B1618", "#B9342B", "#37184F"],
    "secondary": ["#111817", "#3A3E42", "#8C6324"],
    "accent": ["#C27CFF", "#FF6A4D", "#FFFBE2"]
  },
  "lighting": {
    "direction": "top-left with reduced highlight",
    "intensity": "medium-low",
    "contrast": "medium-high"
  },
  "silhouette": {
    "complexity": "medium with lowered readable piece posture",
    "readability_priority": true
  },
  "style": {
    "theme": "exhaustion and unreliable action",
    "material": "dark stone, smoke, dim dice magic",
    "effects": ["heavy shadow", "misdirected dice trail", "red-purple haze"]
  },
  "rules": {
    "must_follow": ["tired posture", "debuff frame", "dim dice language", "empty text box"],
    "must_avoid": ["poison-first read", "complete collapse", "bright heroic highlights"]
  }
}
```

---

END
