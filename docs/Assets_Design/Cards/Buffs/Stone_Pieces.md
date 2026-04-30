# Stone Pieces

---

# 1. Purpose

Define the visual asset rules for the Stone Pieces Buff card.

Game design connections:

- [[Systems/Cards/Buffs/Stone_Pieces|Stone Pieces Rules]]
- [[Systems/Cards/Buffs|Buffs]]
- [[Systems/Combat/Damage_Calculation|Damage Calculation]]
- [[Balancing/Card_Balance|Card Balance]]

---

# 2. Gameplay Role

Stone Pieces communicates sturdier, heavier chess units. The art must show durability and weight.

---

# 3. Card Type

Buff.

---

# 4. Visual Concept

Several chess pieces are carved from ancient stone, reinforced by green runes and gold seams.

---

# 5. Border Rules

- Primary border: green buff.
- Secondary trim: carved stone and antique gold.
- Corners may use block-stone ornament.

---

# 6. Layout Rules

- Title: `STONE PIECES`.
- Illustration: grouped stone pieces with runic reinforcement.
- Text box: empty parchment rectangle.
- Icon usage: stone blocks, runes, dice pips carved into rock.
- Background design: dark temple stone.

---

# 7. Shape and Silhouette Rules

Each piece group must remain readable as chess pieces. Avoid merging them into a generic statue pile.

---

# 8. Color Rules

Use stone gray, green rune glow, and antique gold.

---

# 9. Lighting Rules

Top-left stone highlights, low green rune glow.

---

# 10. Readability Requirements

Must read as durability, not terrain.

---

# 11. Variants

- Revealed Buff frame.
- Passive active glow.
- Triggered durability pulse.

---

# 12. Implementation Notes: Godot

Use the same rune color for piece buff overlays when this card is active.

---

# 13. JSON Design Spec

```json
{
  "asset_name": "Stone Pieces",
  "type": "card",
  "category": "buff",
  "resolution": "768x1152 px master, 192x288 px thumbnail",
  "palette": {
    "primary": ["#3A3E42", "#555B5D", "#A8B0A7"],
    "secondary": ["#1F8A4C", "#35C56F", "#8C6324"],
    "accent": ["#F0C95A", "#FFFBE2", "#8CFFB1"]
  },
  "lighting": {
    "direction": "top-left",
    "intensity": "medium",
    "contrast": "medium-high"
  },
  "silhouette": {
    "complexity": "medium with grouped readable chess forms",
    "readability_priority": true
  },
  "style": {
    "theme": "durable stone empowerment",
    "material": "heavy stone, carved runes, gold seams",
    "effects": ["green rune glow", "dust motes", "stone chips"]
  },
  "rules": {
    "must_follow": ["heavy chess-piece identity", "green buff signal", "stone material clarity", "empty text box"],
    "must_avoid": ["terrain-card confusion", "merged unreadable forms", "excess cracks implying debuff"]
  }
}
```

---

END
