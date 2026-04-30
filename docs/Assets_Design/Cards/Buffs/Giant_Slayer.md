# Giant Slayer

---

# 1. Purpose

Define the visual asset rules for the Giant Slayer Buff card.

Game design connections:

- [[Systems/Cards/Buffs/Giant_Slayer|Giant Slayer Rules]]
- [[Systems/Cards/Buffs|Buffs]]
- [[Balancing/Card_Balance|Card Balance]]

---

# 2. Gameplay Role

Giant Slayer makes lower-value allied pieces more dangerous when attacking higher-value enemy pieces. The art must communicate an underdog defeating a massive chess threat.

---

# 3. Card Type

Buff.

---

# 4. Visual Concept

A small glowing pawn stands before cracked giant chess pieces, with green-gold magic breaking the larger forms apart.

---

# 5. Border Rules

- Primary border: arcane green.
- Secondary trim: antique gold.
- Corners may include small pawn and dice motifs.
- Border should feel heroic, not holy.

---

# 6. Layout Rules

- Title: `GIANT SLAYER`, centered on parchment nameplate.
- Illustration: small pawn in foreground, oversized broken piece forms behind it.
- Text box: empty parchment rectangle.
- Icon usage: pawn silhouette, broken crown or rook fragments, subtle dice symbols.
- Background design: dark field with green particles and gold cracks.

---

# 7. Shape and Silhouette Rules

The small pawn must be readable immediately. The giant pieces may be broken, but their scale must be obvious.

---

# 8. Color Rules

Use green magic, gold cracks, pale pawn highlights, and dark stone shadows.

---

# 9. Lighting Rules

Top-left light plus local glow from the empowered pawn.

---

# 10. Readability Requirements

Thumbnail must still show a small bright pawn versus large broken enemy forms.

---

# 11. Variants

- Hidden card back.
- Revealed Buff frame.
- Trigger glow variant.

---

# 12. Implementation Notes: Godot

Keep title and rules text dynamic. Use the illustration as a static texture and add reveal glow as a separate overlay.

---

# 13. JSON Design Spec

```json
{
  "asset_name": "Giant Slayer",
  "type": "card",
  "category": "buff",
  "resolution": "768x1152 px master, 192x288 px thumbnail",
  "palette": {
    "primary": ["#1F8A4C", "#35C56F", "#8CFFB1"],
    "secondary": ["#8C6324", "#C4923A", "#F0C95A"],
    "accent": ["#FFFBE2", "#A8B0A7", "#2DB6A3"]
  },
  "lighting": {
    "direction": "top-left with pawn-centered magical glow",
    "intensity": "high on pawn and cracks",
    "contrast": "high"
  },
  "silhouette": {
    "complexity": "high illustration, readable pawn focal point",
    "readability_priority": true
  },
  "style": {
    "theme": "underdog tactical empowerment",
    "material": "stone, gold trim, green magic",
    "effects": ["green particles", "gold cracks", "subtle dice icons"]
  },
  "rules": {
    "must_follow": ["small pawn focal point", "large broken enemy scale", "green buff border", "empty text box"],
    "must_avoid": ["making the pawn hard to find", "red debuff dominance", "busy text area"]
  }
}
```

---

END
