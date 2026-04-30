# Simulation 2

---

# 1. Simulation Type

King and card interaction test.

Purpose:

- Test Divine Attack pressure.
- Analyze Divine Attack as a proposed check response.
- Test Fatigue using the recommended adjacent 3x3 targeting rule.
- Test Last Will board occupation.
- Test Holy Ground death triggers.
- Reach Frenzy and resolve by checkmate.

Related references:

- [[Simulation/simulations_guide|simulations_guide]]
- [[Systems/King/King|King]]
- [[Edge_Cases]]
- [[Systems/Cards/Debuffs/Fatigue|Fatigue]]
- [[Systems/Cards/Buffs/Last_Will|Last_Will]]
- [[Systems/Terrain/Holy_Ground|Holy_Ground]]
- [[Systems/Timing/Timing_And_Priority|Timing_And_Priority]]

---

# 2. Setup

| Element | White | Black |
| --- | --- | --- |
| Buff | Giant Slayer | Last Will |
| Debuff applied to opponent | Fatigue | Immoral |
| Starting Divinity | 3 | 3 |

Terrain:

```txt
Holy Ground
```

Public / hidden information:

- Holy Ground is public before the match.
- Cards are secretly active from match start.
- Cards reveal when their effect changes a public outcome.

Fatigue test rule:

```txt
Valid allied target = allied non-King piece inside the 3x3 area centered on the attacker.
```

---

# 3. Early Game

## Turn 1

White:

```txt
Pawn e2 -> e4
```

Black:

```txt
Pawn e7 -> e5
```

No combat.

---

## Turn 2

White:

```txt
Knight g1 -> f3
```

Black:

```txt
Knight b8 -> c6
```

No combat.

---

## Turn 3

White:

```txt
Bishop f1 -> b5
```

Black:

```txt
Pawn a7 -> a6
```

White Bishop is attacked by pawn pressure but no combat occurs.

---

# 4. Mid Game

## Turn 4

White:

```txt
Bishop b5 attacks c6
```

Combat:

```txt
White Bishop vs Black Knight
```

Pre-combat:

- White is affected by Immoral.
- White Bishop attacks using Defense Dice instead of Attack Dice.
- Bishop attacks with 2 dice instead of 3.

Card reveal:

```txt
Black reveals Immoral.
```

Rolls:

```txt
White Bishop AD modified: 5, 2
Black Knight DD: 4, 3
```

Resolution:

```txt
5 > 4 -> Black Knight takes 1
2 < 3 -> White Bishop takes 1
```

Result:

```txt
Black Knight HP 2 -> 1.
White Bishop HP 2 -> 1.
Both survive.
White Bishop returns to b5.
```

System tested:

- Immoral.
- Both-survive board resolution.

---

## Turn 5

Black:

```txt
Knight c6 attacks b4
```

No combat.

White:

```txt
Pawn a2 attacks b3
```

No combat.

---

## Turn 6

Black:

```txt
Knight b4 attacks c2
```

Pre-action:

- Black is affected by Fatigue.
- Fatigue check triggers and succeeds.
- Valid allied target check from Knight b4:
  - No allied non-King piece is adjacent in the 3x3 area centered on b4.
- No valid allied non-King target exists.

Result:

```txt
Attack fails.
Black Knight remains on b4.
Black turn is consumed.
White reveals Fatigue.
```

System tested:

- Fatigue failed attack case.
- Recommended targeting rule avoids random global friendly fire.

---

## Turn 7

White:

```txt
Pawn c2 attacks b3
```

No combat.

Black:

```txt
Knight b4 attacks d3
```

Pre-action:

- Fatigue check triggers and succeeds again for test coverage.
- Valid allied target from b4:
  - Black Pawn c5 is adjacent to b4 inside the 3x3 area.

Fatigue redirection:

```txt
Black Knight's attack redirects to Black Pawn c5.
```

Combat:

```txt
Black Knight vs Black Pawn
```

This is friendly combat caused by Fatigue.

Rolls:

```txt
Knight AD: 6, 3, 1
Pawn DD: 4
```

Resolution:

```txt
6 > 4 -> Pawn takes 1
Knight wins all comparisons -> Momentum +1
```

Result:

```txt
Black Pawn dies.
Black Knight remains on b4 because the original enemy attack was redirected before movement.
```

Holy Ground:

```txt
Black first allied death triggers Holy Ground.
Remaining Black non-King pieces gain +1 HP.
```

System tested:

- Fatigue adjacent 3x3 targeting.
- Friendly death.
- Holy Ground trigger.

---

# 5. King Pressure Sequence

## Turn 8

White:

```txt
Queen d1 -> h5+
```

Black King is in check.

Official response used:

```txt
Pawn g7 -> g6
```

The check is blocked.

Proposed rule analysis:

Black could not use Divine Attack here because:

- The checking Queen on h5 is not legally reachable by the King from e8.
- The proposed rule requires the King to legally move to the target square.

Conclusion:

```txt
The proposed Divine Attack check response would not solve this check.
```

---

## Turn 9

Black:

```txt
King e8 uses Divine Attack on White Bishop b5
```

Legality:

- This is not legal under current Divine Attack movement requirements because the King cannot legally move from e8 to b5.

Correction:

```txt
Black does not perform this action.
```

Simulation note:

- Divine Attack must stay movement-legal to avoid becoming a ranged removal tool.

Actual move:

```txt
King e8 -> f7
```

No Divine Attack.

---

## Turn 10

White:

```txt
Knight f3 attacks e5
```

Combat:

```txt
White Knight vs Black Pawn
```

Pre-combat:

- White has Giant Slayer.
- Pawn is lower value than Knight, so Giant Slayer does not apply.
- White is affected by Immoral and attacks with Defense Dice.

Rolls:

```txt
White Knight AD modified: 5, 2
Black Pawn DD: 3
```

Resolution:

```txt
5 > 3 -> Black Pawn takes 1
White wins all comparisons -> Momentum +1
```

Result:

```txt
Black Pawn dies.
White Knight occupies e5.
```

Holy Ground:

```txt
Black second allied death triggers Holy Ground.
Remaining Black non-King pieces gain +1 HP.
```

---

## Turn 11

Black:

```txt
Rook a8 attacks e8
```

No combat. Repositioning.

White:

```txt
Knight e5 attacks g6
```

Combat:

```txt
White Knight vs Black Pawn
```

Black has Last Will.

Rolls:

```txt
White Knight AD modified by Immoral: 6, 4
Black Pawn DD: 5
```

Resolution:

```txt
6 > 5 -> Black Pawn takes 1
White wins all comparisons -> Momentum +1
```

Result before Last Will:

```txt
Black Pawn dies.
White Knight would occupy g6.
```

Card reveal:

```txt
Black reveals Last Will.
```

Last Will:

```txt
White Knight takes 2 damage.
White Knight dies.
```

Final board:

```txt
Black Pawn removed.
White Knight removed.
g6 becomes empty.
```

Holy Ground:

```txt
Black third allied death triggers Holy Ground.
Remaining Black non-King pieces gain +1 HP.
```

System tested:

- Last Will killing attacker.
- Target square ends empty.
- Holy Ground third trigger.

---

# 6. Divine Attack Check Response Analysis

This simulation shows why Divine Attack as a check response should stay proposed.

If Divine Attack could remove any checking piece without movement legality:

- Long-range checks would become much weaker.
- Queen, rook, and bishop pressure against the King would lose strategic value.
- Divinity would become a universal emergency shield.

The proposed rule avoids this by requiring:

- Divinity greater than 0.
- The target must be the checking piece.
- The King must be able to legally move to the target square.
- The King must not end in check.
- The target cannot be the opposing King.
- Frenzy must not be active.

Design conclusion:

```txt
The proposal is safe only if Divine Attack remains movement-legal.
```

Recommended status:

```txt
Keep proposed. Test again before adding to official rules.
```

---

# 7. Frenzy Phase

Timer:

```txt
1:00 remaining
Frenzy Phase triggered
```

Frenzy changes:

- HP becomes 1 for all non-King pieces.
- Holy Ground stops affecting combat-relevant HP.
- Last Will is disabled.
- Fatigue and Immoral are disabled.
- Divine Attack is disabled by default.
- Captures are instant.

---

## Frenzy Sequence

White:

```txt
Queen h5 captures g6+
```

Black:

```txt
King f7 -> g8
```

White:

```txt
Queen g6 -> f7#
```

Result:

```txt
White wins by checkmate.
```

---

# 8. Findings

## Fatigue

Fatigue worked better with adjacent 3x3 targeting than with global random targeting.

Benefits:

- The player can understand why the allied target was eligible.
- Positioning matters.
- Crowded formations are punished directly.
- Long-range pieces do not create large hidden danger zones.

Concern:

- It may trigger less often than full attack-range targeting.
- It mostly punishes clustering near the attacker, not all bad attack lanes.

Recommendation:

```txt
Keep testing adjacent 3x3 Fatigue as the primary option.
```

## Divine Attack As Check Response

The proposed rule did not break the simulation because it failed when the target was not legally reachable.

This is the key safety condition.

## Last Will

The target square ending empty after Last Will killed the attacker was clear and consistent.

## Holy Ground

Holy Ground can become very strong if friendly-fire deaths count.

Open balance question:

- Should Fatigue-caused allied deaths trigger Holy Ground?

---

END
