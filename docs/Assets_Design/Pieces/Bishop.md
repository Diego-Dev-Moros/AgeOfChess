# Bishop

---

# 1. Purpose

Define the visual asset rules for the Bishop sprite.

---

# 2. Gameplay Role

The Bishop represents diagonal pressure and arcane movement.

---

# 3. Visual Concept

A tall ceremonial stone chess piece with a glowing mitre slit.

---

# 4. Shape Identity

- Tall narrow body.
- Mitre head or vertical slit.
- Ceremonial posture.
- Clear base.

---

# 5. Size and Scale

- Canvas: 48x48 px.
- Target height: 38-42 px.
- Target width: 22-26 px.

---

# 6. Material

Polished stone with a rune channel or glowing cut.

---

# 7. Shape and Silhouette Rules

The slit or mitre read cue is mandatory. Avoid crown spikes.

---

# 8. Color Rules

Use stone gray, blue-white or faction glow, and minimal gold.

---

# 9. Lighting Rules

Top-left highlight on head and upper body; inner slit may glow softly.

---

# 10. Readability Requirements

Must not resemble Queen or Pawn at small sizes.

---

# 11. Variants

- Light faction.
- Dark faction.
- Damaged cracked mitre.
- Buffed vertical aura.
- Debuffed corrupted slit glow.

---

# 12. Implementation Notes: Godot

The slit glow can be a separate overlay for faction and state changes.

---

# 13. JSON Design Spec

```json
{
  "asset_name": "Bishop",
  "type": "sprite",
  "category": "piece",
  "resolution": "48x48 px",
  "palette": {
    "primary": ["#A8B0A7", "#777E7A", "#3A3E42"],
    "secondary": ["#245D8F", "#C4923A"],
    "accent": ["#9DE7FF", "#FFFBE2", "#C27CFF"]
  },
  "lighting": {
    "direction": "top-left",
    "intensity": "medium",
    "contrast": "medium-high"
  },
  "silhouette": {
    "complexity": "medium",
    "readability_priority": true
  },
  "style": {
    "theme": "arcane ceremonial chess statue",
    "material": "polished stone with rune channel",
    "effects": ["vertical glow slit", "small rune particles", "soft aura"]
  },
  "rules": {
    "must_follow": ["tall narrow body", "mitre or slit read cue", "ceremonial posture", "clear base"],
    "must_avoid": ["crown spikes", "rook battlements", "wide royal body", "excess side ornaments"]
  }
}
```

---

END
