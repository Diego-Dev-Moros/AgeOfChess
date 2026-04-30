# Debuffs

---

# 1. Overview

Debuffs are negative card effects applied to the opponent.

They are designed to create pressure, uncertainty, and adaptation without removing player agency.

A Debuff should make the opponent rethink their strategy, but it should not make the game feel unfair or unwinnable.

---

# 2. Purpose of Debuff Cards

Debuffs exist to:

- Disrupt reliable strategies
- Create uncertainty
- Punish predictable play
- Force tactical adaptation
- Add asymmetry between players
- Increase replayability

---

# 3. Core Debuff Rules

At the start of a match:

- Each player receives 1 Debuff card.
- That Debuff is applied to the opponent.
- Debuffs affect all enemy pieces unless the card says otherwise.
- Debuffs do not stack.

Card visibility follows the current card activation rule.

Current rule:

- Debuffs are secretly active from match start.
- A Debuff is revealed when its effect changes a game outcome or must be checked publicly.
- After reveal, the Debuff remains known.

See [[Systems/Cards/Cards_System|Cards System Reference]] and [[Edge_Cases]].

---

# 4. Debuff Design Limits

Debuffs must be carefully bounded.

A Debuff must NOT:

- Prevent the opponent from playing
- Remove all legal moves
- Guarantee failure
- Directly create checkmate
- Create infinite damage
- Make attacks impossible
- Override Frenzy Phase unless explicitly stated

---

# 5. Global Balance Constraints

| Constraint          | Limit                    |
| ------------------- | ------------------------ |
| Failure probability | Max 20%                  |
| Damage penalty      | Must be bounded          |
| HP reduction        | Minimum HP must remain 1 |
| Dice reduction      | Must not remove all dice |
| Stacking            | Not allowed              |

---

# 6. When Debuffs Apply

Debuffs are checked according to [[Timing_And_Priority]].

General timing:

1. Player declares a move or attack.
2. Debuff trigger is checked.
3. If the Debuff activates, it modifies the action.
4. Combat proceeds, fails, or redirects depending on the effect.
5. Damage and board position are resolved.

If a Debuff causes an attack to fail before combat, the attacker remains in its original square and the turn is consumed.

---

# 7. Debuff Categories

---

## 7.1 Reliability Debuffs

These reduce the opponent’s consistency.

Examples:

- Chance to fail attacks
- Reduced attack reliability
- Forced risk on aggressive moves

---

## 7.2 Attrition Debuffs

These reduce survivability or long-term durability.

Examples:

- HP reduction
- Increased damage received
- Worse trade outcomes

---

## 7.3 Offensive Debuffs

These reduce attacking power.

Examples:

- Lower Attack Dice
- Reduced damage
- Lower momentum potential

---

## 7.4 Chaos Debuffs

These redirect, distort, or complicate actions.

Examples:

- Friendly fire chance
- Randomized target effects
- Positional risk

---

# 8. Current Debuff Cards

Current Debuff cards:

- [[Crystal_Pieces]]
- [[Cowardice]]
- [[Immoral]]
- [[Fatigue]]

Open design note:

- Fatigue targeting is not finalized.
- Recommended first test: redirect only to allied non-King pieces within the attacker's legal attack range from its original square.
- See [[Edge_Cases]].

---

# 9. How to Create a New Debuff Card

A new Debuff card should use the following structure:

```md
# Card Name

---

# 1. Card Type

Debuff

---

# 2. Category

Reliability / Attrition / Offensive / Chaos / Hybrid

---

# 3. Effect

Describe the exact negative effect.

---

# 4. Trigger

When does the Debuff activate?

Examples:
- Before attacking
- When defending
- When rolling dice
- When taking damage
- When a piece dies

---

# 5. Target

Who is affected?

Examples:
- All enemy pieces
- Enemy pawns only
- Enemy high-value pieces
- Enemy pieces in combat
- Enemy pieces near the King

---

# 6. Duration

How long does it last?

Default:
- Entire match

Other options:
- One turn
- Until triggered
- Limited number of uses
- Until Frenzy

---

# 7. Restrictions

Define limits.

Examples:
- Cannot affect the King
- Cannot reduce HP below 1
- Cannot stack with other failure effects
- Does not apply during Frenzy

---

# 8. Design Intent

Explain why the card exists.

---

# 9. Counterplay

Explain how the opponent can adapt.

---

# 10. Balance Notes

Explain risks, abuse cases, and tuning knobs.
```

---

# 10. Debuff Design Checklist

Before adding a new Debuff, answer:

- Does it allow counterplay?
- Does it preserve player agency?
- Is the probability bounded?
- Does it avoid hard-locking the opponent?
- Does it avoid creating unavoidable losses?
- Does it respect Frenzy Phase?
- Does it avoid making attacks useless?
- Can the opponent adapt through positioning or timing?

If the answer to any of these is “no”, the Debuff should be redesigned.

---

# 11. Debuff Interaction with Frenzy

Default rule:

- Debuffs do not affect Frenzy Phase.

Reason:

Frenzy is designed to remove randomness and resolve the game through pure chess.

---

# 12. Debuff Interaction with the King

Default rule:

- Debuffs do not affect the King directly.
- Debuffs do not prevent Divine Attack unless explicitly stated.
- Debuffs do not modify Divinity.

Future King-related Debuffs must be designed carefully because the King is the victory condition.

---

# 13. Design Philosophy

A good Debuff should make the opponent think:

> “How do I play around this?”

Not:

> “I cannot play anymore.”

---

END
