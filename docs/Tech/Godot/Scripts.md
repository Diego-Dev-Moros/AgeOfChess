# Scripts

---

# 1. Purpose

This document defines the core Godot scripts required for Age of Chess.

The goal is to keep implementation modular, testable, and aligned with the rule documents.

Primary references:

- [[Game_Design/Rules|Rules]]
- [[Systems/Timing/Timing_And_Priority|Timing And Priority]]
- [[Systems/Combat/Combat_Flow|Combat Flow]]
- [[Systems/Combat/Damage_Calculation|Damage Calculation]]
- [[Systems/Combat/Dice_System|Dice System]]
- [[Systems/Cards/Cards_System|Cards System Reference]]
- [[Systems/Terrain/Terrain|Terrain]]
- [[Systems/King/King|King]]
- [[Systems/Frenzy/Frenzy_Phase|Frenzy Phase]]

---

# 2. Script Principles

Rules:

- Use Godot 4 GDScript.
- Keep systems separated by responsibility.
- Keep game state serializable.
- Keep visual scripts thin.
- Use data resources for piece stats, card definitions, and terrain definitions.
- Use a turn state machine from the start.
- Prefer explicit action objects over direct node mutation.

---

# 3. Suggested Folder Structure

```txt
game/
  scenes/
    board/
    main/
    pieces/
    ui/
  scripts/
    ai/
    board/
    cards/
    combat/
    core/
    input/
    king/
    pieces/
    terrain/
    turn/
    ui/
  resources/
    cards/
    pieces/
    terrain/
```

---

# 4. Core Scripts

## 4.1 GameManager.gd

Path:

```txt
game/scripts/core/GameManager.gd
```

Purpose:

Top-level coordinator for a match.

Responsibilities:

- Own the current `GameState`.
- Initialize match systems.
- Receive action requests.
- Send requests to `TurnStateMachine.gd`.
- Emit signals for UI and board updates.
- Detect match end conditions.

Must not:

- Contain detailed combat math.
- Contain movement rules directly.
- Contain card-specific behavior directly.

---

## 4.2 GameState.gd

Path:

```txt
game/scripts/core/GameState.gd
```

Purpose:

Serializable authoritative match state.

Responsibilities:

- Store board occupancy.
- Store active pieces and HP.
- Store current player.
- Store card assignments and reveal states.
- Store terrain.
- Store timers and Frenzy state.
- Store King Divinity state.
- Store move and combat history.

Future multiplayer requirement:

- Must be serializable to a dictionary or resource-safe data format.
- Must not depend on scene node references.

---

## 4.3 MatchConfig.gd

Path:

```txt
game/scripts/core/MatchConfig.gd
```

Purpose:

Initial match setup data.

Responsibilities:

- Store selected mode.
- Store player sides.
- Store AI settings.
- Store terrain selection.
- Store card randomization seed.
- Store initial time control.

---

## 4.4 ActionRequest.gd

Path:

```txt
game/scripts/core/ActionRequest.gd
```

Purpose:

Data object representing a player, AI, or future network action.

Examples:

- Select piece.
- Move piece.
- Attack target.
- Use Divine Attack.
- Future active card use.

Reason:

Future multiplayer and replays require actions to be explicit and serializable.

---

# 5. Turn System Scripts

## 5.1 TurnStateMachine.gd

Path:

```txt
game/scripts/turn/TurnStateMachine.gd
```

Purpose:

Authoritative turn flow controller.

Responsibilities:

- Enforce the timing order from [[Systems/Timing/Timing_And_Priority|Timing And Priority]].
- Validate current state before accepting actions.
- Move through turn states predictably.
- Call movement, combat, card, terrain, King, and check systems in order.
- Emit state transitions for UI.

Required MVP states:

```txt
MATCH_SETUP
TURN_START
AWAITING_ACTION
VALIDATING_ACTION
RESOLVING_MOVE
RESOLVING_COMBAT
APPLYING_EFFECTS
CHECK_VALIDATION
TURN_END
GAME_OVER
```

---

## 5.2 TurnManager.gd

Path:

```txt
game/scripts/turn/TurnManager.gd
```

Purpose:

Stores turn-level metadata.

Responsibilities:

- Track active player.
- Track turn number.
- Track current phase.
- Track King commitment counters.
- Track anti-stall combat pairs.
- Track per-player turns without Divine Attack.

---

## 5.3 TimerSystem.gd

Path:

```txt
game/scripts/turn/TimerSystem.gd
```

Purpose:

Own match timer and Frenzy transition.

Responsibilities:

- Track total match time.
- Trigger Frenzy at 1:00 remaining.
- Finish current action before resolving time expiration.
- Notify `FrenzySystem.gd`.

---

## 5.4 FrenzySystem.gd

Path:

```txt
game/scripts/turn/FrenzySystem.gd
```

Purpose:

Apply deterministic endgame rules.

Responsibilities:

- Set all non-King pieces to 1 HP when Frenzy begins.
- Disable dice combat.
- Disable combat-related cards, debuffs, and terrain unless explicitly allowed.
- Convert captures to classical chess captures.

---

# 6. Board And Piece Scripts

## 6.1 BoardController.gd

Path:

```txt
game/scripts/board/BoardController.gd
```

Purpose:

Board visual and coordinate bridge.

Responsibilities:

- Convert screen position to board coordinate.
- Convert board coordinate to world position.
- Render legal move highlights.
- Render terrain overlay.
- Spawn and update `PieceView` nodes from `GameState`.
- Emit interaction signals.

Must not:

- Validate movement rules.
- Own authoritative piece data.

---

## 6.2 BoardModel.gd

Path:

```txt
game/scripts/board/BoardModel.gd
```

Purpose:

Logical board representation.

Responsibilities:

- Store 8x8 occupancy.
- Query pieces at coordinates.
- Apply board position results from resolved actions.
- Provide serialization.

---

## 6.3 MoveValidator.gd

Path:

```txt
game/scripts/board/MoveValidator.gd
```

Purpose:

Validate classical chess movement and legal check responses.

Responsibilities:

- Validate piece movement patterns.
- Validate path blocking.
- Validate castling.
- Validate en passant.
- Validate promotion.
- Prevent moves that leave own King in check.
- Generate legal moves for player and AI.

---

## 6.4 PieceModel.gd

Path:

```txt
game/scripts/pieces/PieceModel.gd
```

Purpose:

Serializable state for one piece.

Fields:

- Piece id.
- Piece type.
- Owner.
- Board coordinate.
- Current HP.
- Base stats reference.
- Has moved.
- Status flags.

---

## 6.5 PieceView.gd

Path:

```txt
game/scripts/pieces/PieceView.gd
```

Purpose:

Visual script for `PieceView.tscn`.

Responsibilities:

- Render sprite.
- Render selected and targeted states.
- Anchor HP and status overlays.
- Play MVP tweens and future animations.

---

## 6.6 PieceStats.gd

Path:

```txt
game/scripts/pieces/PieceStats.gd
```

Type:

Godot `Resource`.

Purpose:

Data resource for base piece stats.

Fields:

- Piece type.
- Attack Dice.
- Defense Dice.
- Max HP.
- Sprite references.

Stats must match [[Game_Design/Rules|Rules]] unless a balance document updates them.

---

# 7. Combat Scripts

## 7.1 CombatResolver.gd

Path:

```txt
game/scripts/combat/CombatResolver.gd
```

Purpose:

Resolve normal non-King combat.

Responsibilities:

- Receive attacker, defender, and context.
- Request dice rolls.
- Sort dice.
- Use top 3 dice.
- Pair dice.
- Calculate base damage.
- Apply momentum and minimum damage rules.
- Return `CombatResult`.

Must not:

- Apply visuals.
- Move piece nodes directly.

---

## 7.2 DiceRoller.gd

Path:

```txt
game/scripts/combat/DiceRoller.gd
```

Purpose:

Dice generation service.

Responsibilities:

- Roll D6 values.
- Support seeded randomness for reproducible tests.
- Return full dice arrays, not only final damage.

---

## 7.3 DamageCalculator.gd

Path:

```txt
game/scripts/combat/DamageCalculator.gd
```

Purpose:

Apply ordered damage modifiers.

Modifier order must follow [[Systems/Timing/Timing_And_Priority|Timing And Priority]].

Responsibilities:

- Apply base comparison damage.
- Apply momentum.
- Apply minimum damage.
- Apply damage floors.
- Apply bonuses and reductions.
- Apply anti-stall.
- Return final simultaneous damage.

---

## 7.4 CombatResult.gd

Path:

```txt
game/scripts/combat/CombatResult.gd
```

Purpose:

Serializable result object for combat.

Fields:

- Attacker dice.
- Defender dice.
- Used dice.
- Ignored dice.
- Damage before modifiers.
- Revealed modifiers.
- Final attacker damage.
- Final defender damage.
- Death flags.
- Final board result.

---

# 8. Card System Scripts

## 8.1 CardSystem.gd

Path:

```txt
game/scripts/cards/CardSystem.gd
```

Purpose:

Coordinates card ownership, hidden state, reveal state, and trigger checks.

Responsibilities:

- Assign cards at match setup.
- Track hidden and revealed cards.
- Check card triggers.
- Return modifiers to combat and turn systems.
- Emit reveal events.

MVP rule:

- Cards are passive match-long effects.
- Manual activation is not required.

---

## 8.2 CardDefinition.gd

Path:

```txt
game/scripts/cards/CardDefinition.gd
```

Type:

Godot `Resource`.

Purpose:

Data definition for one card.

Fields:

- Card id.
- Display name.
- Card type.
- Rule reference.
- Reveal timing.
- Effect script id.
- Art reference.

---

## 8.3 CardEffect.gd

Path:

```txt
game/scripts/cards/CardEffect.gd
```

Purpose:

Base script interface for card behavior.

Required methods:

```gdscript
func can_trigger(context: EffectContext) -> bool
func apply(context: EffectContext) -> EffectResult
func should_reveal(context: EffectContext) -> bool
```

---

## 8.4 EffectContext.gd

Path:

```txt
game/scripts/cards/EffectContext.gd
```

Purpose:

Shared context object passed to cards, terrain, combat, and King systems.

Fields:

- Current timing step.
- Acting player.
- Attacker.
- Defender.
- Move data.
- Combat data.
- Terrain.
- Frenzy state.

---

# 9. Terrain Scripts

## 9.1 TerrainSystem.gd

Path:

```txt
game/scripts/terrain/TerrainSystem.gd
```

Purpose:

Apply global terrain effects.

Responsibilities:

- Store active terrain.
- Apply terrain modifiers at correct timing steps.
- Track terrain counters such as first 3 deaths.
- Notify UI of public terrain state.

---

## 9.2 TerrainDefinition.gd

Path:

```txt
game/scripts/terrain/TerrainDefinition.gd
```

Type:

Godot `Resource`.

Purpose:

Data definition for one terrain.

Fields:

- Terrain id.
- Display name.
- Rule reference.
- Effect script id.
- Board overlay reference.
- Card art reference.

---

# 10. King Scripts

## 10.1 KingSystem.gd

Path:

```txt
game/scripts/king/KingSystem.gd
```

Purpose:

Own Divinity rules and King-specific exceptions.

Responsibilities:

- Track Divinity.
- Validate Divine Attack.
- Apply instant kill when legal.
- Apply commitment rule.
- Apply Divinity recovery.
- Apply overuse penalty.
- Apply negative Divinity consequences.

Open rule:

- Divine Attack as a check response is proposed, not official.

---

## 10.2 CheckSystem.gd

Path:

```txt
game/scripts/king/CheckSystem.gd
```

Purpose:

Detect check, checkmate, stalemate, and legal responses.

Responsibilities:

- Detect attacked King squares.
- Validate check responses.
- Detect checkmate.
- Detect draw conditions.

---

# 11. Input And AI Scripts

## 11.1 InputController.gd

Path:

```txt
game/scripts/input/InputController.gd
```

Purpose:

Translate player input into action requests.

MVP responsibilities:

- Click-to-select.
- Click-to-move.
- Click-to-attack.
- Ignore board input when UI consumes the event.

Future responsibilities:

- Drag start.
- Drag hover.
- Drop validation.
- Input remapping.

---

## 11.2 AIController.gd

Path:

```txt
game/scripts/ai/AIController.gd
```

Purpose:

Submit legal action requests for the AI player.

MVP responsibilities:

- Query legal moves.
- Choose a basic legal move.
- Prefer captures or check responses when available.

Future responsibilities:

- Heuristic scoring.
- Card-aware planning.
- Difficulty levels.

---

# 12. UI Scripts

## 12.1 MatchUI.gd

Path:

```txt
game/scripts/ui/MatchUI.gd
```

Purpose:

Main UI coordinator.

Responsibilities:

- Update turn indicator.
- Update timer.
- Update selected piece panel.
- Update King Divinity display.
- Update terrain display.
- Update card hand.
- Update combat log.

---

## 12.2 CardView.gd

Path:

```txt
game/scripts/ui/CardView.gd
```

Purpose:

Render card visuals from `CardDefinition` and reveal state.

---

## 12.3 CombatFeedbackView.gd

Path:

```txt
game/scripts/ui/CombatFeedbackView.gd
```

Purpose:

Render a `CombatResult`.

Responsibilities:

- Show dice.
- Highlight used dice.
- Show damage.
- Show revealed modifiers.

---

# 13. System Relationship Summary

```txt
InputController / AIController
  -> ActionRequest
    -> GameManager
      -> TurnStateMachine
        -> MoveValidator
        -> CardSystem
        -> TerrainSystem
        -> KingSystem
        -> CombatResolver
        -> CheckSystem
      -> GameState
        -> BoardController
        -> MatchUI
```

---

END
