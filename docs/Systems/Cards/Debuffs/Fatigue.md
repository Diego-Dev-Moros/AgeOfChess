# Fatigue

---

# 1. Card Type

Debuff

---

# 2. Category

Chaos / Reliability

---

# 3. Effect

Enemy attacks have a chance to damage an allied piece instead of the intended enemy target.

```txt
5% friendly fire chance
```

If triggered:

- The attack is redirected to a random valid allied piece.
- If no valid allied piece exists, the attack fails.

This targeting rule is not final.

Recommended first test:

```txt
Valid allied piece = allied non-King piece inside the 3x3 area centered on the attacker.
```

This means Fatigue affects allied pieces adjacent to the attacker, including diagonals.

The attacker itself is not a valid redirected target.

---

# 4. Trigger

Before an affected enemy piece resolves an attack.

---

# 5. Target

All enemy non-King pieces.

The redirected target must be an allied piece of the attacker.

Current recommended test target:

- Allied non-King piece
- Adjacent to the attacker inside the 3x3 area centered on the attacker
- Not the attacking piece
- Not the King

Rejected for now:

- Any allied piece anywhere on the board
- Any allied piece in the attacker's full legal attack range

Reason:

- Board-wide targeting is too chaotic.
- Full attack-range targeting is less intuitive for long-range pieces.
- A 3x3 area is easier to see and makes crowded formations the core risk.

---

# 6. Duration

Entire match.

---

# 7. Restrictions

- Does not affect the King by default.
- Does not apply during Frenzy.
- Friendly fire chance cannot exceed 20%.
- Cannot target the King unless a special rule allows it.
- If no valid allied target exists, the attack simply fails.
- Does not stack with other redirect effects unless explicitly stated.
- If the attack fails because no valid target exists, the attacker remains in its original square and the turn is consumed.

---

# 8. Design Intent

Fatigue makes crowded formations risky.

It introduces chaos without being too frequent.

The goal is to make players think about spacing and attack timing.

---

# 9. Strategic Use

This Debuff encourages:

- Spreading pieces apart
- Avoiding crowded attacks
- Careful positioning
- Risk assessment before combat

---

# 10. Counterplay

The affected player can respond by:

- Keeping formations less crowded
- Avoiding attacks near allied pieces
- Using the King if Divine Attack is unaffected
- Waiting for clear attack lanes
- Playing conservatively until Frenzy

---

# 11. Example

```txt
White Bishop attacks Black Knight.

White is affected by Fatigue.

Before resolving combat:
Fatigue check triggers.

If Fatigue activates:
White Bishop's attack is redirected to a random valid White allied non-King piece adjacent to the Bishop in the 3x3 area centered on the Bishop.

If no allied piece is valid:
The attack fails.
The Bishop remains in its original square.
```

---

# 12. Balance Notes

Risk:

- Can feel unfair if it triggers too often.

Controls:

- Base chance is only 5%.
- Maximum probability cap is 20%.
- Does not affect the King by default.
- Does not apply during Frenzy.

---

# 13. Related Documentation

- [[Systems/Cards/Debuffs|Debuffs]]
- [[Systems/Cards/Cards_System|Cards System Reference]]
- [[Systems/Combat/Combat_Flow|Combat Flow]]
- [[Systems/Timing/Timing_And_Priority|Timing And Priority]]
- [[Edge_Cases]]
- [[Balancing/Card_Balance|Card Balance]]
- [[Assets_Design/Cards/Debuffs/Fatigue|Fatigue Asset]]
- [[Design_Node_Map]]

---

END
