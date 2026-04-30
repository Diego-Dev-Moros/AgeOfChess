# Terrain System

---

# 1. Overview

The Terrain System defines the global battlefield condition of an Age of Chess match.

Unlike Buffs and Debuffs, which create player-specific asymmetry, Terrain affects both players at the same time.

A Terrain should not feel like a random bonus.
A Terrain should define the identity, tempo, and risk profile of the match.

---

# 2. Purpose of Terrain

Terrain exists to:

- Change the strategic environment of the match
- Modify how players value combat and positioning
- Create replayability between games
- Influence the pace of the match
- Make each match feel mechanically distinct
- Add a global layer of adaptation

---

# 3. Core Terrain Rules

At the start of the match:

- 1 Terrain is selected.
- The Terrain is global.
- The Terrain affects both players equally.
- The Terrain remains active for the entire match unless stated otherwise.
- Only 1 Terrain can be active at a time.
- Terrain is public and known before the match begins.
- Terrain is not hidden like cards.

---

# 4. Terrain vs Cards

Terrain is different from cards.

## Cards

- Affect one player or the opponent
- Create asymmetry
- Define player identity

## Terrain

- Affects both players
- Creates match identity
- Changes the rules of the battlefield

---

# 5. Terrain Design Limits

Terrain effects must be carefully bounded.

A Terrain must NOT:

- Create infinite scaling
- Guarantee victory
- Remove player agency
- Fully override the combat system
- Break the King system
- Make checkmate impossible
- Disable Frenzy Phase
- Permanently stack without limit

---

# 6. Global Balance Constraints

| Constraint           | Limit                             |
| -------------------- | --------------------------------- |
| Global HP increase   | Must be bounded                   |
| Global damage change | Must be bounded                   |
| Failure probability  | Max 20%                           |
| Number of triggers   | Should be limited when scaling    |
| Stacking             | Not infinite                      |
| Frenzy interaction   | Disabled unless explicitly stated |

---

# 7. When Terrain Applies

Terrain effects are checked during the Terrain step of the turn or whenever their trigger condition occurs.

Common terrain triggers include:

- Start of match
- Start of turn
- A piece dies
- Combat begins
- Damage is calculated
- Frenzy Phase begins

---

# 8. Terrain Timing

General timing:

1. Match begins.
2. Terrain is selected.
3. Terrain applies its initial effects, if any.
4. During the match, Terrain triggers when its conditions are met.
5. Terrain effects stop affecting combat during Frenzy unless explicitly stated.

---

# 9. Terrain Categories

Terrains can belong to one or more categories.

---

## 9.1 Equalizing Terrain

Reduces the gap between strong and weak pieces.

Example:

- [[Systems/Terrain/Equal_Conditions|Equal_Conditions]]

---

## 9.2 Recovery Terrain

Rewards survival, sacrifice, or death-based momentum.

Example:

- [[Systems/Terrain/Holy_Ground|Holy_Ground]]

---

## 9.3 Attrition Terrain

Punishes prolonged fighting or repeated deaths.

Example:

- [[Systems/Terrain/Hell|Hell]]

---

## 9.4 Scaling Terrain

Improves all pieces globally.

Example:

- [[Systems/Terrain/Will|Will]]

---

## 9.5 Chaos Terrain

Adds risk, volatility, or uncertainty to combat.

Example:

- [[Systems/Terrain/Dirty_Play|Dirty_Play]]

---

# 10. Current Terrain List

Current Terrain effects:

- [[Systems/Terrain/Equal_Conditions|Equal_Conditions]]
- [[Systems/Terrain/Holy_Ground|Holy_Ground]]
- [[Systems/Terrain/Hell|Hell]]
- [[Systems/Terrain/Will|Will]]
- [[Systems/Terrain/Dirty_Play|Dirty_Play]]

---

# 11. How to Create a New Terrain

A new Terrain should use the following structure:

```md
# Terrain Name

---

# 1. Terrain Type

Equalizing / Recovery / Attrition / Scaling / Chaos / Hybrid

---

# 2. Effect

Describe the exact global effect.

---

# 3. Trigger

When does the Terrain activate?

Examples:
- At match start
- When combat begins
- When a piece dies
- At the start of each turn
- When Frenzy begins

---

# 4. Affected Pieces

Who is affected?

Examples:
- All pieces
- All non-King pieces
- Only pieces in combat
- Pieces in specific board zones
- Pieces below a certain HP threshold

---

# 5. Duration

How long does it last?

Examples:
- Entire match
- Until triggered 3 times
- Until Frenzy
- One turn after trigger

---

# 6. Restrictions

Define limits.

Examples:
- Does not affect the King
- Does not apply during Frenzy
- Cannot stack beyond X
- Cannot reduce HP below 1
- Cannot increase damage above +X

---

# 7. Design Intent

Explain why the Terrain exists.

---

# 8. Strategic Impact

Explain how it changes player behavior.

---

# 9. Counterplay

Explain how players can adapt.

---

# 10. Balance Notes

Explain risks, abuse cases, and tuning knobs.
```

---

# 12. Terrain Design Checklist

Before adding a new Terrain, answer:

- Does it affect both players equally?
- Does it change player decisions?
- Does it avoid infinite scaling?
- Does it preserve checkmate as the win condition?
- Does it preserve Frenzy Phase?
- Does it avoid making combat meaningless?
- Does it create counterplay?
- Does it avoid making one strategy always correct?
- Can both players understand its impact quickly?

If the answer to any of these is “no”, the Terrain should be redesigned.

---

# 13. Terrain Interaction with Combat

Terrain can modify:

- Dice availability
- Damage output
- HP values
- Failure chance
- Trade value
- Combat tempo

Terrain should never make combat impossible.

---

# 14. Terrain Interaction with the King

Default rule:

- Terrain does not affect the King directly.
- Terrain does not modify Divinity.
- Terrain does not change Divine Attack.
- Terrain cannot prevent checkmate.

Future King-specific terrains may exist, but they require strict balance review.

---

# 15. Terrain Interaction with Frenzy

Default rule:

- Terrain does not affect Frenzy Phase unless explicitly stated.

Reason:

Frenzy is designed to remove randomness and convert the final minute into pure chess resolution.

---

# 16. Terrain Interaction with Buffs and Debuffs

Terrain can combine with Buffs and Debuffs, but system caps still apply.

Examples:

- Dirty Play + Cowardice may increase failure pressure, but total probability must respect the probability cap.
- Will + Stone Pieces may create stronger trades, but bonus damage must remain bounded.
- Equal Conditions may reduce the advantage of high-dice pieces even if they have offensive Buffs.

---

# 17. Terrain Design Philosophy

A good Terrain should make players think:

> “How does this battlefield change the way I should play?”

Not:

> “This Terrain decides the winner.”

Terrain should shape the match, not solve it.

---

END
