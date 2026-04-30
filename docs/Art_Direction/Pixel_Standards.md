# Pixel Standards

---

# 1. Purpose

This is the critical production standard for pixel art assets.

If an asset violates this document, it should not enter production without a deliberate exception.

---

# 2. Mandatory Sprite Sizes

| Asset | Mandatory Size |
| --- | --- |
| Chess piece sprite | 48x48 px |
| Piece state overlay | 48x48 px |
| Board tile | 64x64 px |
| Full board base | 512x512 px |
| Dice icon | 24x24 px |
| Combat dice display | 32x32 px |
| UI icon | 16x16 px or 24x24 px |
| Card art master | 768x1152 px, 2:3 ratio |
| Card thumbnail | 192x288 px |

The piece standard is 48x48 px. Do not mix 32x32, 48x48, and 64x64 pieces in production unless the game changes scale globally.

---

# 3. Grid Alignment Rules

Pieces:

- Fit within 48x48 px.
- Keep a 2 px transparent safety margin.
- Align the base center to the tile center.
- Use consistent visual height per piece rank.

Board:

- Tiles are 64x64 px.
- Grid lines must remain visible at 100 percent zoom.
- Terrain overlays must not cover more than 25 percent of a tile interior.

Cards:

- Maintain exact 2:3 ratio.
- Title area, illustration area, and text box must align to a shared template.

---

# 4. Outline Rules

Pieces:

- Use a dark 1 px outer outline.
- Use selective inner outlines for material separation.
- Do not outline glow effects with hard black.

Cards:

- Outer border may be 4-8 px at card master resolution.
- Inner illustration frame must separate art from text box.

UI:

- Use 1-2 px outlines.
- Avoid overly ornate outlines on functional controls.

---

# 5. Anti-Aliasing Rules

Allowed:

- Manual pixel anti-aliasing on large card art and curved ornaments.
- One-step colored edge pixels where needed.

Avoid:

- Automatic smoothing.
- Blurred edges.
- Subpixel gradients.
- Semi-transparent outlines on core sprites.

Godot import rule:

```txt
Filter: Off
Mipmaps: Off for UI and pixel sprites
Compression: Lossless or VRAM lossless where appropriate
```

---

# 6. Level of Detail Limits

Piece detail must not exceed gameplay readability.

| Piece | Primary Read Cue |
| --- | --- |
| Pawn | Small round head and simple base |
| Knight | Horse head or angular helm silhouette |
| Bishop | Tall mitre/slit or staff-like shape |
| Rook | Tower battlement top |
| Queen | Crown and tall elegant body |
| King | Cross/crown authority mark and widest royal posture |

If the detail competes with the read cue, remove the detail.

---

# 7. Readability Constraints

Every piece must pass:

- 100 percent scale read.
- 75 percent scale read.
- Board-background read on all terrain variants.
- Light and dark faction comparison.
- Buffed and debuffed state comparison.

Cards must pass:

- Card type identifiable from border color.
- Title plate readable at card view.
- Illustration focal object recognizable in thumbnail.
- Empty text box visibly separate from illustration.

---

END
