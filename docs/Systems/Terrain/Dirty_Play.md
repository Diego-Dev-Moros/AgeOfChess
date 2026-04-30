# Dirty Play

---

# 1. Terrain Type

Chaos

---

# 2. Effect

All non-King pieces gain:

```txt
10% attack failure chance
+1 damage on successful attacks
```

This affects both players equally.

---

# 3. Trigger

The failure chance is checked before a piece resolves a normal attack.

The damage bonus applies only if the attack succeeds and deals damage.

If the attack fails:

- No dice are rolled.
- No combat occurs.
- The attacker remains in its original square.
- The player's turn is consumed.

---

# 4. Affected Pieces

All non-King pieces from both players.

---

# 5. Duration

Entire match.

The effect stops applying during Frenzy Phase.

---

# 6. Restrictions

- Does not affect the King.
- Does not apply during Frenzy.
- Failure chance cannot exceed global probability caps.
- Bonus damage applies only if the attack succeeds.
- Does not apply to Divine Attack.
- Does not stack with itself.
- Does not make failed attacks deal damage.
- Failed attacks do not move into the occupied enemy square.

---

# 7. Design Intent

Dirty Play creates a volatile battlefield where attacks are riskier but more rewarding.

It increases tension by making every attack carry a small chance of failure, while rewarding successful aggression with extra damage.

The goal is to encourage bold but calculated attacks.

---

# 8. Strategic Impact

This Terrain encourages:

- Risk-reward decision-making
- Stronger successful attacks
- Hesitation before low-value attacks
- More dramatic combat outcomes
- Careful timing of aggressive moves

---

# 9. Counterplay

Players can adapt by:

- Avoiding unnecessary attacks
- Attacking only when the reward is worth the risk
- Using positioning and check threats
- Preserving pieces for Frenzy
- Using defensive formations to punish failed attacks

---

# 10. Example

```txt
White Rook attacks Black Bishop.

Dirty Play failure check:
Attack succeeds.

Combat resolves normally.

White Rook deals 2 damage from dice.

Dirty Play bonus:
+1 damage

Total damage:
3 damage
```

---

# 11. Failed Attack Example

```txt
Black Knight attacks White Pawn.

Dirty Play failure check:
Attack fails.

Result:
No dice are rolled.
No combat damage is dealt.
Black Knight remains in its original square.
The attack counts as attempted.
Black's turn is consumed.
```

---

# 12. Interaction with Buffs

Dirty Play works well with offensive Buffs, but caps must be respected.

Examples:

- Stone Pieces makes successful attacks more consistent.
- Giant Slayer can create high-risk, high-reward underdog attacks.
- Last Will can punish failed or risky enemy aggression indirectly.

---

# 13. Interaction with Debuffs

Dirty Play can combine with Debuffs that affect reliability.

Example:

- Dirty Play + Cowardice may increase attack failure pressure.

However:

```txt
Total failure probability must respect the global probability cap.
```

---

# 14. Interaction with Frenzy

During Frenzy:

- Dice combat is disabled.
- Dirty Play no longer applies.
- Captures are resolved as classical chess captures.

---

# 15. Balance Notes

Risk:

- Too much failure chance can feel frustrating.
- Too much bonus damage can make combat too swingy.

Controls:

- Failure chance is only 10%.
- Bonus damage is only +1.
- Does not affect the King.
- Disabled during Frenzy.

---

# 13. Related Documentation

- [[Systems/Terrain/Terrain|Terrain System]]
- [[Systems/Combat/Combat_Flow|Combat Flow]]
- [[Systems/Timing/Timing_And_Priority|Timing And Priority]]
- [[Balancing/Balance|Balance]]
- [[Assets_Design/Cards/Terrains/Dirty_Play|Dirty Play Asset]]
- [[Design_Node_Map]]

---

END
