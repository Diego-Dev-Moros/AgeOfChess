# TURN SYSTEM

---

# 1. Overview

The Turn System defines how a player's action is declared, validated, resolved, and cleaned up.

For detailed timing, use [[Systems/Timing/Timing_And_Priority|Timing_And_Priority]] as the source of truth.

---

# 2. Turn Structure

Each turn follows this high-level structure:

1. Start of turn checks
2. Action declaration
3. Legal move validation
4. Pre-action failure checks
5. Movement, combat, or Divine Attack resolution
6. Damage, death effects, and board position resolution
7. Check and checkmate validation
8. End of turn cleanup
9. Timer and Frenzy checks

---

# 3. Player Actions

A player may normally take one action:

- Move one piece.
- Attack by moving a non-King piece into an enemy non-King piece.
- Use the King's Divine Attack if legal and available.

During [[Systems/Frenzy/Frenzy_Phase|Frenzy_Phase]], normal combat and Divine Attack are disabled by default.

---

# 4. Valid Moves

A valid move must:

- Follow classical chess movement.
- Respect piece-specific movement rules.
- Not leave the acting player's King in check.
- Follow Frenzy rules if Frenzy is active.
- Respect King Commitment unless the King is responding to check.

---

# 5. Failed Attacks

If an attack fails before combat because of Cowardice, Dirty Play, Fatigue, or a similar effect:

- The attacker remains in its original square.
- No dice are rolled.
- No combat occurs.
- No damage is dealt.
- The player's turn is consumed.

See [[Edge_Cases]].

---

# 6. King Commitment And Check

After the King uses Divine Attack, the King is committed and cannot voluntarily move on its next turn.

However:

```txt
Check response has priority over Commitment.
```

If a committed King is in check, the player may use any legal check response, including moving the King.

---

# 7. Divinity Recovery

Divinity recovery is tracked by that player's own turns.

If the King does not use Divine Attack for 3 of that player's own turns:

```txt
Divinity +1
```

Maximum Divinity remains 3.

---

# 8. Check Validation

After each resolved action:

- Check state is evaluated.
- Checkmate is evaluated.
- Stalemate and other draw states may be evaluated.

Checkmate remains the primary victory condition.

---

END
