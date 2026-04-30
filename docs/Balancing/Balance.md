# ⚖️ AGE OF CHESS — BALANCE DOCUMENT

---

# 1. PURPOSE

This document defines:

- Balance philosophy
- System tuning guidelines
- Known strengths and weaknesses
- Areas for future adjustments

This is a **design reference**, not a player-facing document.

---

# 2. BALANCE PHILOSOPHY

---

## 2.1 Core Principle

> No piece, mechanic, or strategy should be strictly dominant.

Every advantage must have:

- A counter
- A cost
- A timing constraint

---

## 2.2 Design Targets

The system aims to:

- Reward strategic positioning
- Allow controlled randomness
- Ensure all pieces remain relevant
- Avoid deterministic early outcomes
- Guarantee late-game resolution

---

# 3. PIECE BALANCE

---

## 3.1 Power Curve

| Tier  | Pieces         |
| ----- | -------------- |
| Low   | Pawn           |
| Mid   | Knight, Bishop |
| High  | Rook           |
| Elite | Queen          |

---

## 3.2 Balance Intent

---

### Pawn

Role:

- Disposable unit
- Positional tool
- RNG disruptor

Strengths:

- Low cost to trade
- Can win through variance

Weaknesses:

- Minimal survivability
- Limited control

---

### Knight / Bishop

Role:

- Tactical fighters
- Mid-game control

Strengths:

- Balanced AD/DD
- Good trade potential

Weaknesses:

- Vulnerable to high dice units

---

### Rook

Role:

- Durable frontline
- Reliable damage

Strengths:

- High HP
- Strong defense

Weaknesses:

- Predictable movement
- Can be outplayed by positioning

---

### Queen

Role:

- Dominant tactical unit
- Flexible threat

Strengths:

- High consistency
- Strong offensive output

Weaknesses (intentional):

- Reduced DD vs previous versions
- Vulnerable to focus fire
- Limited by top-3 dice rule

---

## 3.3 Queen Balance Note

The Queen is intentionally the strongest piece, but:

- Cannot dominate through dice spam
- Can be worn down over multiple combats
- Is highly punished in Frenzy phase

---

# 4. COMBAT BALANCE

---

## 4.1 Goals

- Fast resolution
- Meaningful outcomes
- No infinite combat loops

---

## 4.2 Key Mechanics

---

### Top-3 Dice Rule

Purpose:

- Reduce advantage of high-dice pieces
- Normalize combat variability

---

### Momentum Rule

Purpose:

- Reward strong rolls
- Introduce spike moments

---

### Tie Rule

Purpose:

- Prevent stagnation
- Maintain tension in combat

---

### Minimum Damage Rule

Purpose:

- Ensure all combats progress
- Avoid zero-damage scenarios

---

## 4.3 Risk vs Reward

| Action            | Risk              | Reward            |
| ----------------- | ----------------- | ----------------- |
| Attack            | Potential damage  | Board control     |
| Defend            | Lower risk        | Slower progress   |
| Engage repeatedly | Increasing damage | Forced resolution |

---

# 5. KING BALANCE

---

## 5.1 Role

The King is:

- A strategic execution tool
- A tempo controller
- A risk amplifier

---

## 5.2 Design Constraints

The King must:

- Feel powerful
- Not be spammable
- Create decision tension

---

## 5.3 Balance Mechanisms

---

### Divinity Cost

Each attack reduces future power.

---

### Commitment Rule

Prevents safe hit-and-run behavior.

---

### Overuse Penalty

Discourages aggressive spamming.

---

### Divinity Recovery

Encourages delayed use.

---

## 5.4 Optimal Use Window

The King is strongest when:

- Used mid-to-late game
- Used selectively
- Supported by positioning

---

## 5.5 Failure States

Overuse leads to:

- Reduced offensive capability
- Increased team vulnerability
- Potential collapse (Demon King state)

---

# 6. BUFF BALANCE

---

## 6.1 Design Goals

Buffs must:

- Change decision-making
- Influence targeting
- Create asymmetry between players

---

## 6.2 Strength Level

Buffs are:

- Strong enough to matter
- Not strong enough to define victory alone

---

## 6.3 Strategic Impact

Buffs should:

- Encourage specific playstyles
- Influence trades
- Alter combat expectations

---

## 6.4 Balance Constraints

- No buff exceeds +2 damage
- No stacking allowed
- No infinite scaling

---

# 7. DEBUFF BALANCE

---

## 7.1 Design Goals

Debuffs introduce:

- Uncertainty
- Risk management
- Adaptation pressure

---

## 7.2 Constraints

- Probability capped at 20%
- Effects must not remove player agency
- No guaranteed negative outcomes

---

## 7.3 Balance Intent

Debuffs should:

- Influence decisions, not dictate them
- Add tension without frustration

---

# 8. TERRAIN BALANCE

---

## 8.1 Design Goals

Terrain must:

- Affect gameplay meaningfully
- Not dominate the match
- Avoid snowball effects

---

## 8.2 Constraints

- Effects are limited (3 triggers max)
- No permanent stacking
- Applies equally to both players

---

## 8.3 Impact Areas

Terrain affects:

- Combat efficiency
- Survivability
- Trade value

---

# 9. TIME SYSTEM BALANCE

---

## 9.1 Purpose

Time ensures:

- Match resolution
- Increasing pressure
- Strategic pacing

---

## 9.2 Frenzy Phase

Acts as:

- Hard reset of randomness
- Skill-based final phase
- Anti-stall mechanism

---

## 9.3 Balance Impact

Frenzy ensures:

- No infinite games
- No RNG-based endings
- Skill determines outcome

---

# 10. SYSTEM INTERACTIONS

---

## 10.1 Key Interactions

- Buffs modify combat outcomes
- Debuffs introduce variance
- Terrain shapes engagements
- King alters tempo
- Time forces resolution

---

## 10.2 Emergent Gameplay

Expected behaviors:

- Risk-managed aggression
- Strategic sacrifices
- Dynamic board control
- Timing-based decisions

---

# 11. KNOWN BALANCE RISKS

---

## 11.1 Queen Overdominance

Mitigation:

- Top-3 dice rule
- Reduced defense
- Focus fire vulnerability

---

## 11.2 Early RNG Swings

Mitigation:

- Multi-dice comparison
- HP system
- Mid-game stabilization

---

## 11.3 Passive Play

Mitigation:

- Anti-stall rule
- Time system
- Frenzy phase

---

## 11.4 King Abuse

Mitigation:

- Commitment rule
- Divinity cost
- Overuse penalty

---

# 12. PLAYTEST METRICS

---

## 12.1 What to Track

- Match duration
- King usage frequency
- Win rates by strategy
- Piece survival rates
- Frenzy frequency

---

## 12.2 Warning Signals

- One strategy dominates
- Queen wins most trades uncontested
- King used every turn
- Matches reach Frenzy too often
- Matches end too early

---

# 13. FUTURE ADJUSTMENTS

---

Potential tuning areas:

- Dice distribution
- Queen stats
- Buff strength
- Terrain limits
- Divinity scaling

---

# 14. RELATED DOCUMENTATION

- [[Balancing_Index]]
- [[Balancing/Combat_Probabilities|Combat Probabilities]]
- [[Balancing/Card_Balance|Card Balance]]
- [[Game_Design/System|System]]
- [[Game_Design/Rules|Rules]]
- [[Design_Node_Map]]

---

# 15. FINAL STATEMENT

The system is designed to:

→ Balance randomness with strategy
→ Ensure constant decision-making
→ Converge toward resolution
→ Maintain fairness and depth

---

END OF BALANCE DOCUMENT
