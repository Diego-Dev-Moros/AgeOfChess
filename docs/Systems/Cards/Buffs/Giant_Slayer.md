# Giant Slayer

---

# 1. Card Type

Buff

---

# 2. Category

Aggressive / Tactical

---

# 3. Effect

When an allied piece with lower value attacks an enemy piece with higher value:

```txt
Deal +2 additional damage.
```

---

# 4. Trigger

Triggers during damage calculation when:

- The attacking piece belongs to the player with Giant Slayer.
- The attacker has lower value than the defender.
- The attack is resolved through normal combat.

---

# 5. Target

The enemy defending piece.

---

# 6. Duration

Entire match.

---

# 7. Restrictions

- Does not affect the King.
- Does not apply to Divine Attack.
- Does not apply during Frenzy.
- Bonus damage cannot exceed +2.
- Does not apply if the attacker and defender have equal value.
- Does not apply when attacking a lower-value piece.

---

# 8. Design Intent

Giant Slayer exists to make weaker pieces dangerous against stronger pieces.

It gives pawns, knights, bishops, and rooks more tactical relevance when attacking higher-value targets.

The goal is to prevent high-value pieces from feeling completely safe.

---

# 9. Strategic Use

This Buff encourages:

- Aggressive pawn attacks
- Sacrificial trades
- Targeting high-value enemy pieces
- Using minor pieces to threaten the Queen or Rooks

---

# 10. Counterplay

The opponent can respond by:

- Avoiding isolated high-value pieces
- Protecting Queen and Rooks with supporting units
- Using terrain and positioning to reduce attack opportunities
- Forcing weaker pieces into bad trades before they attack

---

# 11. Example

```txt
White Pawn attacks Black Rook.

Pawn value = 1
Rook value = 5

Pawn is lower value.

Combat damage = 1
Giant Slayer bonus = +2

Total damage to Rook = 3
```

---

# 12. Balance Notes

Risk:

- May make pawns too threatening if combined with damage terrain.

Controls:

- Bonus capped at +2.
- Requires the weaker piece to attack.
- Does not apply defensively.
- Does not affect the King.

---

# 13. Related Documentation

- [[Systems/Cards/Buffs|Buffs]]
- [[Systems/Cards/Cards_System|Cards System Reference]]
- [[Systems/Combat/Damage_Calculation|Damage Calculation]]
- [[Balancing/Card_Balance|Card Balance]]
- [[Assets_Design/Cards/Buffs/Giant_Slayer|Giant Slayer Asset]]
- [[Design_Node_Map]]

---

END
