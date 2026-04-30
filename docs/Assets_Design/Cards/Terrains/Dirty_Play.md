# Dirty Play

---

# 1. Purpose

Define the visual asset rules for the Dirty Play Terrain card.

Game design connections:

- [[Systems/Terrain/Dirty_Play|Dirty Play Rules]]
- [[Systems/Terrain/Terrain|Terrain System]]
- [[Systems/Cards/Debuffs/Cowardice|Cowardice Rules]]
- [[Balancing/Card_Balance|Card Balance]]

---

# 2. Gameplay Role

Dirty Play adds chaos, risk, and hostile battlefield interference.

---

# 3. Card Type

Terrain.

---

# 4. Visual Concept

A scuffed stone board is marked with crooked dice, red-brown stains, and purple shadow traps.

---

# 5. Border Rules

- Primary border: blackened stone and purple.
- Secondary trim: dirty gold and red-brown.
- Corners may show crooked dice and scratched runes.

---

# 6. Layout Rules

- Title: `DIRTY PLAY`.
- Illustration: damaged board with unfair dice motifs and hidden hazards.
- Text box: empty parchment rectangle.
- Icon usage: crooked dice, scratches, shadow traps.
- Background design: grimy battlefield with low purple-red accents.

---

# 7. Shape and Silhouette Rules

The hazard language must not obscure the board grid.

---

# 8. Color Rules

Use muddy gray, red-brown, corrupt purple, and dirty gold.

---

# 9. Lighting Rules

Top-left light with uneven shadow pockets.

---

# 10. Readability Requirements

Must read as chaos terrain, not a standard debuff card.

---

# 11. Variants

- Terrain card.
- Dirty Play board overlay.
- Terrain icon.

---

# 12. Implementation Notes: Godot

Use hazard marks on board corners and tile edges; avoid placing them under piece bases.

---

# 13. JSON Design Spec

```json
{
  "asset_name": "Dirty Play",
  "type": "card",
  "category": "terrain",
  "resolution": "768x1152 px master, 192x288 px thumbnail",
  "palette": {
    "primary": ["#3A3E42", "#555B5D", "#37184F"],
    "secondary": ["#6B1618", "#8C6324", "#C4923A"],
    "accent": ["#B9342B", "#7131A4", "#F0C95A"]
  },
  "lighting": {
    "direction": "top-left with uneven shadow pockets",
    "intensity": "medium",
    "contrast": "medium-high"
  },
  "silhouette": {
    "complexity": "medium chaotic terrain markings",
    "readability_priority": true
  },
  "style": {
    "theme": "unfair chaotic battlefield",
    "material": "scuffed stone, dirty gold, crooked dice",
    "effects": ["scratches", "purple traps", "red-brown stains"]
  },
  "rules": {
    "must_follow": ["terrain identity", "crooked dice motif", "visible board grid", "empty text box"],
    "must_avoid": ["grid clutter", "single-player debuff read", "symbols that resemble legal move indicators"]
  }
}
```

---

END
