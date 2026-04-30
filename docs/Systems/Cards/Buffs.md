# Buffs

---

# 1. Overview

Buffs are positive card effects applied to the player who owns them.

They are designed to create asymmetry between players while still preserving the core rules of Age of Chess.

A Buff should not replace strategy.
A Buff should modify how a player thinks, attacks, defends, trades, or positions pieces.

---

# 2. Purpose of Buff Cards

Buffs exist to:

- Create different playstyles
- Encourage strategic adaptation
- Make each match feel different
- Give players identity through modifiers
- Improve replayability
- Support weaker or riskier strategies

---

# 3. Core Buff Rules

At the start of a match:

- Each player receives 1 Buff card.
- Buffs affect all allied pieces unless the card says otherwise.
- Buffs do not stack.
- A player cannot have duplicate Buff effects.

Card visibility follows the current card activation rule.

Current rule:

- Buffs are secretly active from match start.
- A Buff is revealed when its effect changes a game outcome or must be checked publicly.
- After reveal, the Buff remains known.

See [[Systems/Cards/Cards_System|Cards System Reference]] and [[Edge_Cases]].

---

# 4. Buff Design Limits

Buffs must follow strict limits to avoid breaking the game.

A Buff must NOT:

- Give automatic victory
- Remove all risk from combat
- Make a piece invincible
- Create infinite scaling
- Fully bypass the dice system
- Affect Frenzy Phase unless explicitly stated

---

# 5. Global Balance Constraints

Buffs must respect these limits:

| Constraint        | Limit                        |
| ----------------- | ---------------------------- |
| Bonus damage      | Max +2                       |
| Extra probability | Max 20%                      |
| HP increase       | Must be bounded              |
| Dice increase     | Must respect Top 3 Dice Rule |
| Stacking          | Not allowed                  |

---

# 6. When Buffs Apply

Buffs are checked according to [[Timing_And_Priority]].

General timing:

1. A piece declares an attack.
2. Combat begins.
3. Relevant Buffs are checked.
4. Dice are rolled.
5. Damage is calculated.
6. Buff effects are applied.
7. Death and board position are resolved.

Some Buffs modify pre-combat dice, while others modify damage or death effects.

---

# 7. Buff Categories

Buffs can belong to one or more design categories.

---

## 7.1 Aggressive Buffs

These Buffs increase offensive pressure.

Examples:

- Bonus damage
- Stronger attacks against specific targets
- Improved minimum damage

---

## 7.2 Defensive Buffs

These Buffs increase survivability or defensive reliability.

Examples:

- More defense dice
- Retaliation when attacked
- Reduced incoming damage

---

## 7.3 Tactical Buffs

These Buffs change how players choose targets or position pieces.

Examples:

- Bonus against stronger pieces
- Bonus when outnumbered
- Bonus when attacking from certain positions

---

## 7.4 Tempo Buffs

These Buffs affect timing and pressure.

Examples:

- Benefits for delaying attacks
- Rewards for consecutive turns without combat
- Effects tied to King Divinity usage

---

# 8. Current Buff Cards

Current Buff cards:

- [[Giant_Slayer]]
- [[Stone_Pieces]]
- [[Iron_Age]]
- [[Last_Will]]

Important current clarification:

- Stone Pieces raises its owner's combat damage floor to 2 when that piece deals combat damage.
- This can include damage created by the Minimum Damage Rule.
- See [[Stone_Pieces]] and [[Edge_Cases]].

---

# 9. How to Create a New Buff Card

A new Buff card should be created using the following structure:

```md
# Card Name

---

# 1. Card Type

Buff

---

# 2. Category

Aggressive / Defensive / Tactical / Tempo / Hybrid

---

# 3. Effect

Describe the exact gameplay effect.

---

# 4. Trigger

When does the effect activate?

Examples:
- When attacking
- When defending
- When a piece dies
- At the start of the turn
- During combat resolution

---

# 5. Target

Who is affected?

Examples:
- All allied pieces
- Pawns only
- Minor pieces only
- One selected piece
- Pieces in a specific board area

---

# 6. Duration

How long does it last?

Default:
- Entire match

Other options:
- One turn
- Until triggered
- Until Frenzy
- Limited number of uses

---

# 7. Restrictions

Define what the card cannot do.

Examples:
- Does not affect the King
- Does not apply during Frenzy
- Cannot stack with other damage bonuses

---

# 8. Design Intent

Explain why the card exists.

---

# 9. Balance Notes

Explain risks, possible abuse cases, and tuning knobs.
```

---

# 10. Buff Design Checklist

Before adding a new Buff, answer:

- Does it change player decisions?
- Does it create counterplay?
- Is the effect bounded?
- Does it avoid infinite scaling?
- Does it respect the Top 3 Dice Rule?
- Does it avoid breaking Frenzy?
- Does it avoid making one piece type obsolete?
- Can the opponent adapt?

If the answer to any of these is “no”, the Buff should be redesigned.

---

# 11. Buff Interaction with Frenzy

Default rule:

- Buffs do not affect Frenzy Phase.

Reason:

Frenzy is intended to remove randomness and resolve the match through pure chess logic.

A Buff may affect Frenzy only if explicitly designed for that mode.

---

# 12. Buff Interaction with the King

Default rule:

- Buffs do not affect the King.
- Buffs do not modify Divine Attack.
- Buffs do not change Divinity.

King-related Buffs may exist in the future, but they must be handled with extra balance restrictions.

---

# 13. Design Philosophy

A good Buff should feel powerful but fair.

It should make the player think:

> “How can I use this advantage well?”

Not:

> “This wins the game automatically.”

---

END
