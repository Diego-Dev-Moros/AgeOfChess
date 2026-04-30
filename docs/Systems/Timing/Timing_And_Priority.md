# Timing And Priority

---

# 1. Purpose

This document is the canonical timing reference for Age of Chess.

When another document describes turn order, combat order, card timing, terrain timing, death effects, or Frenzy timing, it should defer to this file.

Design goal:

```txt
One timing source of truth.
```

---

# 2. Related Documents

- [[Game_Design/Turn_System|Turn_System]]
- [[Systems/Combat/Combat_Flow|Combat_Flow]]
- [[Systems/Combat/Damage_Calculation|Damage_Calculation]]
- [[Systems/Combat/Dice_System|Dice_System]]
- [[Systems/King/King|King]]
- [[Systems/Cards/Buffs|Buffs]]
- [[Systems/Cards/Debuffs|Debuffs]]
- [[Systems/Terrain/Terrain|Terrain]]
- [[Systems/Time/Time_System|Time_System]]
- [[Systems/Frenzy/Frenzy_Phase|Frenzy_Phase]]
- [[Edge_Cases]]

---

# 3. Core Timing Principle

Age of Chess resolves actions in a fixed order:

1. Start of turn effects
2. Action declaration
3. Legal move validation
4. Pre-action failure checks
5. Movement or attack commitment
6. Pre-combat modifiers
7. Dice rolling
8. Dice comparison
9. Damage calculation
10. Damage modifiers
11. Damage application
12. Death effects
13. Board position resolution
14. Check and checkmate validation
15. End of turn cleanup
16. Timer and Frenzy checks

If a specific card, terrain, or system contradicts this order, the specific rule must explicitly say so.

---

# 4. Start Of Turn Effects

At the start of a player's turn:

1. Confirm whether the game is in Frenzy Phase.
2. Check ongoing restrictions, such as King Commitment.
3. Check effects that explicitly trigger at start of turn.
4. Confirm whether the player is currently in check.

If the player is in check:

- The player must make a legal check response.
- Check response has priority over King Commitment.

See [[Systems/King/King|King]] and [[Edge_Cases]].

---

# 5. Action Declaration

The active player declares one action:

- Move one piece.
- Attack by moving into an occupied enemy square.
- Use King Divine Attack, if legal and available.

Normal combat is only used for non-King pieces fighting non-King pieces.

---

# 6. Legal Move Validation

Before resolving an action, validate that:

- The piece follows classical chess movement.
- The move does not leave the acting player's King in check.
- The target is legal for the selected piece.
- The action is legal under Frenzy rules, if Frenzy is active.
- The King is not blocked by Commitment unless the move is a legal check response.

Illegal actions are not resolved.

---

# 7. Pre-Action Failure Checks

Some effects can cause an attempted attack to fail before movement into the occupied square.

Examples:

- Cowardice
- Dirty Play
- Fatigue, if it redirects or fails the attack

If an attack fails before combat:

- No dice are rolled.
- No combat occurs.
- No damage is dealt.
- The attacker remains in its original square.
- The player's turn is consumed.

See [[Systems/Cards/Debuffs/Cowardice|Cowardice]], [[Systems/Terrain/Dirty_Play|Dirty_Play]], [[Systems/Cards/Debuffs/Fatigue|Fatigue]], and [[Edge_Cases]].

---

# 8. Movement Or Attack Commitment

If the action is a normal move into an empty square:

- Move the piece.
- Skip combat timing.
- Proceed to check validation.

If the action is a normal attack:

- The attacker attempts to enter an enemy-occupied square.
- If no pre-action failure occurs, normal combat begins.

If the action is a Divine Attack:

- Resolve Divine Attack rules instead of normal combat.
- Do not roll dice.
- Do not apply normal combat damage.

---

# 9. Pre-Combat Modifiers

Before dice are rolled, apply effects that change:

- Attack Dice
- Defense Dice
- HP values already active at match start
- Failure chance
- Redirection rules
- Target validity

Examples:

- Iron Age changes defending dice.
- Immoral changes attacking dice.
- Equal Conditions can cap dice difference.
- Crystal Pieces changes starting HP.

---

# 10. Dice Rolling

If normal combat proceeds:

1. The attacker rolls Attack Dice.
2. The defender rolls Defense Dice.
3. Dice are sorted from highest to lowest.
4. Only the top 3 dice from each side are used.
5. Existing dice are paired highest to highest.

Unpaired dice are ignored unless a specific rule says otherwise.

---

# 11. Dice Comparison

For each dice pair:

- Attacker die higher: defender takes 1 damage.
- Defender die higher: attacker takes 1 damage.
- Tie: use the Tie Rule.

Tie Rule:

- If both pieces have HP 2 or higher, both take 1 damage.
- If either piece has HP 1, the tie deals no damage.

---

# 12. Damage Calculation

Damage is calculated before it is applied.

Base damage sources:

- Dice comparison damage
- Tie damage
- Momentum damage
- Minimum Damage Rule
- Anti-Stall damage

Modifier sources:

- Buffs
- Debuffs
- Terrain
- King corruption effects

See [[Systems/Combat/Damage_Calculation|Damage_Calculation]].

---

# 13. Damage Modifier Priority

Use this modifier order:

1. Determine base comparison and tie damage.
2. Apply Momentum if the attacker won every comparison.
3. Apply Minimum Damage Rule if total combat damage is 0.
4. Apply damage-floor effects such as Stone Pieces.
5. Apply damage bonuses such as Giant Slayer, Will, or Dirty Play.
6. Apply damage reductions such as Hell.
7. Apply Anti-Stall damage.
8. Apply final damage simultaneously.

Global caps still apply.

---

# 14. Death Effects

After damage is applied:

1. Check which pieces have HP 0 or lower.
2. Mark dead pieces.
3. Resolve death effects.
4. Re-check deaths caused by death effects.

Example:

- Last Will triggers after a piece dies in normal combat.
- If Last Will kills the attacker, the attacker is removed and the target square becomes empty.

See [[Systems/Cards/Buffs/Last_Will|Last_Will]] and [[Edge_Cases]].

---

# 15. Board Position Resolution

After combat and death effects:

| Final State | Board Result |
| --- | --- |
| Defender dies, attacker survives | Attacker occupies the target square |
| Attacker dies, defender survives | Defender remains in the target square |
| Both survive | Defender remains, attacker returns to original square |
| Both die | Target square becomes empty |
| Attack failed before combat | Attacker remains in original square |
| Defender dies, attacker later dies from Last Will | Target square becomes empty |

---

# 16. Check And Checkmate Validation

After board position is finalized:

1. Check whether either King is in check.
2. Confirm the acting player did not leave their own King in check.
3. Determine whether checkmate has occurred.
4. Determine whether stalemate or another draw condition applies.

Checkmate remains the primary win condition.

---

# 17. End Of Turn Cleanup

At end of turn:

- Record whether the King used Divine Attack.
- Update Divinity recovery counters.
- Update anti-stall tracking.
- Reveal any card that activated.
- Remove expired temporary effects.
- Check timer state.

Divinity recovery uses the player's own turns:

```txt
After 3 of that player's own turns without Divine Attack, recover +1 Divinity, up to 3.
```

---

# 18. Frenzy Timing

Frenzy begins immediately when the match timer reaches 1:00 remaining.

When Frenzy begins:

- Set all non-King pieces to 1 HP.
- Do not treat this as damage.
- Do not trigger death effects.
- Disable dice.
- Disable normal combat.
- Disable combat-related buffs, debuffs, and terrain.
- Disable Divine Attack by default.
- Use classical chess capture logic.

See [[Systems/Frenzy/Frenzy_Phase|Frenzy_Phase]].

---

# 19. Time Expiration

If time expires during a declared action:

1. Finish resolving the current action.
2. Resolve damage, death effects, and board position.
3. Validate check and checkmate.
4. Then resolve time victory rules.

Time does not interrupt combat once combat has begun.

---

# 20. Open Timing Questions

The following are unresolved and should not be treated as final rules:

- Whether Divine Attack as a check response becomes official.
- Whether future special cards should support manual activation.
- Whether Fatigue 3x3 adjacent targeting becomes final.
- Whether Demon King begins below -3 or at -3 after balance testing.

---

END
