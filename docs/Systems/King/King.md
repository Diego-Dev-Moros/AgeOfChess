# King System

---

# 1. Overview

The King is the most important piece in Age of Chess.

Like in classical chess, the King is the center of the win condition.
However, in Age of Chess, the King also has a unique power system called **Divinity**.

The King is not a normal combat piece.

It does not use dice.
It does not take HP damage.
It cannot be killed through normal combat.

The King can only be defeated through:

```txt
Checkmate
```

---

# 2. Design Purpose

The King System exists to create a strategic tension between:

- Power
- Risk
- Timing
- Sacrifice
- Long-term consequences

The King is designed to feel powerful, but dangerous to overuse.

The central question for the player is:

> “Is this Divine Attack worth spending Divinity and exposing my King?”

---

# 3. Core King Rules

The King:

- Moves like a classical chess King
- Moves 1 square in any direction
- Cannot move into check
- Does not use Attack Dice
- Does not use Defense Dice
- Does not have HP
- Cannot be killed by damage
- Can only lose by checkmate
- Can use Divine Attack if it has Divinity greater than 0

---

# 4. King Movement

The King moves as in classical chess:

- 1 square horizontally
- 1 square vertically
- 1 square diagonally

The King cannot move into a square controlled by an enemy piece.

---

# 5. Castling

Castling follows classical chess rules.

Castling is allowed only if:

- The King has not moved
- The chosen Rook has not moved
- There are no pieces between the King and the Rook
- The King is not currently in check
- The King does not pass through check
- The King does not end in check

Divinity does not change castling rules.

---

# 6. The King and Combat

The King does not participate in normal combat.

This means:

- The King does not roll dice
- The King does not compare dice
- The King does not receive combat damage
- The King does not trigger normal damage calculation
- The King does not use HP

When the King attacks, it uses **Divine Attack** instead.

---

# 7. Divine Attack

If the King has Divinity greater than 0, it may attack an enemy piece by moving into that piece’s square.

When this happens:

```txt
The target piece is instantly removed.
```

No dice are rolled.

No normal combat occurs.

After the Divine Attack resolves:

```txt
King Divinity -1
```

---

# 8. Divine Attack Requirements

The King may use Divine Attack only if:

- The target is an enemy piece
- The King can legally move to the target square
- The King has Divinity greater than 0
- The target square is legal for the King to occupy
- The move does not place the King in check illegally

---

# 9. Divine Attack Restrictions

Divine Attack:

- Does not use dice
- Does not deal damage
- Does not trigger normal combat
- Does not benefit from Buffs
- Does not suffer from Debuffs by default
- Does not apply during Frenzy Phase
- Cannot target another King
- Cannot be used if Divinity is 0 or lower

---

# 10. Commitment Rule

After the King performs a Divine Attack:

```txt
The King cannot move on its next turn.
```

This is called the **Commitment Rule**.

The King may still be in check after attacking if enemy pieces threaten its new position.

If the King is in check on its next turn, the player must resolve the check according to legal check rules.

Check response has priority over Commitment.

If a committed King is in check, the King may move to escape check as long as the move is legal.

See [[Systems/Timing/Timing_And_Priority|Timing_And_Priority]] and [[Edge_Cases]].

---

# 11. Purpose of the Commitment Rule

The Commitment Rule prevents the King from becoming a safe hit-and-run piece.

Without this rule, the King could:

1. Enter combat
2. Instantly kill a piece
3. Retreat safely
4. Repeat with low risk

The Commitment Rule makes Divine Attack a serious positional commitment.

---

# 12. Divinity

Divinity is the King’s unique resource.

Each King begins the match with:

```txt
3 Divinity
```

Divinity represents the King’s divine authority, supernatural power, and control over the army.

Divinity is spent when the King kills.

---

# 13. Divinity Loss

Whenever the King performs a Divine Attack:

```txt
Divinity -1
```

Example:

```txt
King starts with 3 Divinity.

King kills an enemy Bishop.

Divinity becomes 2.
```

---

# 14. Divinity Recovery

If the King does not perform a Divine Attack for 3 of that player's own consecutive turns:

```txt
Divinity +1
```

Maximum Divinity:

```txt
3
```

The King cannot recover above 3 Divinity.

Recovery is checked at the end of that player's third own turn without Divine Attack.

Opponent turns do not count toward this recovery timer.

---

# 15. Purpose of Divinity Recovery

Divinity Recovery exists to prevent one fixed optimal strategy.

Without recovery, the best strategy could become:

- Never use the King
- Or use the King only once at a predictable moment

With recovery, players can choose between:

- Conserving Divinity
- Spending Divinity for tempo
- Waiting to recover power
- Timing Divine Attacks around board state

---

# 16. Overuse Penalty

If the King attacks twice within 2 turns:

```txt
The King loses 2 Divinity total.
```

This is called the **Overuse Penalty**.

This rule prevents King spam and makes repeated Divine Attacks dangerous.

---

# 17. Divinity States

The King changes state depending on its current Divinity.

| Divinity    | State          | Main Effect                   |
| ----------- | -------------- | ----------------------------- |
| 3 to 1      | Divine King    | Can use Divine Attack         |
| 0           | Thorn King     | Cannot attack                 |
| -1 to -3    | Corrupted King | Allied pieces gain Cowardice  |
| Less than -3 | Demon King    | All allied pieces HP become 1 |

Balance note:

- Demon King is currently preferred to begin below -3, not exactly at -3.
- This threshold is not final and must be validated through simulations and playtesting.
- See [[Edge_Cases]].

---

# 18. Divine King

## Divinity Range

```txt
3 to 1
```

## Effect

The King can use Divine Attack.

## Gameplay Meaning

The King is still powerful and can instantly remove enemy pieces.

This is the safest and strongest state for the King.

## Strategic Role

The Divine King is best used to:

- Remove a key threat
- Break a defensive formation
- Create tempo advantage
- Escape a dangerous board state through offense
- Punish exposed enemy pieces

## Risk

Every Divine Attack reduces Divinity.

The King becomes weaker as it uses its power.

---

# 19. Thorn King

## Divinity Value

```txt
0
```

## Effect

The King cannot attack.

The King still moves normally.

## Gameplay Meaning

The King has exhausted its divine power.

It remains the victory condition, but no longer functions as an execution piece.

## Strategic Role

The Thorn King forces the player to rely on:

- Normal pieces
- Positioning
- Defensive structure
- Checkmate threats
- Frenzy timing

## Risk

A Thorn King cannot remove threats directly through Divine Attack.

---

# 20. Corrupted King

## Divinity Range

```txt
-1 to -3
```

## Effect

All allied non-King pieces gain Cowardice based on the King’s corruption level.

Suggested scaling:

| Divinity | Army Penalty   |
| -------- | -------------- |
| -1       | +5% Cowardice  |
| -2       | +10% Cowardice |
| -3       | +15% Cowardice |

Cowardice represents the army losing faith in the King.

---

# 21. Cowardice from Corruption

Cowardice is a failure chance applied to allied non-King pieces when they attack.

Example:

```txt
A King reaches Divinity -2.

All allied non-King pieces now have +10% Cowardice.

When those pieces attack, they have a 10% chance to fail before rolling dice.
```

The global probability cap still applies.

---

# 22. Gameplay Meaning of Corruption

The Corrupted King represents a ruler who has abused divine power.

The army becomes less reliable.

This creates a long-term cost for reckless King usage.

---

# 23. Demon King

## Divinity Range

```txt
Less than -3
```

## Effect

All allied non-King pieces have their HP set to:

```txt
1 HP
```

This represents the army becoming cursed, broken, or sacrificed by the King’s corruption.

---

# 24. Demon King Clarification

When the King reaches Demon King state:

- All allied non-King pieces immediately become 1 HP
- Pieces already at 1 HP remain at 1 HP
- This does not affect the King
- This does not kill pieces directly
- This effect ends during Frenzy because all pieces are already 1 HP

Current status:

- The preferred threshold is less than -3.
- This is an open balance question.
- If testing shows Demon King is unreachable, the threshold may move back to -3.

---

# 25. Gameplay Meaning of Demon King

The Demon King is a high-risk collapse state.

The King may still exist as the victory condition, but the army becomes extremely fragile.

This state is meant to feel dangerous and desperate.

---

# 26. How to Reach Each State

## Start of Match

```txt
Divinity = 3
State = Divine King
```

## After 1 Divine Attack

```txt
Divinity = 2
State = Divine King
```

## After 2 Divine Attacks

```txt
Divinity = 1
State = Divine King
```

## After 3 Divine Attacks

```txt
Divinity = 0
State = Thorn King
```

## Further Overuse or Special Effects

```txt
Divinity < 0
State = Corrupted King
```

## Severe Corruption

```txt
Divinity < -3
State = Demon King
```

---

# 27. Important Design Clarification

Under normal play, the King reaches 0 Divinity after spending all 3 Divine Attacks.

To go below 0, one of the following must occur:

- Overuse Penalty
- Future card effects
- Future terrain effects
- Special scenario rules
- Campaign/story modifiers

This keeps Demon King rare and dramatic, but the exact threshold remains a balance question.

---

# 28. King and Check

A King is in check when:

```txt
An enemy piece threatens to capture the King on the next move.
```

Because the King cannot be damaged, check does not mean the King loses HP.

Check means the King is under a legal threat and must respond.

---

# 29. Valid Responses to Check

When in check, the player must respond by one of the following:

- Move the King to a safe square
- Capture the checking piece
- Block the line of attack
- Use a legal Divine Attack if the proposed Divine Attack check-response rule is approved

---

# 30. King and Checkmate

Checkmate occurs when:

- The King is in check
- The player has no legal move to escape check

This remains the primary win condition of the game.

The King does not need to have 0 HP because the King has no HP.

---

# 31. Divine Attack as Check Response

Status:

```txt
Proposed rule, not official.
```

Proposed rule:

The King may use Divine Attack to escape check if:

- The King has Divinity greater than 0
- The Divine Attack removes the checking piece
- The King can legally move to the target square
- The King does not end the move in check
- The target is not the opposing King
- Frenzy Phase is not active
- The player has not already used Divine Attack as a check response during this match

Example:

```txt
An enemy Rook gives check.

The King has 1 Divinity.

If the King can legally move to the Rook’s square and that square is safe after the capture:

The King may use the proposed Divine Attack response against the Rook.
Divinity becomes 0.
```

This rule should remain in system documentation until confirmed for the official rules.

---

# 32. Design Analysis: Divine Attack as Check Response

Divine Attack as a check response is powerful because it can convert a defensive emergency into material removal.

If implemented without restrictions, it creates major risks:

- Long-range checks become weaker.
- Queen, rook, and bishop pressure against the King loses value.
- Divinity becomes a universal escape shield.
- Checkmate patterns become harder to read.
- The King may become safer when it has Divinity, which goes against the risk-based design of the system.

The proposed version avoids those problems by treating Divine Attack as a legal King move with instant removal, not as a ranged spell.

Required restrictions:

1. The King must have Divinity greater than 0.
2. The target must be the checking piece.
3. The King must be able to legally move to the target square.
4. The target square must not be protected in a way that leaves the King in check.
5. The target cannot be the opposing King.
6. Frenzy Phase must not be active.
7. Each player may use Divine Attack as a check response only once per match.
8. The move must resolve all current checks, including double check.

## Once Per Match Limit

Divine Attack as a check response should be limited to one use per player per match.

Reason:

- Repeated Divine check responses can turn Divinity into a recurring escape system.
- This can make checking the King feel unrewarding.
- It can extend games by repeatedly neutralizing tactical pressure.
- It reduces the opponent's ability to convert good positioning into checkmate pressure.

The once-per-match limit keeps the response dramatic:

```txt
This is an emergency divine intervention, not a standard defensive tool.
```

Normal Divine Attack outside check response still follows the regular Divinity, Commitment, and Overuse rules.

## Failure Chance Analysis

Adding a random failure chance to Divine Attack as a check response is not recommended for the core rules.

Reason:

- Check response is a legal-state requirement.
- If the King chooses Divine Attack as its only legal check response and it fails randomly, the game may end because of a die roll rather than because the opponent created an unavoidable checkmate.
- This weakens the clarity of check and checkmate.
- It adds randomness to the most important defensive moment in the game.

Design position:

```txt
Divine Attack as check response should be restricted by legality, Divinity, and one use per match, not by random failure.
```

Rejected idea:

```txt
Divine Attack used as a check response has a random failure chance.
```

This is not recommended for the current design.

If Divine Attack as check response proves too safe, use deterministic restrictions first:

- Keep the once-per-match limit.
- Increase Divinity cost only for check-response use.
- Require the King to become committed for longer.
- Remove the check-response option entirely.

## Single Check

If one enemy piece gives check, Divine Attack may be valid if the King can legally move to that piece and be safe afterward.

Example:

```txt
Enemy Knight checks the King from an adjacent legal King destination.
King has Divinity.
The Knight's square is not protected.

The proposed rule would allow Divine Attack.
```

## Long-Range Check

If a rook, bishop, or queen gives check from far away, Divine Attack is usually not valid unless the King can legally move to that square.

This preserves the value of long-range pressure.

## Double Check

If two pieces give check at the same time, Divine Attack only works if removing one checking piece and moving to its square also resolves the other check.

If the second check remains active, the Divine Attack is illegal.

## Design Recommendation

Current recommendation:

```txt
Keep Divine Attack as check response proposed, not official.
```

It should become official only if simulations show that:

- It does not erase long-range check tactics.
- It does not make Divine King too safe.
- It creates interesting risk decisions.
- It remains easy to explain.
- It does not need a random failure chance to stay balanced.
- The once-per-match limit prevents repeated escape patterns.

---

# 33. King and Frenzy Phase

During Frenzy Phase:

- Divine Attack is disabled
- Dice combat is disabled
- All captures are instant
- The King follows classical chess behavior
- Check and checkmate follow classical chess logic

The King cannot use Divinity during Frenzy unless a special rule explicitly allows it.

---

# 34. King and Buffs

Default rule:

- Buffs do not affect the King
- Buffs do not modify Divine Attack
- Buffs do not change Divinity

Future King-specific Buffs may exist, but they must be reviewed carefully.

---

# 35. King and Debuffs

Default rule:

- Debuffs do not affect the King directly
- Debuffs do not prevent Divine Attack
- Debuffs do not modify Divinity

Future King-specific Debuffs may exist, but they must not make checkmate automatic or unavoidable.

---

# 36. King and Terrain

Default rule:

- Terrain does not affect the King directly
- Terrain does not modify Divinity
- Terrain does not prevent checkmate
- Terrain does not change Divine Attack

Future King-related Terrain effects should be rare and strongly bounded.

---

# 37. King and Allied Army

The King’s Divinity state can affect allied pieces.

Main army-level effects:

- Corrupted King applies Cowardice to allied non-King pieces.
- Demon King reduces allied non-King pieces to 1 HP.

This means King power is not isolated.

Using the King recklessly can weaken the entire army.

---

# 38. Strategic Role of the King

The King can be used as:

- A finisher
- A defensive tool
- A tempo weapon
- A threat remover
- A sacrifice-risk engine

The King should not be used casually.

A Divine Attack should always create a meaningful decision.

---

# 39. Strategic Questions for the Player

Before using Divine Attack, the player should ask:

- Is this target valuable enough?
- Will the King be safe after attacking?
- Can the opponent punish the Commitment Rule?
- Is losing Divinity worth it?
- Am I close to Thorn or Corrupted state?
- Will this matter before Frenzy begins?

---

# 40. Example 1 — Basic Divine Attack

```txt
White King has 3 Divinity.

White King moves onto a Black Bishop.

The Bishop is instantly removed.

White King Divinity becomes 2.

White King cannot move on White’s next turn.
```

---

# 41. Example 2 — Reaching Thorn King

```txt
Black King starts with 3 Divinity.

First Divine Attack:
Divinity 3 → 2

Second Divine Attack:
Divinity 2 → 1

Third Divine Attack:
Divinity 1 → 0

Black King becomes Thorn King.

Black King can no longer attack.
```

---

# 42. Example 3 — Overuse Penalty

```txt
White King performs a Divine Attack.

Divinity 3 → 2

White King attacks again within 2 turns.

Normal cost:
Divinity -1

Overuse Penalty:
Additional Divinity loss applies.

White King loses 2 Divinity total from the second aggressive sequence.
```

---

# 43. Example 4 — Corrupted King

```txt
Black King reaches Divinity -2.

Black King is now Corrupted.

All Black non-King pieces gain +10% Cowardice.

When Black pieces attack, they have a 10% chance to fail before rolling dice.
```

---

# 44. Example 5 — Demon King

```txt
White King reaches Divinity -4.

White King becomes Demon King.

All White non-King pieces immediately become 1 HP.

White pieces are now extremely fragile.
```

---

# 45. Balance Notes

The King is powerful because:

- It can remove pieces instantly
- It ignores normal combat
- It can change tempo dramatically

The King is balanced because:

- Divine Attack spends Divinity
- Commitment exposes the King
- Overuse accelerates collapse
- Corruption weakens the army
- Frenzy disables Divine Attack
- The King still loses by checkmate

---

# 46. Design Risks

Potential risks:

- King becomes too safe if Commitment is ignored
- Divine Attack becomes too weak if Divinity is too scarce
- Corruption may feel too punishing if reached too easily
- Demon King should feel rare, dramatic, and dangerous

---

# 47. Design Guidelines for Future King Mechanics

Any future King-related mechanic must answer:

- Does it preserve checkmate as the win condition?
- Does it avoid making the King invincible?
- Does it avoid making Divine Attack free?
- Does it preserve counterplay?
- Does it respect Frenzy?
- Does it avoid automatic checkmate?
- Does it keep Divinity meaningful?

---

# 48. Summary

The King System is based on one central idea:

```txt
Power has a cost.
```

The King can destroy pieces instantly, but every use reduces divine authority and may eventually weaken the entire army.

The King is not a fighter.

The King is a strategic resource, a positional risk, and the heart of the win condition.

---

END
