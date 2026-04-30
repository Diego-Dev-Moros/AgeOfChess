# CARDS SYSTEM

System reference: [[Systems/Cards/Cards_System|Cards System Reference]]

Related documents: [[Systems/Cards/Buffs|Buffs]], [[Systems/Cards/Debuffs|Debuffs]], [[Balancing/Card_Balance|Card_Balance]]

Visual design references:

- [[Assets_Design/Cards_Design|Cards Design]]
- [[Assets_Design/Cards/Cards_Index|Cards Asset Design Index]]

---

# 1. OVERVIEW

Cards modify gameplay through:

- Buffs (self)
- Debuffs (enemy)

---

# 2. DISTRIBUTION

Each player receives:

- 1 Buff
- 1 Debuff (applied to opponent)

---

# 3. RULES

- Permanent
- Non-stackable
- Bounded effects
- Secretly active from match start
- Hidden until first public trigger or reveal
- Revealed cards remain known

See [[Systems/Cards/Cards_System|Cards System Reference]].

---

# 3.1 ACTIVATION AND REVEAL

Current rule:

```txt
Cards are secretly active from match start.
```

This means:

- Each player knows their own Buff and Debuff.
- The opponent does not know those cards initially.
- Card effects apply when their trigger occurs.
- A card is revealed when its effect changes a public outcome or must be checked publicly.
- Terrain is public before the match and is not hidden.

Examples:

- Cowardice reveals when an attack failure check is made.
- Stone Pieces reveals when it raises damage.
- Iron Age reveals when a piece defends with Attack Dice.
- Crystal Pieces reveals at setup because HP is public.

---

# 4. DESIGN PURPOSE

- Create asymmetry
- Influence decisions
- Modify combat indirectly

---

# 5. TYPES

---

## Buffs

- Enhance player performance

---

## Debuffs

- Introduce risk to opponent

---

# 6. LIMITS

- Max +2 damage
- Max 20% probability
- No infinite scaling

---

END
