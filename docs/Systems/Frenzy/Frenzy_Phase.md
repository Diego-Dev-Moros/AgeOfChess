# Frenzy Phase

---

# 1. Overview

Frenzy Phase is the final state of an Age of Chess match.

It begins when the match timer reaches:

```txt
1 minute remaining
```

During Frenzy, the game temporarily collapses into a simplified and deterministic form.

The goal of Frenzy is to force the match toward resolution.

Timing reference: [[Timing_And_Priority]]

---

# 2. Purpose

Frenzy exists to:

- Prevent infinite games
- Remove late-game randomness
- Create a dramatic final minute
- Reward pure positional skill
- Force decisive action
- Prevent slow defensive stalling

---

# 3. Frenzy Trigger

Frenzy begins immediately when the match timer reaches:

```txt
1:00 remaining
```

The trigger is automatic and mandatory.

Players cannot prevent Frenzy from starting.

---

# 4. Frenzy Global Changes

When Frenzy begins:

- All non-King pieces HP become 1
- Dice are disabled
- Normal combat is disabled
- Captures become instant
- Buffs affecting combat are disabled
- Debuffs affecting combat are disabled
- Terrain effects affecting combat are disabled
- Divine Attack is disabled by default
- The game plays like classical chess until time expires or checkmate occurs

---

# 5. HP During Frenzy

All non-King pieces are set to:

```txt
1 HP
```

This does not count as damage.

This does not trigger death effects.

This does not trigger Terrain effects.

This does not trigger Last Will.

Purpose:

- Remove HP complexity
- Make captures immediate and readable
- Create decisive endgame tension

---

# 6. Captures During Frenzy

During Frenzy:

```txt
Captures are instant.
```

If a piece legally captures another piece:

- The captured piece is removed immediately.
- No dice are rolled.
- No damage is calculated.
- No HP comparison occurs.

This follows classical chess capture logic.

---

# 7. Dice During Frenzy

Dice are not used during Frenzy.

Disabled systems include:

- Attack Dice
- Defense Dice
- Dice comparison
- Tie rule
- Momentum rule
- Minimum Damage Rule
- Anti-Stall Rule

---

# 8. Combat During Frenzy

Normal combat does not occur.

Any rule that depends on normal combat is disabled unless explicitly stated otherwise.

Examples of disabled combat rules:

- Damage calculation
- Last Will combat trigger
- Stone Pieces minimum damage
- Giant Slayer damage bonus
- Iron Age defense dice
- Immoral attack dice modification
- Cowardice attack failure
- Fatigue redirection

---

# 9. King During Frenzy

During Frenzy, the King behaves like a classical chess King.

Default Frenzy King rules:

- Divine Attack is disabled.
- Divinity remains recorded but inactive.
- The King cannot use dice.
- The King cannot be captured.
- The King loses only by checkmate.

The King still follows:

- Legal movement rules
- Check rules
- Checkmate rules
- Castling rules if still legally possible

---

# 10. Buffs During Frenzy

Default rule:

```txt
Buffs do not affect Frenzy.
```

Reason:

Frenzy is intended to be deterministic and chess-like.

Disabled Buff examples:

- Giant Slayer
- Stone Pieces
- Iron Age
- Last Will

Future Buffs may explicitly state that they affect Frenzy, but this should be rare.

---

# 11. Debuffs During Frenzy

Default rule:

```txt
Debuffs do not affect Frenzy.
```

Reason:

Debuffs often introduce randomness or combat distortion, which Frenzy is meant to remove.

Disabled Debuff examples:

- Crystal Pieces
- Cowardice
- Immoral
- Fatigue

---

# 12. Terrain During Frenzy

Default rule:

```txt
Terrain effects do not affect Frenzy if they modify combat, dice, HP, damage, or probability.
```

Examples:

- Equal Conditions disabled
- Holy Ground disabled
- Hell disabled
- Will disabled
- Dirty Play disabled

Terrain may remain visually or thematically active, but not mechanically active unless explicitly stated.

---

# 13. Death Effects During Frenzy

Death effects do not trigger during Frenzy unless explicitly stated.

Examples:

- Last Will does not trigger.
- Holy Ground does not trigger.
- Hell does not trigger.
- Demon King HP reduction is irrelevant because all pieces are already 1 HP.

---

# 14. Check During Frenzy

Check works exactly as in classical chess.

A King is in check if:

```txt
An enemy piece threatens the King on the next move.
```

The player must respond legally.

---

# 15. Checkmate During Frenzy

Checkmate works exactly as in classical chess.

Checkmate occurs when:

- The King is in check
- The player has no legal move to escape check

Checkmate immediately ends the game.

---

# 16. Draws During Frenzy

Classical draw rules may still apply:

- Stalemate
- Mutual agreement
- Insufficient material
- Threefold repetition
- 50-move rule

However, because Frenzy lasts only 1 minute, most draws during Frenzy are expected to occur through:

- Stalemate
- Insufficient material
- Time expiration

---

# 17. Time Expiration During Frenzy

If time reaches:

```txt
0:00
```

and no checkmate has occurred, resolve the game using time victory rules.

Recommended order:

1. Material advantage
2. King safety
3. Board control
4. Draw if still unresolved

---

# 18. Material During Frenzy

Material is evaluated using classical piece values:

| Piece  | Value |
| ------ | ----- |
| Pawn   | 1     |
| Knight | 3     |
| Bishop | 3     |
| Rook   | 5     |
| Queen  | 9     |

The King is not counted as material.

---

# 19. King Safety During Frenzy

If material is tied, evaluate King safety.

Factors:

- Is a King currently in check?
- How many legal moves does each King have?
- How many enemy pieces threaten nearby squares?
- Is one King trapped or exposed?
- Does one player have an immediate mating threat?

---

# 20. Board Control During Frenzy

If material and King safety are still tied, evaluate board control.

Factors:

- Center control
- Promotion threats
- Piece activity
- Control around the enemy King
- Number of legal attacking moves

---

# 21. Frenzy Transition Example

```txt
Timer reaches 1:00.

Frenzy begins.

White Rook has 3 HP.
Black Bishop has 2 HP.
White Queen has 4 HP.

All become 1 HP.

Dice are disabled.

White Queen captures Black Bishop on a legal move.

Black Bishop is removed instantly.
No dice are rolled.
No combat effects trigger.
```

---

# 22. Strategic Impact

Frenzy changes the game from:

```txt
Probabilistic tactical combat
```

into:

```txt
Deterministic chess resolution
```

This creates a major strategic shift.

Before Frenzy, players may try to:

- Build material advantage
- Improve King safety
- Prepare mating nets
- Preserve active pieces
- Avoid risky combat

During Frenzy, players must rely on:

- Calculation
- Positioning
- Checkmate patterns
- Material conversion
- Time pressure

---

# 23. Design Risks

Potential risks:

## Frenzy starts too early

The main systems may feel underused.

## Frenzy starts too late

Games may stall before it matters.

## Frenzy feels too disconnected

Players may feel their earlier HP/combat decisions stop mattering.

## Frenzy always decides games

This may mean normal combat is not decisive enough.

---

# 24. Tuning Levers

Frenzy can be tuned by adjusting:

- Start time
- Duration
- Whether some effects remain active
- Whether Divine Attack remains active
- Whether HP resets to 1 or only max HP becomes 1
- Time victory criteria

Current default:

```txt
Frenzy begins at 1:00 remaining.
All combat systems are disabled.
The game becomes pure chess.
```

---

# 25. Design Summary

Frenzy is the final convergence system of Age of Chess.

It exists to ensure every match ends cleanly.

It removes randomness, simplifies combat, and forces the final minute to be decided by chess fundamentals:

- Position
- Material
- King safety
- Calculation

---

END
