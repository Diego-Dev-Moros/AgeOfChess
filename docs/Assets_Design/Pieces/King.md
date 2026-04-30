# King

---

# 1. Purpose

Define the visual asset rules for the King sprite.

---

# 2. Gameplay Role

The King is the central win-condition piece and must be recognized instantly.

---

# 3. Visual Concept

A divine royal chess statue with the strongest authority silhouette.

---

# 4. Shape Identity

- Widest royal posture.
- Crown, cross, halo, or authority mark.
- Heavy base.
- Strong vertical center.

---

# 5. Size and Scale

- Canvas: 48x48 px.
- Target height: 43-46 px.
- Target width: 30-34 px.

---

# 6. Material

Ancient divine stone with gold trim and sacred or corrupted faction glow.

---

# 7. Shape and Silhouette Rules

The authority mark is mandatory. The King must not rely on crown shape alone.

---

# 8. Color Rules

Use highest royal contrast, antique gold, and faction glow. Do not make it visually noisy.

---

# 9. Lighting Rules

Top-left highlight on authority mark, crown, and upper body.

---

# 10. Readability Requirements

Must remain readable under check, selection, and threat overlays.

---

# 11. Variants

- Light faction.
- Dark faction.
- Damaged authority mark.
- Buffed divine aura.
- Debuffed corrupted aura.
- Check or threatened state.

---

# 12. Implementation Notes: Godot

Threat/check overlays should frame the King instead of covering the authority mark.

---

# 13. JSON Design Spec

```json
{
  "asset_name": "King",
  "type": "sprite",
  "category": "piece",
  "resolution": "48x48 px",
  "palette": {
    "primary": ["#A8B0A7", "#777E7A", "#111817"],
    "secondary": ["#F0C95A", "#8C6324"],
    "accent": ["#FFFBE2", "#9DE7FF", "#7131A4"]
  },
  "lighting": {
    "direction": "top-left",
    "intensity": "high on authority mark, medium on body",
    "contrast": "high"
  },
  "silhouette": {
    "complexity": "medium-high",
    "readability_priority": true
  },
  "style": {
    "theme": "divine royal chess statue",
    "material": "ancient stone, gold trim, divine or corrupted glow",
    "effects": ["authority glow", "subtle halo", "heavy contact shadow"]
  },
  "rules": {
    "must_follow": ["unique authority mark", "largest royal presence", "wide stable base", "immediate recognition"],
    "must_avoid": ["queen-like crown only", "small minor-piece scale", "unclear faction glow", "excess aura hiding silhouette"]
  }
}
```

---

END
