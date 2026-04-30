# ♟️ AGE OF CHESS — OFFICIAL RULES

---

# 1. OVERVIEW

Age of Chess is a strategic board game based on classical chess, enhanced with:

- Dice-based combat
- Health system (HP)
- Buffs and debuffs
- Global terrain effects
- A unique King Divinity mechanic
- A time-based Frenzy endgame

The game combines deterministic strategy with controlled randomness.

---

# 2. GAME OBJECTIVE

The objective is:

→ Checkmate the opponent’s King

Important:

- The King cannot be killed through damage
- Victory is achieved ONLY through checkmate

---

# 3. BOARD AND SETUP

- Standard 8×8 chess board
- Standard chess starting positions
- White moves first

---

# 4. MATCH TIME SYSTEM

- Total match duration: 10 minutes

---

## 4.1 Frenzy Phase

When remaining time ≤ 1 minute:

- All pieces HP become 1
- Combat system is disabled
- Dice are no longer used

Game transitions into:

→ PURE CHESS MODE

All captures become instant.

---

# 5. PIECES AND MOVEMENT

All pieces move exactly as in classical chess:

---

## 5.1 Pawn

- Moves forward 1 square
- First move can be 2 squares
- Captures diagonally
- En passant allowed
- Promotion allowed

---

## 5.2 Knight

- Moves in L-shape
- Can jump over pieces

---

## 5.3 Bishop

- Moves diagonally any distance

---

## 5.4 Rook

- Moves horizontally or vertically any distance

---

## 5.5 Queen

- Moves in any direction

---

## 5.6 King

- Moves 1 square in any direction
- Cannot move into check
- Castling allowed (see below)

---

## 5.7 Castling

Allowed if:

- King and rook have not moved
- No pieces between them
- King is not in check
- King does not pass through check

---

# 6. PIECE STATS

Each piece has:

- Attack Dice (AD)
- Defense Dice (DD)
- Health Points (HP)

---

## 6.1 Stats Table

| Piece  | AD | DD | HP |
| ------ | -- | -- | -- |
| Pawn   | 2  | 1  | 1  |
| Knight | 3  | 2  | 2  |
| Bishop | 3  | 2  | 2  |
| Rook   | 4  | 3  | 3  |
| Queen  | 4  | 3  | 4  |

---

# 7. COMBAT SYSTEM

---

## 7.1 When Combat Happens

When a non-King piece moves into a square occupied by an enemy non-King piece.

The King does not use normal combat.

---

## 7.2 Combat Procedure

1. Attacker rolls AD dice
2. Defender rolls DD dice
3. Dice are sorted descending
4. Only the TOP 3 dice are used
5. Dice are paired highest vs highest

---

## 7.3 Combat Resolution

For each pair:

- Attacker > Defender → defender takes 1 damage
- Defender > Attacker → attacker takes 1 damage
- Tie:
  - If both pieces have HP ≥ 2 → both take 1 damage
  - Otherwise → no damage

---

## 7.4 Momentum Rule

If attacker wins ALL comparisons:

→ defender takes +1 additional damage

---

## 7.5 Minimum Damage Rule

If total damage = 0:

→ both pieces take 1 damage

---

## 7.6 Combat Outcome

- Defender dies → attacker occupies square
- Attacker dies → defender remains
- Both survive → attacker returns to original square
- Both die → square becomes empty
- Failed attack before combat → attacker remains in original square and the turn is consumed

---

## 7.7 Anti-Stall Rule

If the same two pieces fight in consecutive turns:

→ both receive +1 extra damage (stacking)

---

# 8. HEALTH SYSTEM

- A piece dies when HP ≤ 0
- HP does NOT modify dice values

---

# 9. KING — DIVINITY SYSTEM

---

## 9.1 King Nature

- Does not use dice
- Does not take damage
- Cannot be killed directly
- Can only be defeated by checkmate

---

## 9.2 Divine Attack

If Divinity > 0:

- King instantly kills target piece
- No combat occurs
- Divinity decreases by 1

---

## 9.3 Commitment Rule

After attacking:

→ King cannot move on next turn

If the King is in check, check response overrides this restriction.

---

## 9.4 Divinity States

| Divinity | Effect                             |
| -------- | ---------------------------------- |
| 3–1     | Instant kill                       |
| 0        | Cannot attack                      |
| -1 to -3 | +5% cowardice to all allied pieces |
| < -3     | All allied pieces HP = 1           |

Demon King threshold is still a balance question.

---

## 9.5 Divinity Recovery

If King does not attack for 3 of that player's own turns:

→ gains +1 Divinity (max 3)

---

## 9.6 Overuse Penalty

If King attacks twice within 2 turns:

→ loses 2 Divinity total

---

# 10. BUFFS

---

## 10.1 Rules

- Each player receives 1 random buff at start
- Buffs are secretly active from match start
- Buffs reveal when their effect changes a public outcome
- Buffs do not stack

---

## 10.2 Buff Effects

- Giant Slayer → +2 damage vs stronger pieces
- Stone Pieces → allied combat damage floor becomes 2 when combat damage occurs
- Iron Age → Defense Dice = Attack Dice
- Last Will → deal 2 damage upon death

---

# 11. DEBUFFS

---

## 11.1 Rules

- Each player receives 1 debuff affecting opponent
- Debuffs are secretly active from match start
- Debuffs reveal when their effect changes a public outcome or requires a public check
- Probability effects capped at 20%

---

## 11.2 Debuff Effects

- Crystal Pieces → -1 HP (except pawns)
- Cowardice → 15% chance attack fails
- Immoral → Attack Dice = Defense Dice
- Fatigue → 5% chance to redirect to a valid allied piece; targeting rule is still under design

---

# 12. TERRAIN SYSTEM

---

## 12.1 Rules

- One terrain effect per match
- Applies to both players
- Effects are global

---

## 12.2 Terrain Types

### Equal Conditions

- Dice difference capped at 1

---

### Holy Ground

- First 3 piece deaths → +1 HP to team

---

### Hell

- First 3 deaths → -1 damage

---

### Will

- All pieces gain +1 HP and +1 damage

---

### Dirty Play

- All pieces gain:
  - 10% failure chance
  - +1 damage on success

---

# 13. TURN STRUCTURE

Each turn:

1. Select piece
2. Move piece
3. Resolve combat (if applicable)
4. Apply buffs/debuffs and terrain according to timing rules
5. Check check / checkmate

---

# 14. CHECK AND CHECKMATE

---

## 14.1 Check

A King is in check if:

→ an enemy piece can capture it on the next move

---

## 14.2 Valid Responses to Check

- Move King
- Block attack
- Capture attacking piece

Divine Attack as a check response is currently a proposed system rule, not yet official.

---

## 14.3 Checkmate

Occurs when:

- King is in check
- No legal moves exist to escape

---

# 15. DRAW CONDITIONS

- Mutual agreement
- Stalemate
- 50-move rule
- Threefold repetition
- Insufficient material

---

# 16. SPECIAL NOTES

- Pieces do not change movement when damaged
- Self-damage only via debuffs
- Frenzy removes all randomness
- Game always resolves

---

END OF RULES
