# Rook

---

# 1. Purpose

Define the visual asset rules for the Rook sprite.

---

# 2. Gameplay Role

The Rook represents stable straight-line pressure and board control.

---

# 3. Visual Concept

A heavy fortress-like chess construct made from block stone and metal bands.

---

# 4. Shape Identity

- Tower silhouette.
- Battlement top.
- Wide base.
- Blocky vertical mass.

---

# 5. Size and Scale

- Canvas: 48x48 px.
- Target height: 36-40 px.
- Target width: 28-32 px.

---

# 6. Material

Fortress stone, chipped blocks, metal bands, and subtle rune mortar.

---

# 7. Shape and Silhouette Rules

The battlement top is mandatory. Avoid crown-like elegance.

---

# 8. Color Rules

Use darker stone, gold or metal trim, and faction glow in windows or cracks.

---

# 9. Lighting Rules

Top-left highlights on battlements and block edges; strong contact shadow.

---

# 10. Readability Requirements

Must read as the heaviest non-royal piece.

---

# 11. Variants

- Light faction.
- Dark faction.
- Damaged chipped battlements.
- Buffed rune mortar glow.
- Debuffed cracked tower distortion.

---

# 12. Implementation Notes: Godot

Keep the tower top unobstructed by overlays.

---

# 13. JSON Design Spec

```json
{
  "asset_name": "Rook",
  "type": "sprite",
  "category": "piece",
  "resolution": "48x48 px",
  "palette": {
    "primary": ["#777E7A", "#555B5D", "#3A3E42"],
    "secondary": ["#8C6324", "#C4923A"],
    "accent": ["#35C56F", "#9DE7FF", "#FF6A4D"]
  },
  "lighting": {
    "direction": "top-left",
    "intensity": "medium",
    "contrast": "high"
  },
  "silhouette": {
    "complexity": "medium-low",
    "readability_priority": true
  },
  "style": {
    "theme": "fortress chess construct",
    "material": "block stone, metal banding, carved runes",
    "effects": ["faint mortar glow", "dust chips", "strong contact shadow"]
  },
  "rules": {
    "must_follow": ["battlement top", "wide base", "blocky vertical silhouette", "heavy mass"],
    "must_avoid": ["queen-like crown", "thin tower", "excess vines", "round pawn head"]
  }
}
```

---

END
