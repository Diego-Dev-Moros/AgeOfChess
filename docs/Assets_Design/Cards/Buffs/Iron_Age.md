# Iron Age

---

# 1. Purpose

Define the visual asset rules for the Iron Age Buff card.

Game design connections:

- [[Systems/Cards/Buffs/Iron_Age|Iron Age Rules]]
- [[Systems/Cards/Buffs|Buffs]]
- [[Balancing/Card_Balance|Card Balance]]

---

# 2. Gameplay Role

Iron Age strengthens defensive dice behavior. The art must communicate reinforced pieces and durable metal.

---

# 3. Card Type

Buff.

---

# 4. Visual Concept

Chess pieces plated in iron stand behind a glowing anvil-like dice sigil, with blue-green defensive energy running through metal bands.

---

# 5. Border Rules

- Primary border: blue-green buff color.
- Secondary trim: iron gray and gold.
- Border may include rivets, metal plates, and dice pips.

---

# 6. Layout Rules

- Title: `IRON AGE`.
- Illustration: reinforced rook or knight with iron plates and defensive dice motif.
- Text box: empty parchment rectangle.
- Icon usage: shield-like dice, metal bands, hammer marks.
- Background design: dark forge stone with cool arcane glow.

---

# 7. Shape and Silhouette Rules

The reinforced piece must remain recognizable; armor plates must not erase the chess silhouette.

---

# 8. Color Rules

Use stone gray, iron gray, antique gold, and blue-green buff light.

---

# 9. Lighting Rules

Top-left metallic highlights, cool glow from dice sigil.

---

# 10. Readability Requirements

Must read as defensive reinforcement, not attack rage or corruption.

---

# 11. Variants

- Revealed Buff frame.
- Defensive trigger glow.
- Inactive desaturated state.

---

# 12. Implementation Notes: Godot

Use separate overlay for trigger pulse so the card can flash when defense dice are modified.

---

# 13. JSON Design Spec

```json
{
  "asset_name": "Iron Age",
  "type": "card",
  "category": "buff",
  "resolution": "768x1152 px master, 192x288 px thumbnail",
  "palette": {
    "primary": ["#245D8F", "#3CA7D9", "#9DE7FF"],
    "secondary": ["#3A3E42", "#777E7A", "#C4923A"],
    "accent": ["#35C56F", "#FFFBE2", "#2DB6A3"]
  },
  "lighting": {
    "direction": "top-left",
    "intensity": "medium-high metallic highlights",
    "contrast": "high"
  },
  "silhouette": {
    "complexity": "medium-high with reinforced piece focal point",
    "readability_priority": true
  },
  "style": {
    "theme": "defensive metal empowerment",
    "material": "iron, stone, gold trim, arcane dice energy",
    "effects": ["blue-green glow", "metal glints", "dice shield sigil"]
  },
  "rules": {
    "must_follow": ["defensive visual language", "recognizable chess piece", "buff border", "empty text box"],
    "must_avoid": ["red damage language", "over-armoring silhouette", "generic forge scene without chess identity"]
  }
}
```

---

END
