# Visual Decisions and Open Questions

---

# 1. Purpose

This document records the visual decisions required before production art begins.

The current direction is provisional. It exists so the project can move forward with a coherent baseline, but it must be validated with a small art test before large-scale asset production.

---

# 2. Current Recommended Baseline

| Topic | Recommendation | Reason |
| --- | --- | --- |
| Visual tone | Magical medieval strategy, serious but readable | Fits chess, dice combat, terrain, and card effects without becoming generic high fantasy |
| Detail level | Rich focal art for cards, restrained detail for board and sprites | Cards can carry atmosphere; gameplay assets must remain readable |
| Piece sprite size | 48x48 px | Better silhouette and faction glow than 32x32 while still economical for production |
| Board tile size | 64x64 px base tile | Leaves room for terrain texture without fighting piece readability |
| Camera | Top-down board, front-facing card art, orthographic UI | Best for tactical clarity |
| Card ratio | 2:3 | Matches the provided references and collectible-card readability |
| Lighting | Top-left key light | Standardizes highlights, shadows, and sprite volume |
| UI complexity | Functional first, decorative at edges only | Avoids burying game state under ornament |
| Faction split | Light stone/gold versus dark basalt/emerald-violet | Clear enough without reducing factions to plain white and black |
| Dice motif | Subtle rune-dice iconography | Supports the combat system without turning every asset into a dice symbol |

---

# 3. Questions To Resolve Before Final Art Production

These questions should be answered after the first playable visual prototype:

- Should pieces be rendered as literal chess statues, living magical constructs, or hybrid statues with animated energy?
- Should card frames be highly ornate like the Giant Slayer reference, or simplified for faster production?
- Should all cards use dark illustration backgrounds, or should terrain cards use wider environmental palettes?
- Should board terrain affect only tile color/effects, or also add edge props outside the grid?
- Should dice be purely UI objects, or physical magical objects shown inside card art and combat effects?
- Should faction identity be primarily material-based, glow-based, or silhouette-based?
- Is 48x48 sufficient on the smallest target platform, or does mobile require 64x64 pieces?
- How much animation is expected: idle glow only, full attack effects, damage states, or card reveal animations?
- Should UI use pixel fonts everywhere, or only on cards and compact labels?
- What is the minimum supported screen size?

---

# 4. Strict Notes

The highly ornate Giant Slayer frame is attractive, but it is expensive. If every card requires that level of border detail, content production will slow down and consistency will be harder to maintain.

The board must not copy the same ornament density as the cards. A noisy board will damage the game more than a plain board will.

The safest production split is:

- Cards: richest visual identity.
- Pieces: strong silhouette and faction readability.
- Board: low-noise tactical clarity.
- UI: restrained, fast to parse.
- Dice: high-contrast icons with limited animation.

---

END
