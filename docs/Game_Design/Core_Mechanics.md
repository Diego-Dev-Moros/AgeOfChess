# CORE MECHANICS

---

# 1. OVERVIEW

Age of Chess is built on a layered system composed of:

- Classical chess movement
- Dice-based combat resolution
- Health-based attrition
- King divinity economy
- Global modifiers (cards & terrain)
- Time-driven endgame system

---

# 2. CORE LOOP

Each turn follows:

1. Select a piece
2. Move according to chess rules
3. Resolve combat (if applicable)
4. Apply modifiers
5. Evaluate board state

---

# 3. CORE SYSTEM INTERACTION

The game operates through 5 interacting systems:

- Movement (deterministic)
- Combat (probabilistic)
- Attrition (HP)
- Modifiers (cards/terrain)
- Time (Frenzy phase)

---

# 4. DESIGN GOALS

- Preserve clarity of chess
- Add controlled randomness
- Ensure constant decision-making
- Prevent infinite states
- Guarantee match resolution

---

# 5. GAME PHASES

---

## Early Game
- Positioning
- Low-risk engagements

---

## Mid Game
- Frequent combat
- Resource (HP/divinity) management

---

## Late Game
- Reduced board
- Tactical precision

---

## Frenzy Phase
- No randomness
- Pure skill resolution

---

# 6. SYSTEM PRIORITY ORDER

When multiple effects apply:

1. Movement
2. Combat
3. Buffs/Debuffs
4. Terrain
5. Check/Checkmate

---

END