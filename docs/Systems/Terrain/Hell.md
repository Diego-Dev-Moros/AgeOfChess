# Hell

---

# 1. Terrain Type

Attrition

---

# 2. Effect

For each team, the first 3 allied piece deaths apply:

```txt
All remaining allied non-King pieces deal -1 damage.
```

This represents army morale and effectiveness collapsing as pieces die.

Each team tracks its own Hell triggers separately.

---

# 3. Trigger

Triggers when an allied non-King piece dies.

---

# 4. Affected Pieces

All remaining allied non-King pieces of the player whose piece died.

---

# 5. Duration

Damage reduction lasts until Frenzy begins.

The effect can trigger up to:

```txt
3 times per team
```

---

# 6. Restrictions

- Does not affect the King.
- Does not trigger during Frenzy.
- Cannot reduce damage below 1 when a piece successfully deals damage.
- Does not affect Divine Attack.
- Does not revive or restore pieces.
- Does not apply after the 3-trigger limit is reached.

---

# 7. Design Intent

Hell makes death costly beyond material loss.

It creates a brutal battlefield where losing pieces weakens the entire army’s offensive potential.

The goal is to discourage careless trades and make each death feel strategically painful.

---

# 8. Strategic Impact

This Terrain encourages:

- Careful piece preservation
- Avoiding unnecessary trades
- Defensive positioning
- Targeting weak enemy pieces to reduce enemy damage output
- Faster attempts at checkmate before damage reductions accumulate

---

# 9. Counterplay

Players can adapt by:

- Avoiding early sacrifices
- Using the King’s Divine Attack strategically
- Playing for positional check threats instead of material trades
- Waiting for Frenzy, where terrain damage effects no longer matter
- Using Buffs that improve damage consistency

---

# 10. Example

```txt
Black Knight dies.

Black has used 0 Hell triggers.

Hell triggers:
All remaining Black non-King pieces deal -1 damage.

Black Hell triggers used:
1 / 3
```

---

# 11. Damage Floor

Hell cannot reduce successful damage below:

```txt
1 damage
```

Example:

```txt
A piece would deal 1 damage.
Hell applies -1 damage.

Final damage is still 1.
```

This prevents Hell from making combat meaningless.

---

# 12. Multiple Deaths in One Combat

If multiple allied pieces die at the same time:

- Hell may trigger once per death.
- The 3-trigger limit still applies.
- Dead pieces do not receive the penalty because they are removed.

---

# 13. Interaction with Buffs

Hell can be partially offset by damage Buffs.

Examples:

- Stone Pieces can help preserve minimum damage.
- Giant Slayer can still threaten stronger pieces.
- Last Will still deals its fixed retaliation damage unless adjusted.

---

# 14. Interaction with Debuffs

Hell combines strongly with Debuffs that increase death frequency.

Examples:

- Crystal Pieces makes Hell triggers occur faster.
- Fatigue can accidentally cause allied deaths, triggering Hell.
- Cowardice may slow combat and delay Hell triggers.

---

# 15. Interaction with Frenzy

During Frenzy:

- Dice combat is disabled.
- Damage calculation is disabled.
- Hell no longer applies.

---

# 16. Balance Notes

Risk:

- Can make losing players weaker and create a downward spiral.

Controls:

- Limited to 3 triggers per team.
- Damage cannot drop below 1.
- Does not affect the King.
- Disabled during Frenzy.

---

END
