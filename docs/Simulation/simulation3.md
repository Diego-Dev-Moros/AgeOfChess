# Simulation 3

---

# 1. Simulation Type

Stress test.

Purpose:

- Test Dirty Play with Cowardice probability cap.
- Test repeated King usage and Overuse Penalty.
- Test Demon King reachability.
- Test failed attacks in a volatile terrain.
- Reach Frenzy and resolve by time victory.

Related references:

- [[simulations_guide]]
- [[Dirty_Play]]
- [[Cowardice]]
- [[King]]
- [[Time_System]]
- [[Frenzy_Phase]]
- [[Card_Balance]]

---

# 2. Setup

| Element | White | Black |
| --- | --- | --- |
| Buff | Last Will | Giant Slayer |
| Debuff applied to opponent | Cowardice | Fatigue |
| Starting Divinity | 3 | 3 |

Terrain:

```txt
Dirty Play
```

Public / hidden information:

- Dirty Play is public.
- Cards are secretly active from match start.
- Cards reveal when their effect changes a public outcome.

Probability cap:

```txt
Cowardice 15% + Dirty Play 10% is capped at 20%.
```

Black is affected by Cowardice from White and Dirty Play from terrain.

White is affected by Fatigue from Black and Dirty Play from terrain.

---

# 3. Early Game

## Turn 1

White:

```txt
Pawn d2 -> d4
```

Black:

```txt
Pawn d7 -> d5
```

No combat.

---

## Turn 2

White:

```txt
Pawn d4 attacks d5
```

Pawns cannot capture forward.

Correction:

```txt
White plays Pawn c2 -> c4.
```

Simulation note:

- Classical movement validation remains critical.

Black:

```txt
Pawn d5 attacks c4
```

Pre-action:

- Black has Cowardice 15%.
- Dirty Play adds 10%.
- Total failure chance is capped at 20%.
- Failure check succeeds for the attack.

Combat:

```txt
Black Pawn vs White Pawn
```

Rolls:

```txt
Black Pawn AD: 5, 2
White Pawn DD: 4
```

Resolution:

```txt
5 > 4 -> White Pawn takes 1
Black wins all comparisons -> Momentum +1
Dirty Play adds +1 damage on successful attack
```

Result:

```txt
White Pawn dies.
Black Pawn occupies c4.
```

Card reveal:

```txt
White's Cowardice is not revealed because the failure roll did not fail.
Dirty Play was already public.
```

---

# 4. Mid Game

## Turn 3

White:

```txt
Knight b1 attacks c3
```

No combat.

Black:

```txt
Pawn c4 attacks b3
```

Pre-action:

```txt
Failure chance capped at 20%.
Failure check fails.
```

Result:

```txt
No dice are rolled.
No combat occurs.
Black Pawn remains on c4.
Black turn is consumed.
White reveals Cowardice.
```

System tested:

- Dirty Play + Cowardice cap.
- Failed attack positioning.

---

## Turn 4

White:

```txt
Knight c3 attacks b5
```

Pre-action:

- White is affected by Fatigue.
- Dirty Play also applies.
- Fatigue check does not trigger.
- Dirty Play failure check succeeds.

No combat.

Black:

```txt
Knight g8 -> f6
```

---

## Turn 5

White:

```txt
Knight b5 attacks c7
```

Pre-action:

- Fatigue check triggers.
- Valid allied target in Knight range from b5:
  - White Pawn d4 is absent.
  - White Bishop d3 is not present.
  - No valid allied non-King piece.

Result:

```txt
Attack fails.
White Knight remains on b5.
White turn is consumed.
Black reveals Fatigue.
```

System tested:

- Fatigue can fail without global random damage.

---

## Turn 6

Black:

```txt
Knight f6 attacks d5
```

No combat.

White:

```txt
Bishop c1 attacks g5
```

No combat.

---

## Turn 7

Black:

```txt
Knight d5 attacks b4
```

No combat.

White:

```txt
Bishop g5 attacks d8
```

Combat:

```txt
White Bishop vs Black Queen
```

Pre-action:

- Dirty Play failure check succeeds.
- White has Last Will, but it only matters if White piece dies.
- Black has Giant Slayer, but Black is defending, so it does not apply.

Rolls:

```txt
White Bishop AD: 6, 4, 2
Black Queen DD: 5, 5, 1
```

Resolution:

```txt
6 > 5 -> Queen takes 1
4 < 5 -> Bishop takes 1
2 > 1 -> Queen takes 1
Dirty Play adds +1 damage to Queen because attack succeeded
```

Final damage:

```txt
Black Queen takes 3 damage.
White Bishop takes 1 damage.
```

Result:

```txt
Queen HP 4 -> 1.
Bishop HP 2 -> 1.
Both survive.
Bishop returns to g5.
```

System tested:

- Dirty Play successful damage.
- High-value piece survives but is heavily pressured.

---

# 5. King Overuse Sequence

## Turn 8

Black:

```txt
King e8 uses Divine Attack on Bishop g5
```

Legality check:

- King cannot legally move from e8 to g5.

Action is illegal.

Actual move:

```txt
King e8 -> f7
```

Simulation note:

- Divine Attack must remain movement-legal.

---

## Turn 9

White:

```txt
Queen d1 -> h5+
```

Black:

```txt
King f7 uses Divine Attack on Queen h5
```

Legality check:

- King cannot legally move from f7 to h5.
- Proposed check-response Divine Attack also fails because the King cannot legally move to the target square.

Actual response:

```txt
King f7 -> g8
```

---

## Turn 10

White:

```txt
Queen h5 -> f7+
```

Black:

```txt
King g8 uses Divine Attack on Queen f7
```

Legality:

- King can legally move from g8 to f7.
- Target is not the opposing King.
- The destination is safe after the move.
- Frenzy is not active.

Resolution:

```txt
White Queen is removed.
Black King moves to f7.
Black Divinity: 3 -> 2.
Black King becomes committed.
```

This is a normal Divine Attack, not only a proposed check response, because the King legally moves to the checking piece.

---

## Turn 11

White:

```txt
Rook h1 -> e1+
```

Black King is committed and in check.

Rule:

```txt
Check response overrides Commitment.
```

Black response:

```txt
King f7 -> g8
```

Legal check response.

---

## Turn 12

Black later uses:

```txt
King g8 uses Divine Attack on Rook e8
```

Legality check:

- King cannot legally move from g8 to e8 because Kings move one square.
- Action is illegal.

Actual legal Divine Attack:

```txt
King g8 uses Divine Attack on Rook g7
```

Assume White Rook has moved to g7 and gives direct pressure.

Resolution:

```txt
White Rook is removed.
Black King moves to g7.
Black Divinity: 2 -> 1.
```

Overuse check:

```txt
Black used Divine Attack twice within 2 of Black's own turns.
Overuse Penalty applies.
Black loses 2 Divinity total for the aggressive sequence.
```

Final Divinity:

```txt
Black Divinity: 1 -> 0.
Black King becomes Thorn King.
```

System tested:

- Overuse Penalty.
- Thorn King reached.
- Demon King not reached.

---

# 6. Late Game

## Turn 13

White:

```txt
Bishop g5 attacks d8
```

Combat:

```txt
White Bishop vs Black Queen at 1 HP
```

Dirty Play failure check succeeds.

Rolls:

```txt
White Bishop AD: 4, 3, 1
Black Queen DD: 6, 2, 1
```

Resolution:

```txt
4 < 6 -> Bishop takes 1
3 > 2 -> Queen takes 1
1 = 1 -> either piece has HP 1, no tie damage
Dirty Play adds +1 damage to Queen because attack succeeded
```

Result:

```txt
Black Queen dies.
White Bishop dies.
```

White Last Will:

```txt
White Bishop died in combat.
Last Will triggers.
Black Queen is already dead, so no further board change.
```

Board:

```txt
d8 becomes empty.
```

---

# 7. Frenzy Phase

Timer:

```txt
1:00 remaining
Frenzy Phase triggered
```

Frenzy changes:

- HP becomes 1.
- Dirty Play is disabled.
- Cowardice is disabled.
- Fatigue is disabled.
- Last Will is disabled.
- Giant Slayer is disabled.
- Divine Attack is disabled.
- Captures are instant.

---

## Frenzy Sequence

White:

```txt
Rook e1 captures e7+
```

Black:

```txt
King g7 -> f6
```

White:

```txt
Bishop f4 -> g5+
```

Black:

```txt
King f6 -> g6
```

Time:

```txt
0:00
No checkmate.
Resolve time victory.
```

Material count:

```txt
White: Rook + Bishop + 4 Pawns = 12
Black: Rook + Knight + 3 Pawns = 11
```

Result:

```txt
White wins by material advantage.
```

---

# 8. Findings

## Dirty Play And Cowardice

The 20% probability cap is necessary.

Without the cap:

```txt
15% Cowardice + 10% Dirty Play = 25% failure chance
```

That would likely feel too punishing.

## Fatigue

Attack-range Fatigue avoided random board-wide punishment.

However, it triggered as a failure when no valid allied target existed.

This is clean, but it may make Fatigue weaker than expected.

## Divine Attack And Movement Legality

Repeated illegal Divine Attack attempts show an important documentation need:

```txt
Divine Attack is not ranged.
```

It should be described as a King move into a legal target square that removes the target without dice.

## Overuse Penalty

Overuse reached Thorn King but did not reach Corrupted or Demon King.

Finding:

```txt
Demon King is unlikely to occur in normal 10-minute play unless future effects push Divinity below 0.
```

Recommendation:

- Keep Demon King threshold as an open balance question.
- Test scenarios with King-focused cards or terrain before lowering the threshold.

## Time Victory

Time victory worked as a fallback, but it is less satisfying than checkmate.

Watch:

- If many games end by material count, combat may be too slow or Frenzy may be too short.

---

END
