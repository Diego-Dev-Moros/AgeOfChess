# Cowardice

---

# 1. Card Type

Debuff

---

# 2. Category

Reliability

---

# 3. Effect

Enemy pieces have a chance to fail when attacking.

```txt
15% attack failure chance
```

If the attack fails:

- No dice are rolled.
- No combat damage occurs.
- The attacker remains in its original square.
- The action counts as an attempted attack.
- The player's turn is consumed.

---

# 4. Trigger

Before an affected enemy piece rolls dice for an attack.

---

# 5. Target

All enemy non-King pieces.

---

# 6. Duration

Entire match.

---

# 7. Restrictions

- Does not affect the King by default.
- Does not apply during Frenzy.
- Failure chance cannot exceed 20%.
- If the failed attack involved entering an occupied square, the movement does not complete.
- Does not stack with other failure chances beyond the probability cap.

---

# 8. Design Intent

Cowardice makes enemy aggression less reliable.

It is designed to create tension around attacks without making combat impossible.

---

# 9. Strategic Use

This Debuff encourages:

- Defensive play
- Punishing risky attacks
- Making the opponent hesitate
- Creating uncertainty in combat-heavy positions

---

# 10. Counterplay

The affected player can respond by:

- Reducing unnecessary attacks
- Using stronger positional play
- Waiting for Frenzy
- Attacking only when the reward is worth the risk
- Using the King if Divine Attack is not affected

---

# 11. Example

```txt
White Rook attacks Black Bishop.

White is affected by Cowardice.

Before rolling:
Cowardice check triggers.

If failed:
No dice are rolled.
The attack deals no damage.
```

---

# 12. Balance Notes

Risk:

- Too much failure chance can feel frustrating.

Controls:

- Base value is 15%.
- Maximum allowed probability is 20%.
- Does not apply during Frenzy.
- Does not affect the King by default.

---

# 13. Related Documentation

- [[Systems/Cards/Debuffs|Debuffs]]
- [[Systems/Cards/Cards_System|Cards System Reference]]
- [[Systems/Combat/Combat_Flow|Combat Flow]]
- [[Systems/Timing/Timing_And_Priority|Timing And Priority]]
- [[Edge_Cases]]
- [[Assets_Design/Cards/Debuffs/Cowardice|Cowardice Asset]]
- [[Design_Node_Map]]

---

END
