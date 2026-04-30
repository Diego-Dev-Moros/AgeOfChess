# Design Node Map

---

# 1. Purpose

This document connects the visual design layer to the gameplay design layer.

Use it as an Obsidian graph hub for checking whether every asset has a gameplay reason and every major gameplay system has a visual representation.

---

# 2. Core Gameplay Nodes

- [[Game_Design/Rules|Rules]]
- [[Game_Design/System|System]]
- [[Game_Design/Core_Mechanics|Core Mechanics]]
- [[Systems/Timing/Timing_And_Priority|Timing And Priority]]
- [[Edge_Cases]]

---

# 3. Visual Foundation Nodes

- [[Art_Direction/Art_Direction_Index|Art Direction Index]]
- [[Art_Direction/Style_Guide|Style Guide]]
- [[Art_Direction/Color_Palette|Color Palette]]
- [[Art_Direction/Lighting_and_Shading|Lighting and Shading]]
- [[Art_Direction/Pixel_Standards|Pixel Standards]]
- [[Art_Direction/Visual_Identity|Visual Identity]]
- [[Assets_Design/Assets_Design_Index|Assets Design Index]]

General asset design nodes:

- [[Assets_Design/Pieces_Design|Pieces Design]]
- [[Assets_Design/Board_Design|Board Design]]
- [[Assets_Design/Cards_Design|Cards Design]]
- [[Assets_Design/Dice_Design|Dice Design]]
- [[Assets_Design/UI_Design|UI Design]]

---

# 4. Piece Asset Connections

| Asset | Gameplay Node |
| --- | --- |
| [[Assets_Design/Pieces/Pawn|Pawn Asset]] | [[Game_Design/Pieces_System|Pieces System]] |
| [[Assets_Design/Pieces/Knight|Knight Asset]] | [[Game_Design/Pieces_System|Pieces System]] |
| [[Assets_Design/Pieces/Bishop|Bishop Asset]] | [[Game_Design/Pieces_System|Pieces System]] |
| [[Assets_Design/Pieces/Rook|Rook Asset]] | [[Game_Design/Pieces_System|Pieces System]] |
| [[Assets_Design/Pieces/Queen|Queen Asset]] | [[Game_Design/Pieces_System|Pieces System]] |
| [[Assets_Design/Pieces/King|King Asset]] | [[Systems/King/King|King System]] |

Supporting systems:

- [[Systems/Combat/Combat_Flow|Combat Flow]]
- [[Systems/Combat/Damage_Calculation|Damage Calculation]]
- [[Systems/Frenzy/Frenzy_Phase|Frenzy Phase]]

---

# 5. Card Asset Connections

## Buffs

| Asset | Gameplay Node |
| --- | --- |
| [[Assets_Design/Cards/Buffs/Giant_Slayer|Giant Slayer Asset]] | [[Systems/Cards/Buffs/Giant_Slayer|Giant Slayer Rules]] |
| [[Assets_Design/Cards/Buffs/Iron_Age|Iron Age Asset]] | [[Systems/Cards/Buffs/Iron_Age|Iron Age Rules]] |
| [[Assets_Design/Cards/Buffs/Last_Will|Last Will Asset]] | [[Systems/Cards/Buffs/Last_Will|Last Will Rules]] |
| [[Assets_Design/Cards/Buffs/Stone_Pieces|Stone Pieces Asset]] | [[Systems/Cards/Buffs/Stone_Pieces|Stone Pieces Rules]] |

## Debuffs

| Asset | Gameplay Node |
| --- | --- |
| [[Assets_Design/Cards/Debuffs/Cowardice|Cowardice Asset]] | [[Systems/Cards/Debuffs/Cowardice|Cowardice Rules]] |
| [[Assets_Design/Cards/Debuffs/Crystal_Pieces|Crystal Pieces Asset]] | [[Systems/Cards/Debuffs/Crystal_Pieces|Crystal Pieces Rules]] |
| [[Assets_Design/Cards/Debuffs/Fatigue|Fatigue Asset]] | [[Systems/Cards/Debuffs/Fatigue|Fatigue Rules]] |
| [[Assets_Design/Cards/Debuffs/Immoral|Immoral Asset]] | [[Systems/Cards/Debuffs/Immoral|Immoral Rules]] |

## Terrains

| Asset | Gameplay Node |
| --- | --- |
| [[Assets_Design/Cards/Terrains/Dirty_Play|Dirty Play Asset]] | [[Systems/Terrain/Dirty_Play|Dirty Play Rules]] |
| [[Assets_Design/Cards/Terrains/Equal_Conditions|Equal Conditions Asset]] | [[Systems/Terrain/Equal_Conditions|Equal Conditions Rules]] |
| [[Assets_Design/Cards/Terrains/Hell|Hell Asset]] | [[Systems/Terrain/Hell|Hell Rules]] |
| [[Assets_Design/Cards/Terrains/Holy_Ground|Holy Ground Asset]] | [[Systems/Terrain/Holy_Ground|Holy Ground Rules]] |
| [[Assets_Design/Cards/Terrains/Will|Will Asset]] | [[Systems/Terrain/Will|Will Rules]] |

Supporting systems:

- [[Systems/Cards/Cards_System|Cards System Reference]]
- [[Systems/Cards/Buffs|Buffs]]
- [[Systems/Cards/Debuffs|Debuffs]]
- [[Systems/Terrain/Terrain|Terrain System]]
- [[Balancing/Card_Balance|Card Balance]]

---

# 6. Board, Dice, And UI Connections

| Asset | Gameplay Node |
| --- | --- |
| [[Assets_Design/Board/Board|Board Asset]] | [[Game_Design/Rules|Rules]] |
| [[Assets_Design/Board/Board|Board Asset]] | [[Systems/Terrain/Terrain|Terrain System]] |
| [[Assets_Design/Dice/Dice|Dice Asset]] | [[Systems/Combat/Dice_System|Dice System]] |
| [[Assets_Design/Dice/Dice|Dice Asset]] | [[Systems/Combat/Combat_Flow|Combat Flow]] |
| [[Assets_Design/UI/UI|UI Asset]] | [[Systems/Timing/Timing_And_Priority|Timing And Priority]] |
| [[Assets_Design/UI/UI|UI Asset]] | [[Systems/Cards/Cards_System|Cards System Reference]] |
| [[Assets_Design/UI/UI|UI Asset]] | [[Systems/King/King|King System]] |
| [[Assets_Design/UI/UI|UI Asset]] | [[Systems/Frenzy/Frenzy_Phase|Frenzy Phase]] |

---

# 7. Simulation And Balance Connections

- [[Simulation/simulations_guide|Simulations Guide]]
- [[Simulation/simulation1|Simulation 1]]
- [[Simulation/simulation2|Simulation 2]]
- [[Simulation/simulation3|Simulation 3]]
- [[Balancing/Balance|Balance]]
- [[Balancing/Combat_Probabilities|Combat Probabilities]]
- [[Balancing/Card_Balance|Card Balance]]

---

# 8. Graph Rule

Every visual asset should connect to:

1. Its asset index.
2. Its art direction standards.
3. Its gameplay rule node.
4. Any balance or edge-case document that affects it.

No visual node should exist as isolated art documentation.

---

END
