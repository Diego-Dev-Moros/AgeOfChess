# Pawn

---

# 1. Purpose

Define the visual asset rules for the Pawn sprite.

---

# 2. Gameplay Role

The Pawn is the smallest and most numerous unit. It must remain readable in groups and during combat states.

---

# 3. Visual Concept

A compact enchanted stone chess infantry piece with a small faction glow.

---

# 4. Shape Identity

- Small round or helmet-like head.
- Narrow neck.
- Compact base.
- Minimal ornament.

---

# 5. Size and Scale

- Canvas: 48x48 px.
- Target height: 30-34 px.
- Target width: 20-24 px.

---

# 6. Material

Carved stone with small gold trim and faction glow.

---

# 7. Shape and Silhouette Rules

The Pawn must be the simplest piece. Do not add weapons, crown marks, or wide ornaments.

---

# 8. Color Rules

Light faction uses pale stone and blue-white glow. Dark faction uses basalt and emerald or violet glow.

---

# 9. Lighting Rules

Top-left highlight on head and base; lower-right contact shadow.

---

# 10. Readability Requirements

The round head and compact base must read at 75 percent scale.

---

# 11. Variants

- Light faction.
- Dark faction.
- Damaged with small cracks.
- Buffed with green or blue aura.
- Debuffed with purple or red distortion.

---

# 12. Implementation Notes: Godot

Use a base sprite plus 48x48 px state overlays. Do not rely on tint alone for faction identity.

---

# 13. JSON Design Spec

```json
{
  "asset_name": "Pawn",
  "type": "sprite",
  "category": "piece",
  "resolution": "48x48 px",
  "palette": {
    "primary": ["#A8B0A7", "#777E7A", "#3A3E42"],
    "secondary": ["#E7C985", "#8C6324"],
    "accent": ["#9DE7FF", "#8CFFB1", "#C27CFF"]
  },
  "lighting": {
    "direction": "top-left",
    "intensity": "medium",
    "contrast": "medium-high"
  },
  "silhouette": {
    "complexity": "low",
    "readability_priority": true
  },
  "style": {
    "theme": "enchanted chess infantry",
    "material": "carved stone with faction glow",
    "effects": ["small base glow", "minor chips", "subtle rune mark"]
  },
  "rules": {
    "must_follow": ["round head", "compact base", "smallest piece scale", "clear faction value contrast"],
    "must_avoid": ["large weapons", "complex crown", "same height as major pieces", "thin unreadable neck"]
  }
}
```

---

END
