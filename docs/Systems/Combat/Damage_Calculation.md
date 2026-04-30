# Damage Calculation

---

# 1. Purpose

This document explains how damage is calculated, modified, capped, and applied in Age of Chess.

Damage calculation is used only during normal combat between non-King pieces.

---

# 2. Damage Sources

Damage can come from:

- Dice comparison
- Tie rule
- Momentum rule
- Minimum damage rule
- Anti-stall rule
- Buffs
- Debuffs
- Terrain effects
- Death-triggered effects

---

# 3. Base Damage

Each winning dice comparison deals:

```txt
1 damage
```

Example:

```txt
Attacker die: 6
Defender die: 4

Attacker wins.
Defender takes 1 damage.
```

---

# 4. Tie Damage

If both pieces have HP ≥ 2:

```txt
Tie → both take 1 damage
```

If either piece has HP = 1:

```txt
Tie → no damage
```

---

# 5. Momentum Damage

If the attacker wins every comparison:

```txt
Defender takes +1 bonus damage
```

Example:

```txt
Attacker: 6, 5, 4
Defender: 3, 2, 1

Attacker wins all comparisons.

Base damage = 3
Momentum damage = +1

Total defender damage = 4
```

---

# 6. Minimum Damage

If total combat damage is 0 after comparisons:

```txt
Both pieces take 1 damage
```

This rule guarantees that every combat creates progress.

---

# 7. Anti-Stall Damage

If the same two pieces fight in consecutive turns:

```txt
Both pieces receive extra damage.
```

Scaling:

```txt
Second consecutive fight: +1 damage each
Third consecutive fight: +2 damage each
Fourth consecutive fight: +3 damage each
```

Anti-stall damage is added after base combat damage.

---

# 8. Damage Timing

Damage is calculated first, then applied simultaneously.

This means:

- A piece can deal damage and die in the same combat
- Both pieces can die together
- Death effects are checked after all damage is applied

---

# 9. Damage Order of Operations

When calculating damage, use this order:

1. Determine dice comparison damage
2. Apply tie damage
3. Apply momentum damage
4. Apply minimum damage if total damage is 0
5. Apply damage-floor effects such as Stone Pieces
6. Apply buff damage bonuses
7. Apply debuff damage modifiers
8. Apply terrain damage modifiers
9. Apply anti-stall damage
10. Apply damage to HP simultaneously
11. Check deaths
12. Trigger death effects

The canonical timing reference is [[Timing_And_Priority]].

---

# 10. Buff Damage Modifiers

Buffs can increase or alter damage.

Examples:

## Giant Slayer

If a lower-value piece attacks a higher-value piece:

```txt
+2 damage
```

## Stone Pieces

If an allied piece deals damage as part of combat resolution, its minimum total damage becomes:

```txt
2
```

This can include damage created by the Minimum Damage Rule.

Stone Pieces does not apply if the attack fails before combat.

## Last Will

When a piece dies:

```txt
Deals 2 damage to the enemy piece
```

---

# 11. Debuff Damage Modifiers

Debuffs can reduce reliability or redirect damage.

Examples:

## Cowardice

Attack may fail before damage is calculated.

## Fatigue

Attack may damage an allied piece instead of the intended target.

## Crystal Pieces

Reduces HP, making pieces easier to kill.

---

# 12. Terrain Damage Modifiers

Terrain can affect damage globally.

Examples:

## Hell

First 3 deaths reduce damage output.

## Will

All pieces gain:

```txt
+1 HP
+1 damage
```

## Dirty Play

Adds risk and reward:

```txt
10% failure chance
+1 damage on success
```

---

# 13. Damage Caps

Damage bonuses should respect balance rules:

- Buff bonus damage cannot exceed +2
- Probability effects cannot exceed 20%
- Terrain effects cannot scale infinitely
- No effect can create unlimited damage growth

---

# 14. HP Reduction

After damage is applied:

```txt
Current HP = Current HP - Damage Taken
```

If:

```txt
Current HP ≤ 0
```

The piece dies.

---

# 15. Death Resolution

After HP is reduced:

- Dead pieces are removed
- Board position is resolved
- Death effects trigger

---

# 16. Simultaneous Death

If both pieces reach HP ≤ 0:

- Both are removed
- The target square becomes empty

---

# 17. Last Will Timing

If Last Will triggers:

1. Combat damage is applied
2. Piece dies
3. Last Will triggers
4. Enemy receives 2 damage
5. Enemy death is checked

If Last Will kills the attacker after the defender dies, the attacker is removed and the target square becomes empty.

See [[Edge_Cases]].

This can cause delayed mutual death.

---

# 18. Frenzy Phase

During Frenzy:

- Damage calculation is disabled
- HP is set to 1
- Captures are instant
- HP being set to 1 is not damage and does not trigger death effects

---

# 19. Example 1 — Basic Damage

```txt
White Bishop attacks Black Knight.

Bishop rolls: 6, 4, 2
Knight rolls: 5, 3

Pairs:
6 > 5 → Knight -1
4 > 3 → Knight -1

Bishop wins all comparisons.

Momentum:
Knight -1 additional damage

Total:
Knight takes 3 damage

Result:
Knight dies
```

---

# 20. Example 2 — Tie Damage

```txt
Rook attacks Bishop.

Rook rolls: 5, 4, 2
Bishop rolls: 5, 3

Pairs:
5 = 5 → tie
4 > 3 → Bishop -1

Tie Rule:
Both pieces have HP ≥ 2
Both take 1 damage

Total:
Rook takes 1 damage
Bishop takes 2 damage
```

---

# 21. Example 3 — Minimum Damage

```txt
Pawn attacks Pawn.

Pawn rolls: 3, 1
Defender rolls: 3

Pair:
3 = 3

Tie Rule:
Both have HP = 1
No damage

Total damage = 0

Minimum Damage Rule:
Both take 1 damage

Result:
Both pawns die
```

---

# 22. Design Notes

Damage should be:

- Predictable enough to understand
- Random enough to create tension
- Fast enough to prevent stalls
- Bounded enough to avoid broken combos

---

END
