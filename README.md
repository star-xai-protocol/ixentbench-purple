Here is the specific **README.md** for the **Purple Agent**. This document is designed to showcase the agent's intelligence and your technical implementation to the judges.

---

# 🧠 GEMA Purple Agent (Gemini 2.5 Pro)

This repository contains the logic for the **Purple Agent**, an advanced AI implementation designed to solve the **CapsBench** benchmark through neuro-symbolic reasoning and hierarchical planning.

## 🚀 Design Philosophy

The Purple Agent does not rely on brute force or "black box" neural network instincts. Instead, it leverages **Gemini 2.5 Pro** to execute a **Counterfactual Thinking** cycle:

1. **Symbolic Perception:** Interprets the board state in JSON format (Ground Truth).
2. **Mental Simulation:** Projects how gear orientations will change after a rotation.
3. **Hypothesis Validation:** Verifies if a move generates a valid jump toward a higher row or the exit.

## 🛠️ Cognitive Architecture

The agent operates under a **Hierarchical Decision Tree** with the following priorities:

### 1. Crisis Resolution and Immediate Victory

* **Win NOW:** If a move exists to rescue a mouse in the current turn, it is executed immediately.
* **Escape Setup:** Moves that position mice in the exit row (y=3 in Level 1).

### 2. Phase Planning

* **Architect Phase (Placement):** The agent utilizes a *future-proofing* strategy, placing gears not just for immediate gains, but to build a transmission network for future turns.
* **Operator Phase (Rotation):** Optimizes movements to maximize the `Efficiency Score`.

### 3. Use of Pre-Moves

Once the inventory is exhausted, the agent activates its **Pre-Move** capability:

* Changes the initial orientation `b` of a specific gear *before* applying the global rotation.
* This allows the agent to "repair" blocked routes or prepare multiple rescue combos in a single turn.

## 📁 Repository Structure

Based on the actual project layout:

```text
purple-agent-submission/
├── purple_ai.py            # 🧠 Intelligence Core (Gemini API & Prompt Engineering)
├── generate_compose.py     # 🛡️ "Vigilante" System (Stability & Timeout Management)
├── scenario.toml           # Partitions, goals, and move limits
├── requirements.txt        # Dependencies (google-generativeai, requests, etc.)
└── results/                # 📊 Final Score JSONs (Efficiency Metrics)

```

## 📡 Communication Protocol (A2A)

The agent communicates with the **Green Agent** using a strict format that separates technical action from strategic intent:

```json
{
  "agent_id": "Purple-Agent-gemini-2.5-pro",
  "command": "G@P13:b=1 ; G@P21+90",
  "reasoning": "Priority 5: Pre-move at P13 to align base before the +90 rotation. This creates a vertical jump path for M2 toward the exit.",
  "meta": {
    "token_usage": { "total": 288868 }
  }
}

```

## 🛡️ Stability: The "Vigilante" System

Due to the intensive reasoning requirements of Gemini 2.5 Pro, we implemented a **Runtime Injection** script (`generate_compose.py`) to ensure environment stability:

* **Prevents Timeouts:** Maintains network heartbeats while the model processes complex reasoning.
* **Ensures Persistence:** Guarantees that `results.json` files are written and validated before the container exits.
* **Schema Compliance:** Ensures all JSON outputs meet the strict `artifactId` and `parts` validation requirements.

## 📊 Performance Metrics

* **Model:** Gemini 2.5 Pro
* **Average Efficiency:** ~55-65 points (Level 1)
* **Success Status:** Verified via automated CI/CD logs.

---

*This agent serves as a proof of concept for AI autonomy in industrial control and logistical planning environments.*

Would you like me to add a specific section regarding the **Prompt Engineering** used to guide Gemini's logic?
