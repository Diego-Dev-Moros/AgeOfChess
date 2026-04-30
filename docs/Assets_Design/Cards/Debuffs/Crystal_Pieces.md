# Crystal Pieces

---

# 1. Purpose

Define the visual asset rules for the Crystal Pieces Debuff card.

Game design connections:

- [[Systems/Cards/Debuffs/Crystal_Pieces|Crystal Pieces Rules]]
- [[Systems/Cards/Debuffs|Debuffs]]
- [[Systems/Combat/Damage_Calculation|Damage Calculation]]
- [[Balancing/Card_Balance|Card Balance]]

---

# 2. Gameplay Role

Crystal Pieces suggests brittle, fragile units. The art must communicate beauty with vulnerability.

---

# 3. Card Type

Debuff.

---

# 4. Visual Concept

Chess pieces made of translucent crystal show internal fractures and purple-red stress lines.

---

# 5. Border Rules

- Primary border: purple.
- Secondary trim: cold blue and tarnished gold.
- Corners may use shard shapes.

---

# 6. Layout Rules

- Title: `CRYSTAL PIECES`.
- Illustration: fragile crystal pieces under pressure.
- Text box: empty parchment rectangle.
- Icon usage: crystal shards, cracked dice, brittle pawn.
- Background design: dark cold field with sharp shard silhouettes.

---

# 7. Shape and Silhouette Rules

Crystal transparency must not reduce piece readability. Keep solid outer outlines.

---

# 8. Color Rules

Use icy blue, purple, white highlights, and dark stone shadows.

---

# 9. Lighting Rules

Top-left bright crystal highlights with internal crack glow.

---

# 10. Readability Requirements

Must read as fragile debuff, not protective ice armor.

---

# 11. Variants

- Revealed Debuff frame.
- Setup reveal state.
- Crack pulse.

---

# 12. Implementation Notes: Godot

Use shard overlays on affected piece sprites sparingly; the HP indicator remains the authority.

---

# 13. JSON Design Spec

```json
{
  "asset_name": "Crystal Pieces",
  "type": "card",
  "category": "debuff",
  "resolution": "768x1152 px master, 192x288 px thumbnail",
  "palette": {
    "primary": ["#245D8F", "#3CA7D9", "#9DE7FF"],
    "secondary": ["#37184F", "#7131A4", "#3A3E42"],
    "accent": ["#FFFBE2", "#C27CFF", "#B9342B"]
  },
  "lighting": {
    "direction": "top-left through crystal surfaces",
    "intensity": "high on shards",
    "contrast": "high with dark outline protection"
  },
  "silhouette": {
    "complexity": "medium-high crystalline forms with solid outlines",
    "readability_priority": true
  },
  "style": {
    "theme": "fragile cursed beauty",
    "material": "crystal, cracked stone, cold magic",
    "effects": ["shards", "internal fractures", "purple stress glow"]
  },
  "rules": {
    "must_follow": ["fragility read", "solid chess silhouettes", "purple debuff frame", "empty text box"],
    "must_avoid": ["protective armor interpretation", "transparent unreadable pieces", "green healing language"]
  }
}
```

---

END
