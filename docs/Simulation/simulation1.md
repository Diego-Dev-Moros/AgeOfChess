# Simulation 1

---

# 1. Simulation Type

Balanced system validation.

Purpose:

- Test normal combat flow.
- Test hidden card reveal timing.
- Test Stone Pieces with Minimum Damage.
- Test Cowardice failed attack positioning.
- Test King Commitment.
- Reach Frenzy and resolve by checkmate.

Related references:

- [[Simulation/simulations_guide|simulations_guide]]
- [[Systems/Timing/Timing_And_Priority|Timing_And_Priority]]
- [[Systems/Combat/Combat_Flow|Combat_Flow]]
- [[Systems/Combat/Damage_Calculation|Damage_Calculation]]
- [[Systems/Cards/Cards_System|Cards System Reference]]
- [[Systems/Frenzy/Frenzy_Phase|Frenzy_Phase]]

---

# 2. Setup

| Element | White | Black |
| --- | --- | --- |
| Buff | Stone Pieces | Iron Age |
| Debuff applied to opponent | Cowardice | Crystal Pieces |
| Starting Divinity | 3 | 3 |

Terrain:

```txt
Equal Conditions
```

Card visibility:

- Terrain is public before the match.
- Cards are secretly active from match start.
- Cards reveal when their effect changes a public outcome.
- Crystal Pieces reveals at setup because HP changes are public.

Crystal Pieces effect:

- White non-pawn pieces have -1 HP, minimum 1.

---

# 3. Early Game

## Turn 1

White:

```txt
Pawn e2 -> e4
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
Pawn e4 attacks d5
```

Combat:

```txt
White Pawn vs Black Pawn
```

Rolls:

```txt
White Pawn AD: 3, 1
Black Pawn DD: 3
```

Resolution:

```txt
3 = 3 -> Tie
Either piece has HP 1 -> no tie damage
Total damage = 0
Minimum Damage Rule triggers
Both pieces deal 1 damage
```

Card reveal:

```txt
White reveals Stone Pieces.
White Pawn's combat damage floor becomes 2.
```

Final damage:

```txt
Black Pawn takes 2 damage and dies.
White Pawn takes 1 damage and dies.
```

Result:

```txt
Both pawns are removed.
d5 becomes empty.
```

System tested:

- Minimum Damage Rule.
- Stone Pieces + Minimum Damage.
- Simultaneous death.

---

## Turn 3

Black:

```txt
Knight g8 -> f6
```

White:

```txt
Knight g1 -> f3
```

No combat.

---

# 4. Mid Game

## Turn 4

Black:

```txt
Knight f6 attacks e4
```

Target square is empty.

Move is legal.

No combat.

---

## Turn 5

White:

```txt
Bishop f1 attacks c4
```

No combat.

Black:

```txt
Knight e4 attacks c3
```

Combat:

```txt
Black Knight vs White Knight
```

Pre-combat:

- White Knight is affected by Crystal Pieces.
- White Knight HP is 1 instead of 2.

Rolls:

```txt
Black Knight AD: 6, 4, 2
White Knight DD: 5, 3
```

Resolution:

```txt
6 > 5 -> White Knight takes 1
4 > 3 -> White Knight takes 1
Black wins all comparisons -> Momentum +1
```

Final damage:

```txt
White Knight takes 3 damage.
Black Knight takes 0 damage.
```

Result:

```txt
White Knight dies.
Black Knight occupies c3.
```

System tested:

- Crystal Pieces.
- Momentum.
- High-value pressure against reduced HP.

---

## Turn 6

White:

```txt
Bishop c4 attacks f7
```

Combat:

```txt
White Bishop vs Black Pawn
```

Pre-combat:

- White is affected by Crystal Pieces, but the Bishop is attacking and still has enough HP.
- Equal Conditions caps dice difference.
- Bishop AD 3 vs Pawn DD 1 would differ by 2.
- Equal Conditions allows Bishop to use 2 dice.

Rolls:

```txt
White Bishop AD used: 5, 2
Black Pawn DD: 4
```

Resolution:

```txt
5 > 4 -> Black Pawn takes 1
Unpaired die ignored
White wins all comparisons -> Momentum +1
Stone Pieces raises White's damage floor, but total is already 2.
```

Final damage:

```txt
Black Pawn takes 2 damage and dies.
White Bishop takes 0 damage.
```

Result:

```txt
White Bishop occupies f7.
Black King is now in check.
```

System tested:

- Equal Conditions.
- Momentum with reduced dice.
- Stone Pieces reveal remains relevant but does not over-stack.

---

## Turn 7

Black:

```txt
King e8 uses Divine Attack on Bishop f7
```

Legality:

- King has 3 Divinity.
- King can legally move to f7.
- Target is not the opposing King.
- Frenzy is not active.

Resolution:

```txt
White Bishop is removed instantly.
Black King moves to f7.
Black Divinity: 3 -> 2.
Black King becomes committed.
```

System tested:

- Divine Attack.
- Check response by normal King capture logic, not the proposed ranged escape rule.
- Commitment begins.

---

## Turn 8

White:

```txt
Queen d1 -> h5+
```

Black King is in check while committed.

Rule:

```txt
Check response has priority over Commitment.
```

Black response:

```txt
King f7 -> g8
```

Result:

- Move is legal.
- Commitment does not prevent check response.

System tested:

- Commitment while in check.

---

# 5. Late Game

## Turn 9

White:

```txt
Rook h1 attacks h7
```

Before combat:

```txt
Cowardice check affects Black pieces only.
No failure check for White.
```

Combat:

```txt
White Rook vs Black Pawn
```

Equal Conditions:

- Rook AD 4 vs Pawn DD 1.
- Difference capped to 1.
- Rook uses 2 dice.

Rolls:

```txt
White Rook AD used: 6, 5
Black Pawn DD: 2
```

Resolution:

```txt
6 > 2 -> Black Pawn takes 1
White wins all comparisons -> Momentum +1
Stone Pieces keeps minimum at 2, no extra because total is already 2.
```

Result:

```txt
Black Pawn dies.
White Rook occupies h7.
```

---

## Turn 10

Black:

```txt
Queen d8 attacks h4
```

Pre-action:

```txt
Black is affected by Cowardice.
Cowardice check fails.
```

Result:

```txt
No dice are rolled.
No combat occurs.
Black Queen remains on d8.
Black turn is consumed.
Cowardice is revealed.
```

System tested:

- Failed attack positioning.
- Hidden Debuff reveal.

---

# 6. Frenzy Phase

Timer:

```txt
1:00 remaining
Frenzy Phase triggered
```

Frenzy changes:

- All non-King pieces HP become 1.
- Dice are disabled.
- Normal combat is disabled.
- Stone Pieces, Iron Age, Crystal Pieces, Cowardice, and Equal Conditions are disabled.
- Divine Attack is disabled by default.
- Captures become instant.

---

## Frenzy Sequence

White:

```txt
Rook h7 captures g7
```

Instant capture.

Black:

```txt
King g8 -> f8
```

White:

```txt
Queen h5 -> f7#
```

Checkmate:

- Black King is in check.
- No legal King move escapes.
- No Divine Attack is available during Frenzy.
- No combat roll occurs.

Result:

```txt
White wins by checkmate.
```

---

# 7. Findings

## Stone Pieces

Stone Pieces strongly improves early combat reliability.

In this simulation it made a pawn trade more lethal by raising Minimum Damage Rule output from 1 to 2.

Balance concern:

- This is readable.
- It may make pawn trades too efficient if repeated often.

## Equal Conditions

Equal Conditions successfully reduced extreme dice gaps.

The Rook and Bishop still won favorable combats, but they did not overwhelm pawns through full dice volume.

## Cowardice

Cowardice created a clear failed attack case.

The attacker staying in the original square was easy to understand and avoided board ambiguity.

## King Commitment

Commitment worked as intended when not in check.

The override rule for check response prevented an illegal state.

---

# 8. Open Questions Raised

- Is Stone Pieces too efficient when it upgrades Minimum Damage Rule damage?
- Should Crystal Pieces reveal immediately because HP is public?
- Does Equal Conditions make high-value pieces feel too restrained?

---

END
