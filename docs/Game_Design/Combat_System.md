# COMBAT SYSTEM

System reference: [[Systems/Combat/Combat_Flow|Combat_Flow]]

Timing reference: [[Systems/Timing/Timing_And_Priority|Timing_And_Priority]]

Visual design references:

- [[Assets_Design/Dice_Design|Dice Design]]
- [[Assets_Design/Dice/Dice_Index|Dice Asset Design Index]]
- [[Assets_Design/UI_Design|UI Design]]

---

# 1. PURPOSE

Defines how pieces interact when occupying the same square.

---

# 2. COMBAT TRIGGER

Occurs when:

→ A non-King piece moves into a square occupied by an enemy non-King piece

---

# 3. COMBAT FLOW

1. Roll dice
2. Select top 3 results
3. Pair dice
4. Resolve damage
5. Apply rules
6. Determine outcome

---

# 4. DICE RULE

- Attacker rolls AD
- Defender rolls DD
- Only top 3 dice are used

---

# 5. COMPARISON

For each pair:

- Higher value deals 1 damage
- Lower takes 1 damage

---

# 6. TIE RULE

- If both HP ≥ 2 → both take 1 damage
- Otherwise → no damage

---

# 7. MOMENTUM RULE

If attacker wins all comparisons:

→ +1 bonus damage

---

# 8. MINIMUM DAMAGE

If no damage occurs:

→ both take 1 damage

---

# 9. OUTCOME RULES

- Defender dies → attacker moves
- Attacker dies → defender stays
- Both survive → attacker returns
- Both die → empty square

---

# 10. ANTI-STALL

Repeated combat:

→ +1 damage per repetition

---

END
