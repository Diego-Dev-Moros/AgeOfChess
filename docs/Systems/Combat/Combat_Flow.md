# Combat Flow

---

# 1. Purpose

This document explains the complete combat flow in Age of Chess.

Combat is the system used to resolve attempted captures between non-King pieces.

The goal of combat is to:

- Replace automatic captures with tactical dice resolution
- Allow pieces to survive attacks
- Create attrition over time
- Preserve board positioning as a strategic factor
- Prevent infinite or meaningless fights

---

# 2. When Combat Happens

Combat occurs when:

- A non-King piece moves into a square occupied by an enemy non-King piece.

Combat does not occur when:

- The King attacks using Divine Attack
- The game is in Frenzy Phase
- A move does not enter an occupied enemy square

---

# 3. Combat Participants

Each combat has:

- Attacker: the piece that moved into the occupied square
- Defender: the piece already occupying the square

The attacker uses:

- Attack Dice (AD)

The defender uses:

- Defense Dice (DD)

---

# 4. Combat Sequence

Combat is resolved in the following order:

1. Identify attacker and defender
2. Apply active modifiers before rolling
3. Attacker rolls Attack Dice
4. Defender rolls Defense Dice
5. Sort dice from highest to lowest
6. Select only the top 3 dice
7. Pair dice highest vs highest
8. Resolve each comparison
9. Apply tie rules
10. Apply momentum rule
11. Apply minimum damage rule if needed
12. Apply final damage
13. Check deaths
14. Resolve board position

---

# 5. Pre-Combat Modifier Check

Before rolling dice, check for effects that modify:

- Attack Dice
- Defense Dice
- HP
- Damage
- Failure chance
- Target selection

Examples:

- Buffs
- Debuffs
- Terrain
- King-related penalties

---

# 6. Dice Roll Step

The attacker rolls dice equal to its current Attack Dice.

The defender rolls dice equal to its current Defense Dice.

Example:

```txt
Knight attacks Bishop.

Knight AD = 3
Bishop DD = 2

Knight rolls: 6, 3, 2
Bishop rolls: 5, 4
```

---

# 7. Dice Sorting

All dice are sorted from highest to lowest.

Example:

```txt
Attacker: 2, 6, 3 → 6, 3, 2
Defender: 4, 5 → 5, 4
```

---

# 8. Top 3 Dice Limit

Only the top 3 dice from each side can be used in combat.

This prevents high-dice pieces from dominating purely through dice volume.

Example:

```txt
Queen rolls: 6, 5, 4, 2

Used dice:
6, 5, 4

Ignored dice:
2
```

---

# 9. Pairing Dice

Dice are paired in descending order:

```txt
Pair 1: highest attacker die vs highest defender die
Pair 2: second attacker die vs second defender die
Pair 3: third attacker die vs third defender die
```

Only existing pairs are compared.

If one side has fewer dice, unpaired dice are ignored unless another effect explicitly uses them.

---

# 10. Comparison Results

For each pair:

- Attacker die > Defender die → Defender takes 1 damage
- Defender die > Attacker die → Attacker takes 1 damage
- Tie → resolved using the Tie Rule

---

# 11. Tie Rule

If both involved pieces currently have HP ≥ 2:

- Both pieces take 1 damage

If either piece has HP = 1:

- No damage is caused by the tie

Purpose:

- Ties still matter in major combats
- Low-HP pieces are not automatically deleted by every tie
- Close fights remain tense

---

# 12. Momentum Rule

If the attacker wins all dice comparisons:

- Defender takes +1 additional damage

Example:

```txt
Attacker: 6, 5, 4
Defender: 3, 2, 1

Attacker wins all comparisons.
Defender takes 3 damage + 1 momentum damage.
Total damage = 4.
```

Purpose:

- Reward strong offensive rolls
- Make decisive attacks feel impactful
- Encourage active play

---

# 13. Minimum Damage Rule

If, after all comparisons and tie rules, total combat damage is 0:

- Both pieces take 1 damage

Purpose:

- Prevent zero-progress combats
- Avoid infinite repetition
- Ensure every combat matters

---

# 14. Applying Damage

Damage is applied after all comparisons are resolved.

Damage is considered simultaneous.

This means:

- Both pieces can die in the same combat
- Last Will-type effects can trigger correctly
- Board outcome is determined after total damage is calculated

---

# 15. Combat Outcome

After damage is applied:

## Defender Dies, Attacker Survives

- Defender is removed
- Attacker occupies the defender’s square

## Attacker Dies, Defender Survives

- Attacker is removed
- Defender remains in its square

## Both Survive

- Defender remains in its square
- Attacker returns to its original square

## Both Die

- Both pieces are removed
- The target square becomes empty

---

# 16. Anti-Stall Rule

If the same two pieces fight in consecutive turns:

- Both pieces receive +1 additional damage
- This extra damage stacks with each repeated engagement

Example:

```txt
First combat:
No anti-stall damage.

Second consecutive combat:
Both receive +1 extra damage.

Third consecutive combat:
Both receive +2 extra damage.
```

Purpose:

- Prevent repeated low-risk attacks
- Force combat resolution
- Discourage abuse of retreat-and-repeat tactics

---

# 17. Combat During Frenzy

During Frenzy Phase:

- Combat system is disabled
- Dice are not rolled
- Captures are instant, as in classical chess

---

# 18. Combat Involving the King

The King does not participate in normal combat.

If the King attacks:

- Divine Attack rules apply

If a piece threatens the King:

- This creates check
- Normal combat damage does not apply to the King

---

# 19. Example Combat

```txt
White Knight attacks Black Bishop.

Knight AD = 3
Bishop DD = 2

White rolls: 6, 4, 2
Black rolls: 5, 4

Sorted:
White: 6, 4, 2
Black: 5, 4

Pairs:
6 vs 5 → Bishop takes 1 damage
4 vs 4 → Tie

Tie Rule:
Both have HP ≥ 2
Both take 1 damage

Total:
Bishop takes 2 damage
Knight takes 1 damage

Result:
Bishop HP 2 → 0, dies
Knight HP 2 → 1, survives
Knight occupies Bishop’s square
```

---

# 20. Design Notes

Combat should feel:

- Risky
- Fast
- Understandable
- Tactical
- Never meaningless

Every combat should produce a consequence.

---

END