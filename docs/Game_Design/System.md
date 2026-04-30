# AGE OF CHESS — CORE SYSTEM DESIGN

---

# 1. DESIGN PHILOSOPHY

Age of Chess is built on five core pillars:

1. Classical clarity (chess rules remain intact)
2. Controlled randomness (dice influence, not dominate)
3. Progressive resolution (no infinite states)
4. Strategic trade-offs (power always has cost)
5. Forced convergence (game must always end)

---

# 2. GAME STRUCTURE

---

## 2.1 Board

- Standard 8×8 chess board
- Standard initial setup
- White plays first

---

## 2.2 Victory Condition

- Win by checkmate
- King cannot be killed by damage

---

## 2.3 Time System

- Total match duration: 10 minutes

---

## 2.4 Frenzy Phase (Endgame System)

When remaining time ≤ 1 minute:

Global changes:

- All pieces HP → 1
- Combat system disabled
- Dice system disabled
- Buffs/debuffs affecting combat become irrelevant

Game becomes:

→ Pure chess resolution

Purpose:

- Prevent infinite games
- Eliminate RNG in final phase
- Force deterministic conclusion

---

# 3. PIECE SYSTEM

---

## 3.1 Attributes

Each piece has:

- Attack Dice (AD)
- Defense Dice (DD)
- Health Points (HP)

---

## 3.2 Stats Table

| Piece  | AD | DD | HP |
| ------ | -- | -- | -- |
| Pawn   | 2  | 1  | 1  |
| Knight | 3  | 2  | 2  |
| Bishop | 3  | 2  | 2  |
| Rook   | 4  | 3  | 3  |
| Queen  | 4  | 3  | 4  |

---

## 3.3 Design Intent

- Higher AD → offensive consistency
- Higher DD → defensive durability
- HP → time to removal
- Strong pieces are reliable, not invincible

---

# 4. COMBAT SYSTEM

---

## 4.1 Trigger

Combat occurs when a piece moves into an enemy-occupied square.

---

## 4.2 Dice Roll

- Attacker rolls AD dice
- Defender rolls DD dice
- Dice are sorted descending

---

## 4.3 Dice Limitation (CRITICAL)

→ Only the TOP 3 dice are used

Purpose:

- Prevent high-dice dominance (Queen problem)
- Normalize combat outcomes

---

## 4.4 Pairing

Dice are compared:

- Highest vs highest
- Second vs second
- Third vs third

---

## 4.5 Resolution Rules

For each pair:

- Attacker > Defender → defender takes 1 damage
- Defender > Attacker → attacker takes 1 damage

---

## 4.6 Tie Rule (Conditional)

- If both pieces have HP ≥ 2 → both take 1 damage
- If either has HP = 1 → no damage

Purpose:

- Avoid trivial trades
- Preserve low-HP tension

---

## 4.7 Momentum Rule

If attacker wins ALL comparisons:

→ defender takes +1 bonus damage

Purpose:

- Reward strong rolls
- Create high-impact moments

---

## 4.8 Minimum Damage Rule

If total damage = 0:

→ both pieces take 1 damage

Purpose:

- Prevent zero-progress combats
- Guarantee resolution

---

## 4.9 Combat Outcomes

After applying damage:

- Defender dies → attacker occupies square
- Attacker dies → defender remains
- Both survive → attacker returns
- Both die → square becomes empty

---

## 4.10 Anti-Stall System

If same pieces fight consecutively:

- Both receive +1 additional damage
- Stacks each repetition

Purpose:

- Prevent repeated low-risk engagements
- Force combat resolution

---

# 5. HEALTH SYSTEM

---

## 5.1 Rules

- Pieces die when HP ≤ 0
- HP does not modify dice values

---

## 5.2 Design Purpose

- HP introduces attrition
- Creates long-term strategic damage
- Allows weaker pieces to win over time

---

# 6. KING SYSTEM — DIVINITY

---

## 6.1 King Nature

- Does not roll dice
- Does not receive damage
- Cannot be killed directly
- Only loses via checkmate

---

## 6.2 Divine Attack

If Divinity > 0:

- Target is instantly removed
- No combat occurs
- Divinity -1

---

## 6.3 Commitment Rule

After attacking:

→ King cannot move next turn

Purpose:

- Prevent hit-and-run abuse
- Create positional risk

---

## 6.4 Divinity System

Initial value: 3

---

### States

| Divinity | State      | Effect                   |
| -------- | ---------- | ------------------------ |
| 3–1     | Divine     | Instant kill             |
| 0        | Thorn King | Cannot attack            |
| -1 to -3 | Corrupted  | +5% cowardice per level  |
| < -3     | Demon King | All allied pieces HP = 1 |

The Demon King threshold is an open balance question. Current preference is below -3, but this must be validated through simulations and playtesting.

---

## 6.5 Divinity Recovery

If King does not attack for 3 of that player's own turns:

→ +1 Divinity (max 3)

Purpose:

- Encourage delayed use
- Prevent fixed optimal timing

---

## 6.6 Overuse Penalty

If King attacks twice within 2 turns:

→ loses 2 Divinity total

Purpose:

- Prevent spam usage
- Introduce tempo decisions

---

# 7. BUFF SYSTEM

---

## 7.1 Rules

- Each player receives 1 buff
- Buffs are permanent
- Buffs do not stack

---

## 7.2 Design Goals

- Define playstyle
- Change decision-making
- Affect targeting priorities

---

## 7.3 Buff Examples

### Giant Slayer

- +2 damage vs stronger pieces

---

### Stone Pieces

- Minimum damage = 2

---

### Iron Age

- Defense Dice = Attack Dice

---

### Last Will

- On death → deal 2 damage

---

# 8. DEBUFF SYSTEM

---

## 8.1 Rules

- Each player receives 1 debuff for opponent
- Probability effects capped at 20%

---

## 8.2 Design Goals

- Introduce uncertainty
- Force adaptation
- Avoid excessive randomness

---

## 8.3 Debuff Examples

### Crystal Pieces

- -1 HP (except pawns)

---

### Cowardice

- 15% chance to fail attack

---

### Immoral

- Attack Dice = Defense Dice

---

### Fatigue

- 5% chance to redirect to a valid allied piece

Fatigue targeting remains an open design decision. Recommended first test: allied non-King pieces within the attacker's legal attack range.

---

# 9. TERRAIN SYSTEM

---

## 9.1 Rules

- One terrain active per match
- Applies globally
- Effects are limited (non-infinite)

---

## 9.2 Design Goals

- Influence positioning
- Modify tempo
- Avoid snowball effects

---

## 9.3 Terrain Types

---

### Equal Conditions

- Dice difference capped at 1

---

### Holy Ground

- First 3 deaths per team → +1 HP

---

### Hell

- First 3 deaths → -1 damage

---

### Will

- +1 HP and +1 damage

---

### Dirty Play

- 10% failure chance
- +1 damage on success

---

# 10. GAME FLOW

---

## 10.1 Turn Structure

Use [[Timing_And_Priority]] as the canonical timing reference.

1. Select piece
2. Move
3. Resolve combat
4. Apply buffs/debuffs and terrain according to their timing step
5. Check check/checkmate

---

## 10.2 Game Phases

### Early Game

- Positioning
- Low-risk engagements

---

### Mid Game

- High combat activity
- King decision pressure

---

### Late Game

- Reduced pieces
- Tactical positioning

---

### Frenzy Phase

- Deterministic resolution
- Pure chess skill

---

# 11. SYSTEM GUARANTEES

---

The system ensures:

- No infinite loops
- No zero-damage states
- No dominant passive strategy
- King cannot be abused safely
- Match always resolves

---

# 12. DESIGN IDENTITY

Age of Chess is:

- Not pure chess
- Not pure RNG
- Not pure RPG

It is:

→ A probabilistic strategy game with controlled chaos
→ Where power is tied to consequence
→ And every system converges toward resolution

---

END OF SYSTEM
