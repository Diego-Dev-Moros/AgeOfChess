# Time System

---

# 1. Overview

The Time System defines the duration and pacing structure of an Age of Chess match.

Age of Chess uses a fixed match timer to ensure that games do not last indefinitely and that every match naturally moves toward a conclusion.

The Time System is also responsible for triggering the Frenzy Phase.

Timing reference: [[Systems/Timing/Timing_And_Priority|Timing_And_Priority]]

---

# 2. Purpose

The Time System exists to:

- Prevent infinite games
- Create pacing pressure
- Encourage active decision-making
- Prevent excessive defensive play
- Ensure matches reach a conclusion
- Create a dramatic endgame transition

---

# 3. Match Duration

Default match duration:

```txt
10 minutes
```

This is the total match time.

The current base format assumes a shared match clock.

Future variants may use individual chess clocks, but the default system uses one global match timer.

---

# 4. Match Timer

The match timer begins when the first player makes the first move.

The timer continues until:

- Checkmate occurs
- A draw is declared
- Time expires
- Frenzy Phase resolves into a final outcome

---

# 5. Time Phases

Age of Chess has four pacing phases:

| Time Remaining | Phase        |
| -------------- | ------------ |
| 10:00 to 6:00  | Early Game   |
| 6:00 to 2:00   | Mid Game     |
| 2:00 to 1:00   | Late Game    |
| 1:00 to 0:00   | Frenzy Phase |

These phases are not separate rule states except for Frenzy.

They are design references for pacing and playtesting.

---

# 6. Early Game

Approximate time:

```txt
10:00 to 6:00
```

Expected gameplay:

- Development
- Positioning
- Low-risk combat
- Card and terrain adaptation
- Early pawn structure changes

Design goal:

- Allow players to understand the match modifiers
- Avoid early forced collapse
- Create tactical setup

---

# 7. Mid Game

Approximate time:

```txt
6:00 to 2:00
```

Expected gameplay:

- More frequent combat
- Piece trades
- King Divinity decisions
- Terrain impact becomes visible
- Buffs and Debuffs influence strategy

Design goal:

- Create the main tactical body of the match
- Encourage meaningful use of systems
- Force risk and resource management

---

# 8. Late Game

Approximate time:

```txt
2:00 to 1:00
```

Expected gameplay:

- Reduced material
- High pressure
- King decisions become critical
- Players prepare for Frenzy
- Positioning becomes more important than HP

Design goal:

- Transition from probabilistic tactics into deterministic endgame
- Make players decide whether to resolve before Frenzy or prepare for it

---

# 9. Frenzy Trigger

When the match timer reaches:

```txt
1:00 remaining
```

Frenzy Phase begins immediately.

The Frenzy transition is mandatory.

Players cannot delay, skip, or cancel Frenzy.

---

# 10. Time Expiration

If time reaches:

```txt
0:00
```

and no checkmate has occurred, the game is resolved by the time victory rules.

Recommended tiebreak order:

1. Checkmate, if it occurred before time expired
2. Material advantage
3. King safety
4. Board control
5. Draw if still unresolved

---

# 11. Material Advantage

Material advantage may be calculated using classical piece values:

| Piece  | Value |
| ------ | ----- |
| Pawn   | 1     |
| Knight | 3     |
| Bishop | 3     |
| Rook   | 5     |
| Queen  | 9     |

The King is not counted as material.

---

# 12. King Safety

If material is tied, evaluate King safety.

King safety may consider:

- Is the King currently in check?
- Number of legal King moves
- Number of enemy threats near the King
- Whether the King is trapped
- Whether allied pieces protect escape squares

---

# 13. Board Control

If material and King safety are still tied, evaluate board control.

Board control may consider:

- Center control
- Number of legal attacks
- Piece activity
- Promotion threats
- Control around enemy King

---

# 14. Time and Turn Completion

If time expires during a turn:

- The current declared action should finish resolving.
- Combat, damage, death effects, and check validation complete.
- Then time victory is evaluated.

This prevents unresolved partial actions.

---

# 15. Time and Combat

Time does not interrupt combat.

Once combat begins:

- Dice are rolled
- Damage is calculated
- Effects are resolved
- Board state is finalized

Then time is checked.

---

# 16. Time and King Divinity

Time does not directly modify Divinity.

However:

- Frenzy disables Divine Attack by default.
- Divinity still exists as a recorded state, but it has no active effect during Frenzy unless a future rule says otherwise.

---

# 17. Time and Buffs/Debuffs

Before Frenzy:

- Buffs and Debuffs operate normally.

During Frenzy:

- Buffs and Debuffs that affect combat, dice, HP, or probability are disabled by default.

Reason:

Frenzy is designed to remove randomness and resolve through pure chess.

---

# 18. Time and Terrain

Before Frenzy:

- Terrain operates normally.

During Frenzy:

- Terrain effects related to combat, dice, HP, damage, or probability are disabled by default.

Terrain may still be referenced for lore or visual identity, but not for combat resolution.

---

# 19. Time and Draw Rules

Classical draw rules still apply, but Age of Chess requires clarification.

The 50-move rule should reset when any of the following occurs:

- Pawn movement
- Piece death
- Successful combat damage
- Divine Attack

Threefold repetition should consider:

- Board position
- Active player
- King Divinity state
- HP state
- Active cards
- Active terrain

---

# 20. Design Risks

Potential risks:

## Matches end too often by time

This may mean:

- Combat is too slow
- Players are too defensive
- Frenzy begins too late
- HP values are too high

## Matches end too early

This may mean:

- Damage is too high
- Buffs are too strong
- Terrain is too lethal
- King attacks are too efficient

## Frenzy feels disconnected

This may mean:

- Transition is too abrupt
- Players cannot prepare
- Too many systems turn off at once

---

# 21. Tuning Levers

Time system can be tuned by changing:

- Total match duration
- Frenzy start time
- Time victory rules
- Whether clocks are shared or individual
- Whether turn limits exist
- Whether Frenzy disables all or only some systems

Current default:

```txt
10-minute match
1-minute Frenzy
Shared timer
```

---

# 22. Future Variants

Possible future time formats:

## Blitz

```txt
5-minute match
30-second Frenzy
```

## Standard

```txt
10-minute match
1-minute Frenzy
```

## Extended

```txt
20-minute match
2-minute Frenzy
```

## Competitive Clock

Each player has individual time.

When a player runs out of time, time victory rules apply.

---

# 23. Design Summary

The Time System is the game’s convergence engine.

It ensures that Age of Chess does not become an endless tactical puzzle.

The timer pressures players to act, and Frenzy guarantees that the final phase becomes clean, readable, and decisive.

---

END
