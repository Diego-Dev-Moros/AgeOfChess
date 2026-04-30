# Cards Design

---

# 1. Purpose

Cards communicate hidden or public rule modifiers through a collectible fantasy card format.

They carry the richest visual detail in the project because players can inspect them outside the dense board grid.

Design node connections:

- [[Design_Node_Map]]
- [[Assets_Design/Cards/Cards_Index|Cards Asset Design Index]]
- [[Systems/Cards/Cards_System|Cards System Reference]]
- [[Systems/Cards/Buffs|Buffs]]
- [[Systems/Cards/Debuffs|Debuffs]]
- [[Systems/Terrain/Terrain|Terrain System]]
- [[Balancing/Card_Balance|Card Balance]]
- [[Art_Direction/Style_Guide|Style Guide]]
- [[Art_Direction/Color_Palette|Color Palette]]

---

# 2. Gameplay Role

Cards define match modifiers:

- Buff cards benefit the owning player.
- Debuff cards pressure the opponent.
- Terrain cards define the global battlefield condition.

Cards must make their category readable before the player reads the text.

---

# 3. Visual Concept

Cards use an ornate medieval fantasy frame, parchment title and text areas, and a central pixel art illustration.

The card aesthetic is based on the provided Giant Slayer reference:

- Strong outer frame.
- Parchment title plate.
- Dark illustration field.
- Magical particles.
- Subtle dice symbols.
- Empty parchment text box.

This level of ornament should be reserved for cards. The board and UI must remain more restrained.

---

# 4. Shape and Silhouette Rules

- Card aspect ratio is always 2:3.
- Outer frame must be thick enough to show type identity at thumbnail size.
- Corners may use vines, runes, stone chips, metal caps, or dice marks.
- Title plate must be rectangular or slightly carved, never free-floating.
- Illustration must have one clear focal shape.
- Text box must be empty in art exports unless the UI layer is rendering text.

---

# 5. Color Rules

| Card Type | Border | Main Glow | Frame Material |
| --- | --- | --- | --- |
| Buff | Arcane green or blue | Green, blue, white | Gold and carved stone |
| Debuff | Red or corrupt purple | Red, purple, sickly green | Tarnished gold or blackened metal |
| Terrain Buff | Gold plus terrain color | Gold, blue, green | Stone, gold, environmental trim |
| Terrain Debuff | Black, red, purple | Red, purple, toxic green | Burnt metal, cracked stone |

Parchment zones use `#E7C985`, `#F0DDA7`, and `#FFF1C2`.

---

# 6. Lighting Rules

- Use top-left key light on frame, title plate, and focal illustration.
- Magical effects may emit local light, but they must not erase the main lighting direction.
- Highest contrast belongs to the central illustration and revealed card state.
- Border glow must not overpower title readability.

---

# 7. Readability Requirements

Cards must pass:

- Type read from border color and shape.
- Title area read at normal card display size.
- Illustration recognized at thumbnail size.
- Empty text box clearly separated from art.
- Dice motifs visible but not dominant.

---

# 8. Layout Rules

| Area | Rule |
| --- | --- |
| Title | Top parchment nameplate, centered, uppercase English title |
| Illustration | Center panel, largest area, one focal image |
| Text box | Bottom parchment rectangle, empty in art source |
| Icon usage | Dice, piece silhouettes, terrain symbols, and runes only |
| Background | Dark or environmental, low-noise, with controlled particles |

---

# 9. Variants

Required variants:

- Hidden card back.
- Revealed Buff.
- Revealed Debuff.
- Revealed Terrain.
- Disabled or inactive state.
- Hovered or selected state.

Optional variants:

- Legendary ornate border.
- Temporary effect countdown badge.
- Card reveal flash.

---

# 10. Implementation Notes: Godot

- Import card art with filtering off.
- Keep card text rendered by UI when possible.
- Use separate layers for frame, illustration, text box, and type badge if animation is required.
- Card thumbnails should use the same source art scaled with nearest-neighbor.
- Do not bake gameplay text into reusable card art unless producing marketing exports.

---

# 11. Buff Card JSON

```json
{
  "asset_name": "Buff Card",
  "type": "card",
  "category": "buff",
  "resolution": "768x1152 px master, 192x288 px thumbnail",
  "palette": {
    "primary": ["#1F8A4C", "#35C56F", "#8CFFB1"],
    "secondary": ["#8C6324", "#C4923A", "#F0C95A"],
    "accent": ["#FFFBE2", "#9DE7FF", "#2DB6A3"]
  },
  "lighting": {
    "direction": "top-left key light with controlled magical local glow",
    "intensity": "high on focal object, medium on frame",
    "contrast": "high illustration contrast, medium border contrast"
  },
  "silhouette": {
    "complexity": "high frame complexity, single readable illustration focal point",
    "readability_priority": true
  },
  "style": {
    "theme": "beneficial arcane medieval chess magic",
    "material": "gold trim, parchment, carved stone, green-blue magic",
    "effects": ["upward particles", "soft aura", "subtle dice symbols", "gold glints"]
  },
  "rules": {
    "must_follow": ["2:3 aspect ratio", "green or blue border identity", "empty description box", "clear title plate", "single focal illustration"],
    "must_avoid": ["red-dominant frame", "crowded text box", "blurred particles", "multiple competing focal objects"]
  }
}
```

---

# 12. Debuff Card JSON

```json
{
  "asset_name": "Debuff Card",
  "type": "card",
  "category": "debuff",
  "resolution": "768x1152 px master, 192x288 px thumbnail",
  "palette": {
    "primary": ["#37184F", "#7131A4", "#C27CFF"],
    "secondary": ["#6B1618", "#B9342B", "#3A3E42"],
    "accent": ["#FF6A4D", "#91E36A", "#FFFBE2"]
  },
  "lighting": {
    "direction": "top-left key light with lower ambient fill",
    "intensity": "medium-high on focal curse object",
    "contrast": "high, with deep shadows and sharp highlights"
  },
  "silhouette": {
    "complexity": "high frame complexity with broken or thorned accents",
    "readability_priority": true
  },
  "style": {
    "theme": "harmful curse, corruption, tactical disruption",
    "material": "blackened metal, cracked stone, tarnished gold, corrupt magic",
    "effects": ["downward particles", "distortion", "smoke", "cracks", "corrupt runes"]
  },
  "rules": {
    "must_follow": ["purple or red border identity", "oppressive background", "clear title plate", "empty description box", "recognizable debuff symbol"],
    "must_avoid": ["bright heroic mood", "green-blue buff dominance", "unclear curse source", "visual noise in title area"]
  }
}
```

---

# 13. Terrain Card JSON

```json
{
  "asset_name": "Terrain Card",
  "type": "card",
  "category": "terrain",
  "resolution": "768x1152 px master, 192x288 px thumbnail",
  "palette": {
    "primary": ["#3A3E42", "#555B5D", "#777E7A"],
    "secondary": ["#8C6324", "#C4923A", "#F0C95A"],
    "accent": ["#245D8F", "#B9342B", "#7131A4", "#91E36A"]
  },
  "lighting": {
    "direction": "top-left environmental light",
    "intensity": "medium, with accent glow based on terrain type",
    "contrast": "medium-high, lower than buff and debuff focal effects"
  },
  "silhouette": {
    "complexity": "environmental composition with clear terrain symbol",
    "readability_priority": true
  },
  "style": {
    "theme": "public battlefield condition",
    "material": "stone, terrain surface, environmental magic, carved frame",
    "effects": ["ambient particles", "terrain glow", "subtle board grid motif", "dice runes"]
  },
  "rules": {
    "must_follow": ["public terrain identity", "environment color language", "empty description box", "clear terrain category", "low-noise composition"],
    "must_avoid": ["character-like focal confusion", "hidden-card language", "overly busy landscape", "board details that obscure type identity"]
  }
}
```

---

END
