# KING SYSTEM — DIVINITY

Visual design references:

- [[Assets_Design/Pieces/King|King Asset]]
- [[Assets_Design/Pieces_Design|Pieces Design]]
- [[Assets_Design/UI_Design|UI Design]]

---

# 1. OVERVIEW

The King is a special unit:

- Does not use combat system
- Cannot take damage
- Controls tempo via Divinity

---

# 2. DIVINE ATTACK

If Divinity > 0:

- Target dies instantly
- Divinity -1

---

# 3. COMMITMENT

After attacking:

→ King cannot move next turn

Check response has priority over Commitment.

If the King is in check, it may move to escape check as long as the move is legal.

---

# 4. DIVINITY STATES

| Value | Effect |
|------|--------|
| 3–1 | Instant kill |
| 0 | Cannot attack |
| -1 to -3 | Cowardice |
| < -3 | Allied HP = 1 |

Demon King threshold remains an open balance question.

---

# 5. RECOVERY

If no attack for 3 of that player's own turns:

→ +1 Divinity

---

# 6. OVERUSE

If attacking twice in 2 turns:

→ -2 Divinity

---

# 7. DESIGN ROLE

The King is:

- A tempo weapon
- A risk amplifier
- A late-game decision tool

---

END
