# Crystal Pieces

---

# 1. Card Type

Debuff

---

# 2. Category

Attrition

---

# 3. Effect

Enemy non-pawn pieces have:

```txt
-1 HP
```

Minimum HP is always 1.

Pawns are not affected.

---

# 4. Trigger

Applies at the start of the match.

---

# 5. Target

All enemy non-King, non-pawn pieces.

---

# 6. Duration

Entire match.

---

# 7. Restrictions

- Does not affect pawns.
- Does not affect the King.
- Cannot reduce HP below 1.
- Does not apply during Frenzy because all HP becomes 1.
- Does not stack with other HP reduction effects unless explicitly allowed.

---

# 8. Design Intent

Crystal Pieces makes enemy armies more fragile.

It is designed to speed up combat and make trades more dangerous for the affected player.

---

# 9. Strategic Use

This Debuff encourages:

- Aggressive trades
- Targeting weakened medium and high-value pieces
- Faster mid-game pressure
- Punishing exposed pieces

---

# 10. Counterplay

The affected player can respond by:

- Avoiding unnecessary combat
- Using positioning and protection
- Trading before damage snowballs
- Playing defensively until Frenzy
- Using defensive Buffs if available

---

# 11. Example

```txt
Black Rook normally has 3 HP.

With Crystal Pieces:
Black Rook has 2 HP.
```

---

# 12. Balance Notes

Risk:

- Can make games too fast if combined with damage Buffs.

Controls:

- Pawns are unaffected.
- Minimum HP remains 1.
- Does not affect the King.
- Frenzy naturally overrides HP differences.

---

# 13. Related Documentation

- [[Systems/Cards/Debuffs|Debuffs]]
- [[Systems/Cards/Cards_System|Cards System Reference]]
- [[Game_Design/Pieces_System|Pieces System]]
- [[Systems/Combat/Damage_Calculation|Damage Calculation]]
- [[Balancing/Card_Balance|Card Balance]]
- [[Assets_Design/Cards/Debuffs/Crystal_Pieces|Crystal Pieces Asset]]
- [[Design_Node_Map]]

---

END
