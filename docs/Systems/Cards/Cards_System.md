# Cards System

---

# 1. Purpose

This document is the system-level reference for cards in Age of Chess.

Cards create asymmetry through player-specific modifiers while preserving the core identity of the game:

- Classical chess movement
- Controlled dice combat
- HP-based attrition
- Public terrain
- King Divinity
- Frenzy as deterministic endgame

---

# 2. Related Documents

- [[Buffs]]
- [[Debuffs]]
- [[Card_Balance]]
- [[Timing_And_Priority]]
- [[Edge_Cases]]
- [[Frenzy_Phase]]

---

# 3. Card Types

Current card types:

- Buffs
- Debuffs

Buffs benefit the player who owns them.

Debuffs apply negative pressure to the opponent.

---

# 4. Match Setup

Each player receives:

- 1 Buff
- 1 Debuff applied to the opponent

Cards are bounded match modifiers.

They should change decisions without replacing board strategy.

---

# 5. Card Visibility

Current intended direction:

- Each player sees only their own selected cards.
- The opponent does not see those cards initially.
- Cards remain hidden until activated or revealed.
- Once activated or revealed, the card becomes known.

Terrain is different:

- Terrain is public.
- Terrain is known before the match begins.
- Terrain affects both players globally.

---

# 6. Card Lifecycle

The intended card lifecycle is:

1. Card selection
2. Hidden state
3. Activation or reveal
4. Active effect
5. Expiration, if applicable

Most current cards are designed as match-long effects, but the hidden/reveal model is not fully finalized.

---

# 7. Open Card Timing Decision

The following is unresolved:

```txt
Are Buffs and Debuffs passive from the start, manually activated, or secretly active while face down?
```

Do not treat this as finalized in implementation documentation.

Design options:

## Option A - Passive From Start

Cards are always active from match start.

Pros:

- Simple.
- Easy to balance.
- Low memory burden.

Cons:

- Hidden cards become difficult to justify.
- Opponent may experience invisible effects before understanding why.

## Option B - Manually Activated

Cards have no effect until the owner activates or reveals them.

Pros:

- Strong player agency.
- Clear reveal moment.
- Easier for opponent to understand.

Cons:

- Requires activation rules.
- Current passive cards need redesign.

## Option C - Secretly Active

Cards are active from the start but remain hidden until they visibly affect play.

Pros:

- Preserves surprise.
- Keeps existing passive designs mostly intact.

Cons:

- Can feel unfair if hidden effects change outcomes.
- Requires clear reveal triggers.

Recommended next step:

- Test Option C for passive cards, but mark it as provisional.

---

# 8. Reveal Timing

Provisional reveal rule:

```txt
A hidden card is revealed the first time its effect changes a game outcome or must be checked publicly.
```

Examples:

- Cowardice reveals when an attack failure roll is checked.
- Stone Pieces reveals when damage is raised to 2.
- Iron Age reveals when a piece defends with Attack Dice.
- Crystal Pieces may need to reveal at match start if HP is public.

This rule requires further design validation.

---

# 9. Card Restrictions

Cards do not affect by default:

- The King
- Divine Attack
- Frenzy Phase
- Classical checkmate rules

Cards may only affect those systems if a card explicitly says so.

---

# 10. Timing Reference

Card timing must follow [[Timing_And_Priority]].

General timing:

1. Check whether the card is active or hidden.
2. Check whether the trigger condition occurs.
3. Reveal the card if required.
4. Apply the effect at the correct timing step.
5. Respect global caps.
6. Disable the effect during Frenzy unless explicitly stated.

---

# 11. Global Caps

| Constraint | Limit |
| --- | --- |
| Bonus damage | Max +2 |
| Failure probability | Max 20% |
| HP reduction | Minimum HP 1 |
| Dice increase | Must respect Top 3 Dice Rule |
| Stacking | Not allowed by default |
| Frenzy interaction | Disabled unless explicitly stated |

---

# 12. Open Questions

- Are all current Buffs and Debuffs hidden?
- Are hidden cards secretly active?
- Does Crystal Pieces reveal immediately because HP values are visible?
- Should future cards be split into Passive, Triggered, and Active types?
- Should Debuffs reveal to the affected player before their first relevant action?

---

END
