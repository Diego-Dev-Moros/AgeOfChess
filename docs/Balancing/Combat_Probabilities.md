# Combat Probabilities

---

# 1. Purpose

This document explains how combat probability should be understood, tested, and balanced in Age of Chess.

It is not meant to be a complete mathematical proof.
It is a design reference for evaluating whether combat feels fair, readable, and strategically useful.

---

# 2. Why Combat Probability Matters

Age of Chess uses dice to create controlled uncertainty.

Combat probability matters because it affects:

- Whether attacking feels viable
- Whether defending feels too safe
- Whether weak pieces can realistically threaten stronger pieces
- Whether strong pieces feel powerful without becoming invincible
- Whether randomness feels exciting or frustrating

---

# 3. Core Combat Probability Factors

Combat outcomes are influenced by:

- Attack Dice (AD)
- Defense Dice (DD)
- Top 3 Dice Rule
- Tie Rule
- Momentum Rule
- Minimum Damage Rule
- HP values
- Buffs
- Debuffs
- Terrain
- Anti-Stall damage

---

# 4. Base Dice Assumption

All dice are standard six-sided dice.

Each die has equal probability of rolling:

```txt
1, 2, 3, 4, 5, or 6
```

Each result has probability:

```txt
1 / 6
```

---

# 5. Top 3 Dice Rule Impact

Only the top 3 dice are used in combat.

This means high-dice pieces still benefit from rolling more dice, but their advantage is limited.

Example:

```txt
Queen AD = 4

The Queen rolls 4 dice, but only the best 3 are used.
```

Design purpose:

- Reduce Queen dominance
- Prevent large dice pools from overwhelming smaller pieces
- Keep combat readable
- Limit extreme damage spikes

---

# 6. Attack vs Defense Bias

Most pieces have more Attack Dice than Defense Dice.

This is intentional.

It creates a mild attacking bias, which helps avoid defensive stalemates.

However, defensive pieces still have value because:

- They may roll higher
- They can survive through HP
- They can benefit from terrain or buffs
- The attacker may die or be forced back

---

# 7. Tie Rule Probability Impact

Ties are resolved differently depending on HP.

Tie rule:

- If both pieces have HP ≥ 2 → both take 1 damage
- If either piece has HP = 1 → no tie damage

This rule creates two different combat experiences:

## High-HP Combat

Ties accelerate resolution.

## Low-HP Combat

Ties create tension because they do not automatically kill pieces.

---

# 8. Momentum Probability Impact

Momentum triggers when:

```txt
The attacker wins all comparisons.
```

This creates burst damage.

Momentum is more likely when:

- The attacker has stronger dice volume
- The defender has fewer dice
- Terrain does not reduce dice difference
- Debuffs reduce defender effectiveness

Momentum is less likely when:

- Defender has Iron Age
- Equal Conditions is active
- Attacker is affected by Immoral
- Defender has equal or near-equal dice count

---

# 9. Minimum Damage Rule Impact

The Minimum Damage Rule ensures combat always progresses.

If total combat damage is 0:

```txt
Both pieces take 1 damage.
```

This rule prevents:

- Infinite combat loops
- Zero-value attacks
- Excessive defensive stalling

However, it should not be treated as offensive damage for all card interactions.

For example:

- Stone Pieces may upgrade Minimum Damage Rule damage for the player who owns Stone Pieces, because that Buff raises that player's combat damage floor.
- This interaction should be tested because it may make Stone Pieces too consistent.

---

# 10. Anti-Stall Probability Impact

The Anti-Stall Rule reduces the value of repeatedly attacking the same piece without resolution.

If the same two pieces fight consecutively:

```txt
Both receive +1 additional damage.
```

This creates guaranteed escalation.

Design purpose:

- Avoid repeated low-risk attacks
- Force combat to resolve
- Prevent farming or looping behavior

---

# 11. Piece Matchup Expectations

---

## Pawn vs Pawn

Expected behavior:

- Very volatile
- Often lethal
- Low strategic cost
- Useful for testing minimum damage and tie rules

Design note:

Pawn combat should resolve quickly.

---

## Pawn vs Minor Piece

Expected behavior:

- Pawn is disadvantaged
- Pawn can still cause damage
- Buffs like Giant Slayer can make this threatening

Design note:

A pawn should not consistently beat a Knight or Bishop, but it should create risk.

---

## Minor Piece vs Minor Piece

Expected behavior:

- Fair tactical combat
- Multiple outcomes possible
- Good baseline for testing system balance

Design note:

Knight vs Bishop combat should feel like a true contest.

---

## Minor Piece vs Rook

Expected behavior:

- Rook has durability advantage
- Minor piece may win through strong rolls or buffs
- Rook should not feel invincible

Design note:

This matchup tests whether mid-tier pieces remain relevant.

---

## Rook vs Queen

Expected behavior:

- Queen has flexibility and consistency
- Rook has durability and defensive value
- Queen should be favored but not guaranteed

Design note:

This matchup is important for checking Queen dominance.

---

## Queen vs Minor Piece

Expected behavior:

- Queen is strongly favored
- Minor piece should still be able to damage Queen
- Giant Slayer and terrain may shift risk

Design note:

If Queen wins these fights too cleanly every time, Queen may need further tuning.

---

# 12. Combat Probability Testing Method

When testing combat probability manually, run repeated trials.

Recommended minimum:

```txt
20 trials per matchup
```

Better sample:

```txt
50 trials per matchup
```

For each trial, record:

- Attacker
- Defender
- Dice results
- Damage dealt
- Surviving HP
- Winner
- Whether Momentum triggered
- Whether Minimum Damage triggered
- Whether both pieces died

---

# 13. Matchups to Test First

Priority matchups:

```txt
Pawn vs Pawn
Pawn vs Knight
Knight vs Bishop
Knight vs Rook
Rook vs Queen
Queen vs Knight
Queen vs Rook
```

These matchups cover:

- Low-tier volatility
- Mid-tier balance
- High-tier dominance
- Queen tuning
- HP durability
- Dice asymmetry

---

# 14. Suggested Tracking Table

| Trial | Attacker | Defender | Rolls          | Damage to Attacker | Damage to Defender | Result          | Notes       |
| ----- | -------- | -------- | -------------- | ------------------ | ------------------ | --------------- | ----------- |
| 1     | Knight   | Bishop   | 6,4,2 vs 5,4   | 1                  | 2                  | Bishop dies     | Tie damage  |
| 2     | Pawn     | Knight   | 6,2 vs 5,3     | 0                  | 1                  | Knight survives | Low damage  |
| 3     | Rook     | Queen    | 6,5,3 vs 6,4,2 | 1                  | 2                  | Both survive    | No momentum |

---

# 15. Warning Signals

Combat probability may need adjustment if:

- Attacking is almost always worse than defending
- Queen wins nearly all trades without meaningful damage
- Pawns never matter
- Rooks never die before Frenzy
- Momentum triggers too often
- Minimum Damage triggers too often
- Ties feel too punishing
- Combat takes too long to resolve
- Most games are decided by early lucky rolls

---

# 16. Tuning Levers

Possible ways to tune combat:

## Dice Values

Adjust AD or DD.

Example:

```txt
Queen AD 4 → 3
Rook DD 3 → 2
```

## HP Values

Adjust durability.

Example:

```txt
Queen HP 4 → 3
Rook HP 3 → 4
```

## Momentum

Adjust bonus damage.

Example:

```txt
Momentum +1 → Momentum only if at least 2 comparisons occur
```

## Tie Rule

Adjust tie behavior.

Example:

```txt
Tie damage only if both pieces have HP ≥ 3
```

## Terrain

Use terrain to balance match volatility.

## Buffs and Debuffs

Use cards to shift specific matchups.

---

# 17. Probability and Player Experience

Mathematical balance is not enough.

A matchup may be mathematically fair but still feel bad if:

- The player cannot understand why they lost
- The outcome feels too random
- A powerful piece dies too easily
- A weak piece feels useless
- A combat takes too long

The goal is not perfect symmetry.

The goal is:

```txt
Readable risk.
```

---

# 18. Design Target

Combat should usually feel like:

- Stronger pieces are favored
- Weaker pieces are not helpless
- Attacking creates opportunity and risk
- Defending is useful but not passive
- Randomness creates tension, not chaos

---

# 19. Future Work

This file should eventually include:

- Estimated win rates by matchup
- Simulation results
- Playtest statistics
- Probability tables
- Dice outcome charts
- Recommended balance patches

---

# 12. Related Documentation

- [[Balancing_Index]]
- [[Balancing/Balance|Balance]]
- [[Systems/Combat/Dice_System|Dice System]]
- [[Systems/Combat/Damage_Calculation|Damage Calculation]]
- [[Systems/Combat/Combat_Flow|Combat Flow]]
- [[Game_Design/Pieces_System|Pieces System]]
- [[Design_Node_Map]]

---

END
