# Pieces Design

---

# 1. Purpose

Chess pieces are the primary gameplay units.

Their silhouettes must be immediately readable on every terrain and at every supported gameplay scale.

Design node connections:

- [[Design_Node_Map]]
- [[Assets_Design/Pieces/Pieces_Index|Pieces Asset Design Index]]
- [[Game_Design/Pieces_System|Pieces System]]
- [[Systems/Combat/Combat_Flow|Combat Flow]]
- [[Systems/Combat/Damage_Calculation|Damage Calculation]]
- [[Systems/King/King|King System]]
- [[Systems/Frenzy/Frenzy_Phase|Frenzy Phase]]
- [[Art_Direction/Pixel_Standards|Pixel Standards]]
- [[Art_Direction/Color_Palette|Color Palette]]

---

# 2. Gameplay Role

Pieces represent classical chess identities with additional combat attributes, HP states, faction identity, and magical status effects.

The player must recognize:

1. Piece type.
2. Faction.
3. Current state.
4. Selection or targeting status.

---

# 3. Visual Concept

Pieces are enchanted medieval chess statues.

Base material:

- Light faction: pale stone, ivory, gold trim, blue-white glow.
- Dark faction: basalt, dark metal, tarnished trim, emerald or violet glow.

All pieces share carved stone mass, top-left lighting, and subtle magical energy.

---

# 4. Shared Shape and Silhouette Rules

- Sprite size is always 48x48 px.
- Keep a 2 px transparent safety margin.
- Use one dark 1 px outer outline.
- Base center aligns to tile center.
- Taller pieces may approach the top margin but must not clip.
- Faction variants must preserve the same piece silhouette.

---

# 5. Shared Color Rules

- Do not make the light faction pure white.
- Do not make the dark faction pure black.
- Use value contrast first, hue contrast second.
- Glow is a faction/state accent, not the main body color.
- Buff overlays use green/blue.
- Debuff overlays use purple/red.
- Damage uses cracks, dimmed highlights, and small missing chips.

---

# 6. Shared Lighting Rules

- Top-left highlight on head, crown, tower top, or upper body.
- Lower-right shadow and contact shadow.
- State glow may emit local light but must not flatten the sprite.

---

# 7. Shared Variants

Required:

- Light faction normal.
- Dark faction normal.
- Damaged.
- Buffed.
- Debuffed.
- Selected.
- Legal move target.
- Attack target.

Optional:

- Low HP pulse.
- Death crumble.
- Card-triggered empowered state.

---

# 8. Implementation Notes: Godot

- Use one `Sprite2D` or `AnimatedSprite2D` for the base piece.
- Use separate overlay sprites for buff, debuff, selected, and target states.
- Keep state overlays aligned to 48x48 px.
- Disable texture filtering.
- Prefer shader-based tinting only for temporary effects; permanent faction art should be authored.

---

# 9. Pawn

## Purpose

The Pawn is the smallest and most numerous unit.

## Gameplay Role

It must read clearly in groups and remain recognizable when buffed, damaged, or placed on dense terrain.

## Shape Identity

- Small round or helmet-like head.
- Simple narrow neck.
- Compact base.
- Minimal ornament.

## Size and Scale

- Height target: 30-34 px inside the 48x48 frame.
- Width target: 20-24 px.

## Material

Carved stone with small faction glow at the base or head.

## Readability at Small Sizes

The Pawn must remain readable by its simple vertical shape and round head. Do not add weapons or complex props.

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

# 10. Knight

## Purpose

The Knight must read as the most angular and mobile piece.

## Gameplay Role

It needs instant recognition because knight movement is non-linear and tactically dangerous.

## Shape Identity

- Horse head, angular helm, or hooked forward silhouette.
- Strong neck curve.
- Asymmetric upper profile.

## Size and Scale

- Height target: 36-40 px.
- Width target: 26-30 px.

## Material

Carved stone and metal plates, with controlled faction glow in eye or mane cuts.

## Readability at Small Sizes

The hooked head is mandatory. Decorative mane detail must not blur the profile.

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

# 11. Bishop

## Purpose

The Bishop must read as tall, narrow, and arcane.

## Gameplay Role

It represents diagonal pressure and should feel ritualistic without losing the chess-piece identity.

## Shape Identity

- Tall mitre shape or vertical slit.
- Narrow body.
- Staff-like or ceremonial profile.

## Size and Scale

- Height target: 38-42 px.
- Width target: 22-26 px.

## Material

Polished stone with rune channel or glowing mitre cut.

## Readability at Small Sizes

The head slit or mitre shape is mandatory. Avoid making it look like a Queen crown.

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

# 12. Rook

## Purpose

The Rook must read as heavy, stable, and defensive.

## Gameplay Role

It represents straight-line pressure and high board control.

## Shape Identity

- Tower silhouette.
- Battlement top.
- Wide base.
- Strong blocky verticals.

## Size and Scale

- Height target: 36-40 px.
- Width target: 28-32 px.

## Material

Fortress stone, chipped blocks, metal bands, and subtle runic mortar.

## Readability at Small Sizes

The battlement top is mandatory. Avoid making the Rook too ornate or crown-like.

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

# 13. Queen

## Purpose

The Queen must read as the most elegant and dangerous non-King piece.

## Gameplay Role

It represents high mobility and high tactical threat.

## Shape Identity

- Tall body.
- Crown with multiple points.
- Elegant taper.
- Strong central vertical line.

## Size and Scale

- Height target: 42-44 px.
- Width target: 28-32 px.

## Material

Polished enchanted stone, gold trim, and stronger aura than minor pieces.

## Readability at Small Sizes

The crown must be readable but not wider than the King authority silhouette.

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

# 14. King

## Purpose

The King is the central win-condition piece and must be visually authoritative.

## Gameplay Role

It must be recognized instantly, even when surrounded by effects, because checkmate remains the core win condition.

## Shape Identity

- Widest royal posture.
- Crown, cross, halo, or authority mark.
- Heavy base.
- Strong vertical center.

## Size and Scale

- Height target: 43-46 px.
- Width target: 30-34 px.

## Material

Ancient divine stone with controlled sacred or corrupted faction glow.

## Readability at Small Sizes

The authority mark must not be optional. It separates the King from the Queen.

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
