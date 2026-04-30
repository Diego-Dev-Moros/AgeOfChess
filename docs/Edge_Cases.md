# Edge Cases

---

# 1. Purpose

This document records unresolved, unusual, or implementation-sensitive rules for Age of Chess.

It should be used together with [[Timing_And_Priority]].

---

# 2. Failed Attack Positioning

If an attack fails before combat because of Cowardice, Dirty Play, Fatigue, or a similar effect:

- The attacker remains in its original square.
- The attacker does not enter the occupied enemy square.
- No dice are rolled.
- No combat occurs.
- No damage is dealt.
- The player's turn is consumed.

This represents the piece attempting to attack and losing the opportunity before contact.

---

# 3. Fatigue Redirection

Fatigue is not finalized.

Current testing recommendation:

```txt
Valid allied piece = an allied non-King piece within the attacker's legal attack range from its original square.
```

This is the recommended first test option because it keeps Fatigue positional and gives players counterplay through spacing.

Rejected for now:

- Any allied piece anywhere on the board.

Reason:

- Too chaotic.
- Too hard to control.
- Too likely to feel unfair.

Still open:

- Whether Fatigue should instead target allied pieces adjacent to the attacker or adjacent to the intended target.

---

# 4. Last Will Killing The Attacker

If Last Will kills the attacker after the defender dies:

1. Attacker enters normal combat.
2. Defender dies.
3. Attacker would normally occupy the defender's square.
4. Last Will triggers.
5. Attacker receives Last Will damage.
6. If the attacker dies, it is removed.
7. The target square becomes empty.

Practical rule:

```txt
If the attacker dies from Last Will, the target square ends empty.
```

---

# 5. Simultaneous Deaths

If both combat participants reach 0 HP or lower from simultaneous combat damage:

- Both pieces are removed.
- The target square becomes empty.
- Death effects are checked after damage is applied.

If additional death effects create more deaths, resolve those after the initial simultaneous death.

---

# 6. Commitment While In Check

King Commitment prevents voluntary King movement on the player's next turn after Divine Attack.

However:

```txt
Check response has priority over Commitment.
```

If a committed King is in check, the player may use any legal check response, including moving the King if that move is legal.

Commitment should not create an impossible or illegal chess state.

---

# 7. Divine Attack As Check Response

Status:

```txt
Proposed rule, not official.
```

Proposed rule:

The King may use Divine Attack to respond to check if all of the following are true:

- The King has Divinity greater than 0.
- The Divine Attack removes the checking piece.
- The King can legally move to the target square.
- The King does not end the move in check.
- The target is not the opposing King.
- Frenzy Phase is not active.

This keeps Divine Attack powerful without making it an automatic escape from check.

---

# 8. Stone Pieces And Minimum Damage

Stone Pieces increases the player's damage floor.

Current rule:

- If an allied piece deals combat damage, its minimum total damage is 2.
- If the Minimum Damage Rule causes that piece to deal damage, Stone Pieces may raise that damage to 2 for that player.
- If the attack fails before combat, Stone Pieces does not apply.

Example:

```txt
White has Stone Pieces.
White Pawn attacks Black Pawn.
The dice produce 0 damage.
Minimum Damage Rule causes both pieces to deal 1 damage.
White Pawn's damage floor becomes 2.
Black Pawn takes 2 damage.
White Pawn takes 1 damage unless Black also has a relevant modifier.
```

---

# 9. Frenzy Interactions

When Frenzy begins:

- HP reset to 1 is not damage.
- HP reset does not trigger Last Will.
- HP reset does not trigger Holy Ground.
- HP reset does not trigger Hell.
- Dice are disabled.
- Normal combat is disabled.
- Divine Attack is disabled by default.
- Buffs, debuffs, and terrain tied to combat, dice, damage, HP, or probability are disabled.

---

# 10. Hidden Card Timing

Card visibility is partially unresolved.

Current intended structure:

1. Card selection
2. Hidden state
3. Activation or reveal
4. Active effect
5. Expiration, if applicable

Known rule:

- Terrain is public before the match begins.

Open questions:

- Are Buffs and Debuffs passive from the start?
- Are they manually activated?
- Are they secretly active while face down?
- Do hidden rules apply to all Buffs and Debuffs or only future special card types?

Until resolved, card documents should mark hidden timing as an open design decision.

---

# 11. Demon King Threshold

Current preference:

```txt
Demon King begins below -3.
```

Working structure:

| Divinity | State |
| --- | --- |
| 3 to 1 | Divine King |
| 0 | Thorn King |
| -1 to -3 | Corrupted King |
| Less than -3 | Demon King |

Status:

- Not final.
- Requires simulations and playtesting.
- Main question: whether the King can realistically reach Demon King in normal matches.

---

# 12. Classical Draw Rules

Player-facing rules should keep classical draw rules simple.

Implementation notes may need extra tracking:

- The 50-move rule should account for pawn movement, piece death, successful combat damage, and Divine Attack.
- Threefold repetition should account for board position, active player, HP state, Divinity state, active cards, and terrain.

These details should be expanded in a future draw-rules file if draw handling becomes implementation-critical.

---

END
