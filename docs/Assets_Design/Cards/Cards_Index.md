# Cards Asset Design Index

---

# 1. Purpose

This folder contains per-card visual specifications for Age of Chess.

Each card asset file defines the visual production rules for one card, including layout, border language, color identity, readability rules, Godot notes, and a JSON design spec.

---

# 2. Structure

| Folder | Contents |
| --- | --- |
| [[Assets_Design/Cards/Buffs/Buffs_Assets_Index|Buffs]] | Beneficial player cards |
| [[Assets_Design/Cards/Debuffs/Debuffs_Assets_Index|Debuffs]] | Negative opponent-pressure cards |
| [[Assets_Design/Cards/Terrains/Terrains_Assets_Index|Terrains]] | Public global battlefield cards |

---

# 3. Gameplay Connections

Card assets must connect to both their visual asset file and their gameplay rule file.

Core card systems:

- [[Systems/Cards/Cards_System|Cards System Reference]]
- [[Systems/Cards/Buffs|Buffs]]
- [[Systems/Cards/Debuffs|Debuffs]]
- [[Systems/Terrain/Terrain|Terrain System]]
- [[Balancing/Card_Balance|Card Balance]]
- [[Design_Node_Map]]

---

# 4. Shared Card Layout

All cards use:

- 2:3 aspect ratio.
- Top parchment title plate.
- Central pixel art illustration.
- Bottom parchment description box.
- Type-colored border.
- Subtle dice motifs.
- Dynamic gameplay text rendered by UI when possible.

---

# 5. Card Asset Files

## Buffs

- [[Assets_Design/Cards/Buffs/Giant_Slayer|Giant Slayer Asset]] / [[Systems/Cards/Buffs/Giant_Slayer|Giant Slayer Rules]]
- [[Assets_Design/Cards/Buffs/Iron_Age|Iron Age Asset]] / [[Systems/Cards/Buffs/Iron_Age|Iron Age Rules]]
- [[Assets_Design/Cards/Buffs/Last_Will|Last Will Asset]] / [[Systems/Cards/Buffs/Last_Will|Last Will Rules]]
- [[Assets_Design/Cards/Buffs/Stone_Pieces|Stone Pieces Asset]] / [[Systems/Cards/Buffs/Stone_Pieces|Stone Pieces Rules]]

## Debuffs

- [[Assets_Design/Cards/Debuffs/Cowardice|Cowardice Asset]] / [[Systems/Cards/Debuffs/Cowardice|Cowardice Rules]]
- [[Assets_Design/Cards/Debuffs/Crystal_Pieces|Crystal Pieces Asset]] / [[Systems/Cards/Debuffs/Crystal_Pieces|Crystal Pieces Rules]]
- [[Assets_Design/Cards/Debuffs/Fatigue|Fatigue Asset]] / [[Systems/Cards/Debuffs/Fatigue|Fatigue Rules]]
- [[Assets_Design/Cards/Debuffs/Immoral|Immoral Asset]] / [[Systems/Cards/Debuffs/Immoral|Immoral Rules]]

## Terrains

- [[Assets_Design/Cards/Terrains/Dirty_Play|Dirty Play Asset]] / [[Systems/Terrain/Dirty_Play|Dirty Play Rules]]
- [[Assets_Design/Cards/Terrains/Equal_Conditions|Equal Conditions Asset]] / [[Systems/Terrain/Equal_Conditions|Equal Conditions Rules]]
- [[Assets_Design/Cards/Terrains/Hell|Hell Asset]] / [[Systems/Terrain/Hell|Hell Rules]]
- [[Assets_Design/Cards/Terrains/Holy_Ground|Holy Ground Asset]] / [[Systems/Terrain/Holy_Ground|Holy Ground Rules]]
- [[Assets_Design/Cards/Terrains/Will|Will Asset]] / [[Systems/Terrain/Will|Will Rules]]

---

END
