# Dice System

---

# 1. Purpose

The Dice System defines how randomness is introduced into Age of Chess.

Dice are used to resolve combat between non-King pieces.

The purpose of dice is to:

- Add uncertainty
- Allow weaker pieces to sometimes defeat stronger pieces
- Prevent fully deterministic trades
- Create tactical risk
- Support replayability

Dice should influence outcomes, but not replace strategy.

---

# 2. Dice Type

All dice are standard six-sided dice.

Each die can roll:

```txt
1, 2, 3, 4, 5, or 6
```

---

# 3. Dice Attributes

Each piece has two dice-related attributes:

- AD: Attack Dice
- DD: Defense Dice

AD is used when the piece attacks.

DD is used when the piece defends.

---

# 4. Base Dice Values

| Piece  | Attack Dice | Defense Dice |
| ------ | ----------- | ------------ |
| Pawn   | 2           | 1            |
| Knight | 3           | 2            |
| Bishop | 3           | 2            |
| Rook   | 4           | 3            |
| Queen  | 4           | 3            |

---

# 5. Why Dice Are Asymmetric

Most pieces have more Attack Dice than Defense Dice.

This is intentional.

Design purpose:

- Encourage attacking
- Prevent excessive defensive play
- Make combat resolve faster
- Reward active positioning

---

# 6. Dice Rolling Procedure

When combat begins:

1. Attacker rolls AD dice
2. Defender rolls DD dice
3. Results are sorted from highest to lowest
4. Only top 3 dice are considered
5. Dice are paired in order

---

# 7. Top 3 Dice Rule

Only the best 3 dice from each side can be used in combat.

Example:

```txt
Queen rolls 4 dice:
6, 5, 3, 1

Used:
6, 5, 3

Ignored:
1
```

Purpose:

- Prevent large dice pools from becoming overwhelming
- Keep combat readable
- Reduce Queen dominance
- Limit extreme outcomes

---

# 8. Pairing Dice

Dice are paired from highest to lowest.

Example:

```txt
Attacker rolls:
6, 4, 2

Defender rolls:
5, 3

Pairs:
6 vs 5
4 vs 3

Unpaired:
Attacker's 2 is ignored
```

---

# 9. Unpaired Dice

Unpaired dice do not deal damage by default.

They are ignored unless a specific buff, debuff, or terrain effect says otherwise.

This keeps the base system simple and controlled.

---

# 10. Dice Comparison

Each pair is resolved independently.

Possible results:

```txt
Attacker higher → Defender takes damage
Defender higher → Attacker takes damage
Equal values → Tie Rule
```

---

# 11. Ties

Ties are not automatic defender wins.

Instead:

- If both pieces have HP ≥ 2 → both take damage
- If either piece has HP = 1 → no damage from the tie

This makes ties neutral but still meaningful.

---

# 12. Dice Modifiers

Dice can be modified by:

- Buffs
- Debuffs
- Terrain
- King corruption effects

Examples:

- Iron Age may increase defense dice
- Immoral may reduce attack dice
- Equal Conditions may cap dice advantage

---

# 13. Dice Caps

Dice changes must respect system limits:

- Combat only uses top 3 dice
- Probability-based effects cannot exceed 20%
- Buffs cannot create infinite dice scaling

---

# 14. Equal Conditions Interaction

When the terrain Equal Conditions is active:

- Dice difference between attacker and defender is capped at 1

Example:

```txt
Queen attacks Pawn.

Queen AD = 4
Pawn DD = 1

Difference = 3

Equal Conditions caps the difference to 1.

Queen may only use 2 dice against the Pawn's 1.
```

Purpose:

- Make weaker pieces more relevant
- Reduce extreme combat gaps
- Create a more chaotic and equal battlefield

---

# 15. Iron Age Interaction

If a player has Iron Age:

- Their pieces defend using the same number of dice as their attack dice

Example:

```txt
Rook AD = 4
Rook DD normally = 3

With Iron Age:
Rook DD = 4
```

However:

- Top 3 dice rule still applies

---

# 16. Immoral Interaction

If a player is affected by Immoral:

- Their pieces attack using their Defense Dice value

Example:

```txt
Rook normally attacks with 4 dice.
Rook DD = 3.

With Immoral:
Rook attacks with 3 dice.
```

---

# 17. Cowardice Interaction

If a piece is affected by Cowardice:

- Before rolling, check if the attack fails
- If the attack fails, no dice are rolled
- The attack produces no combat damage

The move is still considered an attempted attack.

---

# 18. Dice During Frenzy

During Frenzy Phase:

- Dice are not used
- Combat is disabled
- Captures are instant

---

# 19. Design Guidelines

Dice should create:

- Tension
- Upsets
- Uncertainty
- Tactical choices

Dice should not create:

- Pure chaos
- Unreadable outcomes
- Guaranteed wins
- Infinite scaling

---

# 20. Example Dice Resolution

```txt
White Rook attacks Black Knight.

Rook AD = 4
Knight DD = 2

White rolls:
6, 5, 3, 1

Top 3:
6, 5, 3

Black rolls:
5, 4

Pairs:
6 vs 5 → Knight takes 1 damage
5 vs 4 → Knight takes 1 damage

Rook wins all comparisons.

Momentum:
Knight takes +1 damage.

Total:
Knight takes 3 damage.

Result:
Knight dies.
```

---

END
