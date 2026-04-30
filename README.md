# Age of Chess

Age of Chess is a tactical chess variant where classical movement remains intact, captures are resolved through controlled dice combat, pieces have HP, cards and terrain modify the battlefield, and the King is governed by a powerful but risky Divinity system.

The project is currently focused on game design documentation, system validation, and simulation-driven balancing inside an Obsidian-ready documentation vault.

The documentation now also includes a visual design system for pixel art production, covering art direction, cards, pieces, board, UI, and dice.

---

## Project Identity

Age of Chess is not pure chess, pure RPG, pure randomness, or a card game replacing board strategy.

It is:

```txt
A probabilistic tactical chess variant where positioning, risk, sacrifice, and resource management interact.
```

The game keeps:

- Standard 8x8 chess board
- Standard piece movement
- Checkmate as the primary win condition
- Classical check and checkmate logic

The game adds:

- Dice-based combat for non-King pieces
- Health points for pieces
- Buff and Debuff cards
- Public global Terrain
- King Divinity and Divine Attack
- A deterministic Frenzy endgame phase

---

## Current Design Status

Current state:

```txt
Playable core system designed.
Documentation architecture established.
Major systems defined.
Simulations expanded.
Ready for structured playtesting and balance validation.
```

The game is not final-balanced yet.

The current priority is to keep the documentation coherent, test edge cases through simulations, and validate whether the systems create readable and fair tactical decisions.

---

## Core Systems

### Combat

Normal combat occurs when a non-King piece attacks an enemy non-King piece.

Combat uses:

- Attack Dice
- Defense Dice
- Top 3 Dice Rule
- Tie Rule
- Momentum Rule
- Minimum Damage Rule
- Anti-Stall Rule

Reference:

- `docs/Systems/Combat/Combat_Flow.md`
- `docs/Systems/Combat/Dice_System.md`
- `docs/Systems/Combat/Damage_Calculation.md`

### King Divinity

The King:

- Does not use normal combat
- Has no HP
- Cannot be killed by damage
- Loses only by checkmate
- Uses Divinity for Divine Attack

Divine Attack instantly removes a legal target but costs Divinity and creates Commitment risk.

Divine Attack as a check response is currently proposed, not official. The current proposed limit is:

```txt
Each player may use Divine Attack as a check response only once per match.
```

Reference:

- `docs/Systems/King/King.md`

### Cards

Each player receives:

- 1 Buff
- 1 Debuff applied to the opponent

Current card rule:

```txt
Cards are secretly active from match start and reveal on first public trigger.
```

Terrain is different: it is public before the match begins.

Reference:

- `docs/Systems/Cards/Cards_System.md`
- `docs/Systems/Cards/Buffs.md`
- `docs/Systems/Cards/Debuffs.md`

### Terrain

One Terrain is active per match.

Terrain is:

- Public
- Global
- Symmetric
- Active until Frenzy unless stated otherwise

Reference:

- `docs/Systems/Terrain/Terrain.md`

### Frenzy

When the match reaches the final minute:

- All non-King pieces become 1 HP
- Dice are disabled
- Normal combat is disabled
- Captures become instant
- Combat-related cards and terrain are disabled
- Divine Attack is disabled by default

Frenzy turns the final phase into deterministic chess-like resolution.

Reference:

- `docs/Systems/Frenzy/Frenzy_Phase.md`

---

## Documentation Vault

The main project brain lives in:

```txt
docs/
```

Recommended entry point:

```txt
docs/Home.md
```

Important navigation files:

- `docs/Systems_Index.md`
- `docs/Cards_Index.md`
- `docs/Terrain_Index.md`
- `docs/Balancing_Index.md`
- `docs/Art_Direction/Art_Direction_Index.md`
- `docs/Assets_Design/Assets_Design_Index.md`
- `docs/Edge_Cases.md`

Canonical timing reference:

- `docs/Systems/Timing/Timing_And_Priority.md`

Official player-facing rules:

- `docs/Game_Design/Rules.md`

Core system overview:

- `docs/Game_Design/System.md`

---

## Visual Design System

The visual foundation lives in:

```txt
docs/Art_Direction/
docs/Assets_Design/
```

Recommended visual entry points:

- `docs/Art_Direction/Art_Direction_Index.md`
- `docs/Assets_Design/Assets_Design_Index.md`
- `docs/Assets_Design/Cards/Cards_Index.md`
- `docs/Assets_Design/Pieces/Pieces_Index.md`
- `docs/Assets_Design/Board/Board_Index.md`
- `docs/Assets_Design/UI/UI_Index.md`
- `docs/Assets_Design/Dice/Dice_Index.md`

The art direction defines:

- Pixel art style.
- Palette.
- Lighting and shading.
- Visual identity.
- Pixel production standards.

The asset design system defines:

- Per-card visual specs for Buffs, Debuffs, and Terrain.
- Per-piece sprite specs for Pawn, Knight, Bishop, Rook, Queen, and King.
- Board and terrain visual rules.
- UI rules for cards, HP, dice, and interaction states.
- Dice icon and combat dice rules.

Obsidian links in the visual docs use path-qualified links where names overlap with gameplay documents.

---

## Simulations

The current simulation set is used to validate system behavior and expose design risks.

Files:

- `docs/Simulation/simulation1.md`
- `docs/Simulation/simulation2.md`
- `docs/Simulation/simulation3.md`
- `docs/Simulation/simulations_guide.md`

Current findings:

- Stone Pieces is strong and should be monitored.
- Divine Attack as check response must remain heavily limited.
- Fatigue is currently best tested as adjacent 3x3 targeting.
- Dirty Play and Cowardice require the 20% probability cap.
- Frenzy creates clean endings, but time victories should be watched.

---

## Open Design Questions

Current unresolved or test-dependent topics:

- Whether Divine Attack as check response should become official.
- Whether the once-per-match check-response limit is enough.
- Whether Fatigue adjacent 3x3 targeting should become final.
- Whether Demon King should remain below -3 or become easier to reach.
- Whether Stone Pieces is too consistent with Minimum Damage Rule.
- Whether time victory occurs too often compared with checkmate.

These are tracked in:

- `docs/Edge_Cases.md`
- `docs/Balancing/Combat_Probabilities.md`
- `docs/Balancing/Card_Balance.md`
- `docs/Simulation/simulations_guide.md`

---

## Repository Structure

Current relevant structure:

```txt
docs/
+-- Game_Design/
+-- Systems/
+-- Balancing/
+-- Simulation/
+-- Art_Direction/
+-- Assets_Design/
|   +-- Cards/
|   |   +-- Buffs/
|   |   +-- Debuffs/
|   |   +-- Terrains/
|   +-- Pieces/
|   +-- Board/
|   +-- UI/
|   +-- Dice/
+-- Home.md
+-- Systems_Index.md
+-- Cards_Index.md
+-- Terrain_Index.md
+-- Balancing_Index.md
+-- Edge_Cases.md
```

Other project folders may be added as implementation begins.

---

## Design Direction

Future additions should preserve these principles:

- Checkmate remains the main objective.
- Chess movement stays deterministic.
- Randomness stays bounded.
- Strong effects must have costs.
- Frenzy remains clean and deterministic.
- Cards and Terrain should create decisions, not automatic outcomes.
- The King should be powerful, but never safe to abuse.

---

## Short Pitch

Age of Chess is chess with tactical combat, controlled randomness, and a divine King whose power can win the board or corrupt the army.
