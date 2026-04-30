# Knight

---

# 1. Purpose

Define the visual asset rules for the Knight sprite.

---

# 2. Gameplay Role

The Knight has non-linear movement and must be recognized immediately.

---

# 3. Visual Concept

An angular enchanted cavalry statue with a horse-head or helm-like silhouette.

---

# 4. Shape Identity

- Hooked horse head.
- Strong neck curve.
- Asymmetric upper profile.
- Forward tactical posture.

---

# 5. Size and Scale

- Canvas: 48x48 px.
- Target height: 36-40 px.
- Target width: 26-30 px.

---

# 6. Material

Carved stone with metal ridge details and magical eye glow.

---

# 7. Shape and Silhouette Rules

The hooked head profile is mandatory. Mane or armor detail must not blur the outline.

---

# 8. Color Rules

Use stone gray, dark outline, faction glow, and restrained gold trim.

---

# 9. Lighting Rules

Top-left highlight along head, neck ridge, and base.

---

# 10. Readability Requirements

Must not resemble Bishop, Pawn, or Queen at reduced scale.

---

# 11. Variants

- Light faction.
- Dark faction.
- Damaged chipped head or base.
- Buffed aura around eye and base.
- Debuffed distortion around neck and face.

---

# 12. Implementation Notes: Godot

Keep state overlays outside the horse-head silhouette where possible so the read cue stays intact.

---

# 13. JSON Design Spec

```json
{
  "asset_name": "Knight",
  "type": "sprite",
  "category": "piece",
  "resolution": "48x48 px",
  "palette": {
    "primary": ["#777E7A", "#555B5D", "#1B2421"],
    "secondary": ["#C4923A", "#8C6324"],
    "accent": ["#9DE7FF", "#35C56F", "#7131A4"]
  },
  "lighting": {
    "direction": "top-left",
    "intensity": "medium-high",
    "contrast": "high"
  },
  "silhouette": {
    "complexity": "medium",
    "readability_priority": true
  },
  "style": {
    "theme": "mobile enchanted cavalry statue",
    "material": "stone, metal ridge, magical eye glow",
    "effects": ["eye glow", "edge highlight", "small dust chips"]
  },
  "rules": {
    "must_follow": ["hooked horse-head profile", "asymmetric upper silhouette", "clear neck curve", "strong outer outline"],
    "must_avoid": ["round pawn-like head", "overdetailed mane", "vertical bishop silhouette", "blurred facial features"]
  }
}
```

---

END
