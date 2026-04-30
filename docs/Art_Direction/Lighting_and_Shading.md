# Lighting and Shading

---

# 1. Light Direction

All sprites, cards, board tiles, dice, and UI ornaments use a consistent top-left key light.

Default direction:

```txt
Light source: upper-left
Shadow falloff: lower-right
```

This rule is mandatory unless an effect is explicitly magical and local, such as a glowing aura around a buffed piece.

---

# 2. Contrast Rules

Age of Chess should use strong contrast, but not uncontrolled contrast.

- Gameplay sprites need clear dark outer edges.
- Card focal objects can use stronger internal contrast.
- Board tiles need softer contrast so pieces remain dominant.
- UI elements need enough contrast for immediate reading.

Do not use bright highlights across large flat areas. Bright pixels are reserved for:

- Magical glints.
- Dice pips.
- Piece rim highlights.
- Card focal points.
- Active UI states.

---

# 3. Shadow Usage

Shadows must support grounding and readability.

Pieces:

- Use a small contact shadow below the sprite.
- Shadow shape should fit inside the tile and not hide terrain information.

Cards:

- Use deep background shadows to frame the focal illustration.
- Avoid black-only backgrounds without secondary color information.

Board:

- Use tile-edge shadows sparingly.
- Never allow shadows to make grid boundaries ambiguous.

UI:

- Use 1-2 px shadow steps on panels and buttons.
- Avoid soft blur.

---

# 4. Highlight Intensity

Highlight hierarchy:

1. Active magic and dice results.
2. Piece faces, crowns, weapons, or iconic top surfaces.
3. Card frame corners and title plate edges.
4. Board tile edges.
5. Inactive UI trim.

If everything glows, nothing is important. Only active, selected, buffed, or narratively focal objects should glow.

---

# 5. Pixel Shading Style

Use clustered pixel shading.

Rules:

- Prefer clean clusters over single-pixel noise.
- Use 3-5 value steps per material.
- Use hue shifting in shadows when it improves material identity.
- Avoid airbrush gradients.
- Avoid semi-transparent blur on core sprites.
- Use dithering only on large card illustrations or terrain surfaces, never on small piece faces.

---

# 8. Related Documentation

- [[Art_Direction/Art_Direction_Index|Art Direction Index]]
- [[Art_Direction/Style_Guide|Style Guide]]
- [[Art_Direction/Color_Palette|Color Palette]]
- [[Assets_Design/Assets_Design_Index|Assets Design Index]]
- [[Design_Node_Map]]

---

END
