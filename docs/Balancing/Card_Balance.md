# Card Balance

---

# 1. Purpose

This document defines how Buffs and Debuffs should be balanced in Age of Chess.

Cards exist to create asymmetry, replayability, and strategic identity.

They must be powerful enough to matter, but not strong enough to decide the game alone.

---

# 2. Card Balance Philosophy

A card should make the player think:

```txt
How should I adapt my strategy?
```

A card should not make the player think:

```txt
This match is already decided.
```

Cards should:

- Create decision pressure
- Encourage different playstyles
- Change target priority
- Create counterplay
- Interact with terrain and combat
- Stay bounded

---

# 3. Card Types

Age of Chess currently has two major card types:

- Buffs
- Debuffs

## Buffs

Buffs benefit the player who owns them.

## Debuffs

Debuffs apply negative pressure to the opponent.

---

# 4. Global Card Constraints

All cards must respect these limits:

| Constraint          | Limit                             |
| ------------------- | --------------------------------- |
| Bonus damage        | Max +2                            |
| Failure probability | Max 20%                           |
| HP reduction        | Minimum HP must remain 1          |
| Dice increase       | Must respect Top 3 Dice Rule      |
| Stacking            | Not allowed by default            |
| Frenzy interaction  | Disabled unless explicitly stated |

---

# 5. Why Cards Must Be Bounded

Cards are global match modifiers.

If they are not bounded, they can create:

- Infinite scaling
- Unavoidable wins
- Frustrating randomness
- Dead strategies
- Overpowered combinations
- Impossible comeback states

Bounded effects keep the game readable and fair.

---

# 6. Current Buff Balance

Current Buffs:

- Giant Slayer
- Stone Pieces
- Iron Age
- Last Will

---

# 7. Giant Slayer Balance

## Effect

Lower-value pieces deal +2 damage when attacking higher-value pieces.

## Strengths

- Makes weak pieces relevant
- Threatens high-value pieces
- Encourages aggressive trades
- Reduces Queen and Rook safety

## Risks

- Pawns may become too efficient
- Can punish high-value pieces too hard
- May combine strongly with damage terrain

## Controls

- Only applies when attacking
- Only applies against higher-value pieces
- Does not affect the King
- Bonus capped at +2
- Does not apply during Frenzy

## Balance Watch

Track:

- How often pawns kill major pieces
- Whether players avoid using high-value pieces
- Whether Giant Slayer feels mandatory

---

# 8. Stone Pieces Balance

## Effect

If a piece deals damage, its total damage cannot be lower than 2.

## Strengths

- Improves consistency
- Rewards active combat
- Reduces weak attacks
- Speeds up resolution

## Risks

- May make low-damage attacks too reliable
- May reduce importance of strong rolls
- Could make combat too fast

## Controls

- May upgrade Minimum Damage Rule damage for its owner if combat damage occurs
- Requires damage to occur first
- Does not affect Divine Attack
- Does not apply during Frenzy

## Balance Watch

Track:

- Average combat length
- Number of pieces dying in early game
- Whether Stone Pieces outperforms other Buffs

---

# 9. Iron Age Balance

## Effect

Allied pieces defend using Attack Dice instead of Defense Dice.

## Strengths

- Improves defensive reliability
- Helps players hold key squares
- Makes attacks against protected pieces riskier

## Risks

- May slow the game down
- May make defensive play too strong
- Can reduce attack viability

## Controls

- Top 3 Dice Rule still applies
- Does not increase HP
- Does not affect the King
- Does not apply during Frenzy

## Balance Watch

Track:

- Whether Iron Age players avoid attacking
- Whether opponents struggle to break positions
- Whether games with Iron Age reach Frenzy too often

---

# 10. Last Will Balance

## Effect

When an allied piece dies in combat, it deals 2 damage to the enemy piece involved.

## Strengths

- Punishes aggression
- Enables sacrifice strategies
- Makes trades more dangerous
- Gives value to dying pieces

## Risks

- May cause too many mutual deaths
- May discourage attacking
- Could become oppressive with low-HP enemies

## Controls

- Only triggers on combat death
- Does not affect the King
- Does not trigger during Frenzy
- Fixed 2 damage
- Does not trigger from terrain-only damage by default

## Balance Watch

Track:

- Frequency of mutual deaths
- Whether players avoid combat too much
- Whether Last Will causes excessive board clearing

---

# 11. Current Debuff Balance

Current Debuffs:

- Crystal Pieces
- Cowardice
- Immoral
- Fatigue

---

# 12. Crystal Pieces Balance

## Effect

Enemy non-pawn pieces have -1 HP.

## Strengths

- Speeds up combat
- Makes high-value pieces easier to remove
- Encourages aggression

## Risks

- May make games too short
- Can over-punish Rooks and minor pieces
- May combine too strongly with Giant Slayer or Will

## Controls

- Does not affect pawns
- Does not affect the King
- Minimum HP is 1
- Disabled by Frenzy’s HP reset

## Balance Watch

Track:

- Average number of pieces dead before Frenzy
- Whether Crystal Pieces creates early snowball
- Whether affected players feel they can still trade

---

# 13. Cowardice Balance

## Effect

Enemy pieces have a 15% chance to fail attacks.

## Strengths

- Introduces uncertainty
- Punishes reckless attacks
- Encourages careful timing

## Risks

- Can feel frustrating
- May reduce player agency
- May create memorable but negative moments

## Controls

- Probability capped at 20%
- Does not affect the King by default
- Does not apply during Frenzy
- Failed attacks consume turn but attacker stays in original square

## Balance Watch

Track:

- Number of failed attacks per match
- Whether failed attacks decide games too often
- Player frustration level

---

# 14. Immoral Balance

## Effect

Enemy pieces attack using Defense Dice instead of Attack Dice.

## Strengths

- Reduces enemy offense
- Slows aggressive strategies
- Makes positioning more important

## Risks

- May make attacking feel weak
- Can over-support defensive play
- May be too strong against already low-AD pieces

## Controls

- Cannot reduce attack below 1 die
- Does not affect the King
- Does not apply during Frenzy
- Top 3 Dice Rule remains active

## Balance Watch

Track:

- Attack success rate under Immoral
- Whether players stop attacking
- Whether games with Immoral go too long

---

# 15. Fatigue Balance

## Effect

Enemy attacks have a 5% chance to redirect to a valid allied piece.

## Strengths

- Punishes crowded formations
- Creates positioning decisions
- Adds low-frequency chaos

## Risks

- Can feel unfair if a key piece dies randomly
- Requires precise definition of valid target
- Could be confusing without clear UI

## Controls

- Only 5% base chance
- Max probability cap 20%
- Cannot target the King
- Recommended first test: only redirects to valid allied pieces inside the 3x3 area centered on the attacker
- If no valid target exists, attack fails
- Does not apply during Frenzy

## Balance Watch

Track:

- Number of Fatigue triggers per match
- Whether Fatigue causes major unexpected losses
- Whether players understand why it triggered

---

# 16. Card Interaction Risks

Cards can become problematic when combined with terrain.

Examples:

## Giant Slayer + Dirty Play

High-risk attacks may become too lethal.

## Stone Pieces + Will

Damage consistency may become too high.

## Iron Age + Holy Ground

Defensive durability may become too strong.

## Last Will + Hell

Death-heavy matches may become too punishing.

## Cowardice + Dirty Play

Attack failure rates may become frustrating.

---

# 17. Card Interaction Rule

When multiple effects modify the same value:

```txt
Global caps always apply.
```

Example:

If Cowardice gives 15% failure and Dirty Play gives 10% failure:

```txt
Total failure chance cannot exceed 20%.
```

---

# 18. Card Power Targets

Cards should be evaluated by three questions:

## Does it change decisions?

If not, it is too weak.

## Does it remove counterplay?

If yes, it is too strong.

## Does it create memorable moments?

If yes, it is likely useful.

---

# 19. Card Balance Metrics

Track during playtesting:

- Win rate by card
- Pick rate if drafting exists
- Average damage increase
- Average failed attacks
- Number of deaths caused by card effects
- Player frustration
- Whether the opponent had counterplay

---

# 20. Warning Signals

A card may need adjustment if:

- It wins too often
- It feels mandatory
- It makes one piece type useless
- It prevents attacking
- It creates unavoidable deaths
- It is forgotten during play
- It rarely triggers
- It dominates the match identity more than terrain or positioning

---

# 21. Buff Tuning Options

To weaken a Buff:

- Lower bonus damage
- Reduce affected targets
- Add trigger condition
- Limit uses
- Disable interaction with terrain
- Make it inactive before mid-game

To strengthen a Buff:

- Increase trigger frequency
- Broaden target range
- Improve reliability
- Add secondary effect
- Improve synergy with specific pieces

---

# 22. Debuff Tuning Options

To weaken a Debuff:

- Lower probability
- Reduce affected targets
- Add range restrictions
- Allow counterplay
- Disable in specific phases

To strengthen a Debuff:

- Increase probability within cap
- Broaden affected targets
- Add clearer tactical pressure
- Improve consistency without removing agency

---

# 23. Card Design Checklist

Before approving a new card:

- Does it create a real decision?
- Does it have counterplay?
- Is it bounded?
- Does it avoid infinite scaling?
- Does it preserve Frenzy?
- Does it avoid affecting the King unless designed for it?
- Does it respect global caps?
- Does it avoid making combat meaningless?
- Does it avoid making one strategy always correct?

---

# 24. Current Balance Status

Current card system status:

```txt
Playable but requires testing.
```

Main risks:

- Stone Pieces may be too consistent.
- Cowardice may feel frustrating.
- Iron Age may slow games.
- Giant Slayer may over-punish major pieces.
- Fatigue requires clear targeting rules.

---

# 25. Future Work

Future Card Balance documentation should include:

- Playtest data
- Win rates by card
- Card matchup matrix
- Card + terrain interaction matrix
- Recommended tuning patches
- Competitive format rules

---

# 13. Related Documentation

- [[Balancing_Index]]
- [[Balancing/Balance|Balance]]
- [[Game_Design/Cards_System|Cards System]]
- [[Systems/Cards/Cards_System|Cards System Reference]]
- [[Systems/Cards/Buffs|Buffs]]
- [[Systems/Cards/Debuffs|Debuffs]]
- [[Design_Node_Map]]

---

END
