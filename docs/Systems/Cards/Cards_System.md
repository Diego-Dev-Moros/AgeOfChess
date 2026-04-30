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

Current rule:

- Each player sees only their own selected cards.
- The opponent does not see those cards initially.
- Current Buffs and Debuffs are secretly active from match start.
- Cards remain hidden until their first public trigger or reveal.
- Once revealed, the card remains known.

Terrain is different:

- Terrain is public.
- Terrain is known before the match begins.
- Terrain affects both players globally.

---

# 6. Card Lifecycle

Current card lifecycle:

1. Card selection
2. Hidden state
3. Secret activation from match start
4. Public reveal when triggered
5. Active revealed state
6. Expiration, if applicable

Current cards are passive match-long effects.

They are active from match start, but hidden until their effect must be revealed.

---

# 7. Card Activation Rule

Default rule:

```txt
Cards are secretly active from match start.
```

This means:

- The owner knows their own cards.
- The opponent does not know those cards at match start.
- Card effects apply immediately if their trigger occurs.
- A card is revealed the first time its effect changes a public outcome or must be checked publicly.
- After reveal, the card remains known.

This rule is used because the current Buffs and Debuffs are mostly passive effects.

---

# 8. Reveal Timing

Reveal rule:

```txt
A hidden card is revealed the first time its effect changes a game outcome or must be checked publicly.
```

Examples:

- Cowardice reveals when an attack failure check is made.
- Stone Pieces reveals when damage is raised to 2.
- Iron Age reveals when a piece defends with Attack Dice.
- Last Will reveals when a dying piece deals retaliation damage.
- Fatigue reveals when a redirection or failed redirection check occurs.
- Crystal Pieces reveals at setup because HP values are public.

---

# 9. Manual Activation

Current cards do not require manual activation.

Future cards may use manual activation, but they must explicitly say:

- Activation timing
- Valid targets
- Duration
- Reveal timing
- Whether the effect can be used during Frenzy

---

# 10. Design Risk

Secretly active cards can create surprise, but they must stay readable.

Risk:

- The opponent may feel punished by an invisible rule.

Controls:

- Reveal immediately when the card changes an outcome.
- Keep probability effects capped.
- Keep terrain public.
- Keep Frenzy deterministic.

---

# 11. Card Restrictions

Cards do not affect by default:

- The King
- Divine Attack
- Frenzy Phase
- Classical checkmate rules

Cards may only affect those systems if a card explicitly says so.

---

# 12. Timing Reference

Card timing must follow [[Timing_And_Priority]].

General timing:

1. Check whether the card is hidden or revealed.
2. Check whether the trigger condition occurs.
3. Reveal the card if required.
4. Apply the effect at the correct timing step.
5. Respect global caps.
6. Disable the effect during Frenzy unless explicitly stated.

---

# 13. Global Caps

| Constraint | Limit |
| --- | --- |
| Bonus damage | Max +2 |
| Failure probability | Max 20% |
| HP reduction | Minimum HP 1 |
| Dice increase | Must respect Top 3 Dice Rule |
| Stacking | Not allowed by default |
| Frenzy interaction | Disabled unless explicitly stated |

---

# 14. Open Questions

- Should future cards be split into Passive, Triggered, and Active types?
- Should future special cards support manual activation?
- Should Debuffs reveal to the affected player before their first relevant action?
- Should Crystal Pieces always reveal at setup in physical play, or only in digital play where HP is displayed?

---

END
