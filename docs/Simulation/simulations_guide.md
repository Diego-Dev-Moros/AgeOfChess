# AGE OF CHESS — SIMULATION GUIDE

---

# 1. PURPOSE

This document defines how to build meaningful simulations that:

- Validate system behavior
- Test balance between mechanics
- Reveal edge cases and vulnerabilities
- Ensure all systems are exercised

---

# 2. SIMULATION GOALS

Every simulation must aim to test at least one of:

- Combat system behavior
- King usage and divinity management
- Buff and debuff impact
- Terrain influence
- Time pressure and Frenzy transition
- Edge cases (low HP, repeated fights, etc.)

---

# 3. SIMULATION STRUCTURE

Each simulation must follow this format:

---

## 3.1 Setup

Define:

- Players (White / Black)
- Buffs
- Debuffs
- Terrain
- Initial time (10:00)

---

## 3.2 Phases

Simulations should include:

1. Early Game (low interaction)
2. Mid Game (combat focus)
3. Late Game (reduced pieces)
4. Frenzy Phase (≤ 1 min)

---

## 3.3 Turn Logging

Each turn must include:

- Move played
- Combat (if any)
- Dice rolls
- Damage calculation
- Result

---

## 3.4 Example Format

Turn X

White:
Move: Knight f3 → e5

Combat:
Knight vs Bishop

Rolls:
Knight: 6,4,2
Bishop: 5,3,1

Resolution:
6 > 5 → Bishop -1
4 > 3 → Bishop -1
2 > 1 → Bishop -1

Result:
Bishop dies
Knight survives


---

# 4. REQUIRED SYSTEM COVERAGE

A valid simulation MUST include:

---

## 4.1 Combat System

- At least 3 combats
- Include:
  - Normal win
  - Tie scenario
  - Momentum trigger
  - Minimum damage case

---

## 4.2 Anti-Stall

- Same pieces fighting twice
- Verify extra damage

---

## 4.3 King System

Must include:

- At least 1 Divine Attack
- At least 1 Commitment scenario
- At least 1 Divinity change
- Preferably:
  - Overuse penalty
  - Recovery case

---

## 4.4 Buffs

- Must affect at least one combat outcome

---

## 4.5 Debuffs

- Must trigger at least once (if probabilistic)

---

## 4.6 Terrain

- Must influence at least one situation

---

## 4.7 Time System

- Simulation must reach Frenzy Phase

---

# 5. DICE USAGE RULES

When simulating dice:

---

## 5.1 Realistic Distribution

Avoid:

- Always high rolls
- Always low rolls

Use mixed results:

- High (5–6)
- Medium (3–4)
- Low (1–2)

---

## 5.2 Variation

Ensure:

- At least one upset (weaker piece wins)
- At least one dominant win
- At least one balanced fight

---

# 6. EDGE CASE TESTING

Each simulation should include at least one:

---

## 6.1 Low HP Combat

- Piece with 1 HP fighting

---

## 6.2 No Damage Scenario

- Trigger minimum damage rule

---

## 6.3 High Dice vs Low Dice

- Queen vs Pawn type interaction

---

## 6.4 King Exposure

- King attacks and is threatened next turn

---

# 7. FRENZY PHASE REQUIREMENTS

---

## 7.1 Transition

Explicitly state:

→ "Frenzy Phase triggered"

---

## 7.2 Effects

- HP = 1
- No dice
- Instant captures

---

## 7.3 Final Outcome

Must end with:

- Checkmate OR
- Time-based victory

---

# 8. SIMULATION TYPES

---

## 8.1 Balanced Simulation

- Normal gameplay
- No extreme bias

---

## 8.2 Stress Test

- Focus on one system
- Example:
  - King spam
  - Buff-heavy scenario

---

## 8.3 Edge Case Simulation

- Designed to break system
- Tests limits

---

# 9. COMMON MISTAKES

Avoid:

---

## Ignoring time system

Simulations must include Frenzy

---

## Skipping dice rolls

Combat must be explicit

---

##  Not resolving outcomes

Every combat must have a result

---

## Perfect play bias

Include mistakes or suboptimal decisions

---

# 10. SUCCESS CRITERIA

A good simulation:

✔ Uses all major systems  
✔ Shows realistic outcomes  
✔ Includes randomness  
✔ Reaches a conclusion  
✔ Reveals insights  

---

# 11. OUTPUT FORMAT

Each simulation should be saved as:

- simulation_1.md
- simulation_2.md
- etc.

---

# 12. FINAL NOTE

Simulations are not stories.

They are:

→ Controlled experiments  
→ System validation tools  
→ Balance diagnostics  

---

END