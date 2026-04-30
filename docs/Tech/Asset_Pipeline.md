# Asset Pipeline

---

# 1. Purpose

This document defines how assets move from idea to Godot implementation.

Pipeline:

```txt
Idea in Obsidian
  -> Prompt
    -> Generated or hand-made asset
      -> Asset storage
        -> Godot import
          -> Scene usage
```

Primary references:

- [[Design_Node_Map]]
- [[Art_Direction/Art_Direction_Index|Art Direction Index]]
- [[Art_Direction/Pixel_Standards|Pixel Standards]]
- [[Assets_Design/Assets_Design_Index|Assets Design Index]]
- [[Assets_Design/UI_Design|UI Design]]
- [[Tech/Godot/Scenes|Scenes]]
- [[Tech/Godot/Nodes_Architecture|Nodes Architecture]]

---

# 2. Technical Baseline

| Asset Rule | Standard |
| --- | --- |
| Base game resolution | 1280x720 |
| Board tile | 64x64 px |
| Board size | 512x512 px |
| Piece sprite | 48x48 px |
| Dice icon | 24x24 px |
| Combat dice display | 32x32 px |
| UI icon | 16x16 px or 24x24 px |
| Card master art | 768x1152 px |
| Card thumbnail | 192x288 px |
| Pixel filtering | Off |
| Mipmaps | Off for pixel sprites and UI |
| Compression | Lossless or VRAM lossless |

---

# 3. Folder Structure

Recommended structure:

```txt
assets/
  art/
    board/
    cards/
      buffs/
      debuffs/
      terrain/
    dice/
    pieces/
      white/
      black/
    terrain/
    ui/
  source/
    board/
    cards/
    pieces/
    ui/
  exports/
    board/
    cards/
    pieces/
    ui/
```

Godot-facing files should use final exported assets, not raw working files.

---

# 4. Step 1: Idea In Obsidian

Every asset begins as a design node.

Required design links:

- Gameplay rule document.
- Asset design document.
- Art direction document.
- Balance or edge-case document if relevant.

Example:

```txt
Systems/Cards/Buffs/Giant_Slayer.md
Assets_Design/Cards/Buffs/Giant_Slayer.md
Art_Direction/Style_Guide.md
```

Rule:

No production asset should exist without a gameplay or interface reason.

---

# 5. Step 2: Prompt

Prompts live under:

```txt
prompts/
```

Prompt files should define:

- Asset name.
- Gameplay purpose.
- Visual purpose.
- Required dimensions.
- Style constraints.
- Palette constraints.
- Forbidden elements.
- Export target.

Prompt names should match the asset id.

Example:

```txt
prompts/cards/buffs/giant_slayer_prompt.md
```

---

# 6. Step 3: Asset Generation

Allowed sources:

- AI-generated draft.
- Hand-drawn pixel art.
- Edited AI output.
- Procedural or template-based UI asset.

Rules:

- Generated assets must be cleaned before production use.
- Pixel art must respect exact dimensions.
- UI text must not be baked into textures if it changes during gameplay.
- Card art may be high resolution, but gameplay thumbnails must follow the defined card ratio.

---

# 7. Step 4: Asset Storage

Use two categories:

| Category | Purpose |
| --- | --- |
| `source` | Editable source files |
| `exports` or final art folders | Godot-ready files |

Recommended formats:

| Asset Type | Format |
| --- | --- |
| Pixel sprites | PNG |
| UI panels | PNG or NinePatch-compatible PNG |
| Card art | PNG |
| Raw layered source | Aseprite, PSD, or Krita file |
| Data definitions | `.tres`, `.res`, JSON, or GDScript Resource |

---

# 8. Step 5: Godot Import

Godot import rules:

```txt
Filter: Off
Mipmaps: Off for UI and pixel sprites
Compression: Lossless or VRAM lossless
```

Additional rules:

- Disable smoothing for pixel art.
- Keep sprite pivots consistent.
- Keep piece origins aligned to tile center.
- Do not scale sprites arbitrarily in scenes.
- Prefer re-exporting at correct size over fixing scale in Godot.

---

# 9. Step 6: Scene Usage

Assets should be referenced by:

- `PieceStats` resources for piece sprites.
- `CardDefinition` resources for card art.
- `TerrainDefinition` resources for terrain overlays.
- UI theme resources for panels, fonts, and icons.

Scenes should not hard-code asset paths when a data resource can own the reference.

---

# 10. Asset Validation Checklist

Before an asset enters production:

- It has an Obsidian design source.
- It has a prompt or source file.
- It follows pixel size standards.
- It uses the correct file name.
- It is readable at gameplay scale.
- It has Godot import settings configured.
- It is linked from the relevant data resource.
- It does not bake dynamic gameplay values into the image.

---

# 11. MVP Asset Scope

Required:

- Board tiles.
- Terrain overlays.
- White and black piece sprites.
- Basic HP indicators.
- Dice icons.
- Card frames.
- Card backs.
- Buff, debuff, and terrain card thumbnails.
- Core UI panels and buttons.

Optional:

- Movement animations.
- Death animations.
- Terrain effect animations.
- Advanced card reveal animations.
- Alternate board skins.

---

# 12. Future Web Export Considerations

Because Web is a possible future target:

- Keep texture sizes reasonable.
- Avoid unnecessary large atlases.
- Keep file names lowercase and stable.
- Avoid platform-specific paths.
- Keep game state separate from asset instances.

---

END
