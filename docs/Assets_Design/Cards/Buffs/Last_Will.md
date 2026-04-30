# Last Will

---

# 1. Purpose

Define the visual asset rules for the Last Will Buff card.

Game design connections:

- [[Systems/Cards/Buffs/Last_Will|Last Will Rules]]
- [[Systems/Cards/Buffs|Buffs]]
- [[Edge_Cases]]
- [[Balancing/Card_Balance|Card Balance]]

---

# 2. Gameplay Role

Last Will communicates retaliation or final impact when a piece dies. The art must show sacrifice, not simple destruction.

---

# 3. Card Type

Buff.

---

# 4. Visual Concept

A cracked chess piece releases a final green-gold spirit flare toward an enemy silhouette.

---

# 5. Border Rules

- Primary border: muted green.
- Secondary trim: gold and pale stone.
- Corners may show cracked pawn icons or fading runes.

---

# 6. Layout Rules

- Title: `LAST WILL`.
- Illustration: dying piece with final magical burst.
- Text box: empty parchment rectangle.
- Icon usage: cracked piece, spirit rune, small dice omen.
- Background design: dark battlefield with controlled farewell glow.

---

# 7. Shape and Silhouette Rules

The dying piece must remain identifiable. Cracks and particles must support the silhouette, not destroy it.

---

# 8. Color Rules

Use green, gold, pale stone, and low black shadows. Avoid red gore language.

---

# 9. Lighting Rules

Top-left light plus internal glow from cracks.

---

# 10. Readability Requirements

Must read as final magical retaliation at thumbnail size.

---

# 11. Variants

- Revealed Buff frame.
- Trigger flare.
- Dim inactive state.

---

# 12. Implementation Notes: Godot

Trigger animation can reuse the same green-gold flare language on board pieces.

---

# 13. JSON Design Spec

```json
{
  "asset_name": "Last Will",
  "type": "card",
  "category": "buff",
  "resolution": "768x1152 px master, 192x288 px thumbnail",
  "palette": {
    "primary": ["#1F8A4C", "#35C56F", "#8CFFB1"],
    "secondary": ["#A8B0A7", "#8C6324", "#F0C95A"],
    "accent": ["#FFFBE2", "#245D8F", "#2DB6A3"]
  },
  "lighting": {
    "direction": "top-left plus internal crack glow",
    "intensity": "high at final flare",
    "contrast": "high focal contrast"
  },
  "silhouette": {
    "complexity": "medium-high with cracked piece focal point",
    "readability_priority": true
  },
  "style": {
    "theme": "sacrificial final magic",
    "material": "cracked stone, parchment, gold trim",
    "effects": ["spirit flare", "green particles", "gold crack light"]
  },
  "rules": {
    "must_follow": ["sacrifice tone", "readable cracked piece", "green-gold buff identity", "empty text box"],
    "must_avoid": ["gore", "debuff curse language", "silhouette collapse into particles"]
  }
}
```

---

END
