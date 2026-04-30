# Queen

---

# 1. Purpose

Define the visual asset rules for the Queen sprite.

---

# 2. Gameplay Role

The Queen is the most flexible and dangerous non-King piece.

---

# 3. Visual Concept

A tall royal arcane statue with an elegant crown and controlled aura.

---

# 4. Shape Identity

- Tall body.
- Multi-point crown.
- Elegant taper.
- Strong central vertical line.

---

# 5. Size and Scale

- Canvas: 48x48 px.
- Target height: 42-44 px.
- Target width: 28-32 px.

---

# 6. Material

Polished enchanted stone with gold trim and stronger aura than minor pieces.

---

# 7. Shape and Silhouette Rules

The crown must be readable but must not use the King's authority mark.

---

# 8. Color Rules

Use high-value highlights, antique gold, and faction glow.

---

# 9. Lighting Rules

Top-left highlight on crown and upper body.

---

# 10. Readability Requirements

Must read as royal and mobile without being confused with the King.

---

# 11. Variants

- Light faction.
- Dark faction.
- Damaged cracked crown.
- Buffed orbiting particles.
- Debuffed corrupted crown glow.

---

# 12. Implementation Notes: Godot

Keep aura effects behind the sprite so crown points remain readable.

---

# 13. JSON Design Spec

```json
{
  "asset_name": "Queen",
  "type": "sprite",
  "category": "piece",
  "resolution": "48x48 px",
  "palette": {
    "primary": ["#A8B0A7", "#777E7A", "#1B2421"],
    "secondary": ["#F0C95A", "#C4923A"],
    "accent": ["#FFFBE2", "#9DE7FF", "#C27CFF"]
  },
  "lighting": {
    "direction": "top-left",
    "intensity": "high on crown and upper body",
    "contrast": "high"
  },
  "silhouette": {
    "complexity": "medium-high",
    "readability_priority": true
  },
  "style": {
    "theme": "royal arcane chess statue",
    "material": "polished stone, gold trim, controlled magic aura",
    "effects": ["crown glints", "subtle aura", "small orbiting particles"]
  },
  "rules": {
    "must_follow": ["multi-point crown", "tall elegant body", "major-piece scale", "clear royal identity"],
    "must_avoid": ["king cross symbol", "rook battlements", "overwide crown", "excess particles around base"]
  }
}
```

---

END
