# UI Aesthetics

Multi-platform AI skill pack for generating, reviewing, and refactoring web UI with stronger visual judgment.

`ui-aesthetics` helps agents produce interfaces that feel more refined, balanced, precise, and product-grade without inflating scope or relying on fake luxury cues.

## Overview

This repository keeps one canonical UI aesthetics skill and adapts it to multiple agent and IDE ecosystems.

- Canonical source: `SKILL.md`
- Shared adapter layer: `.shared/ui-aesthetics/`
- Platform-native wrappers: `.codex/`, `.claude/`, `.cursor/`, `.windsurf/`, `.opencode/`, `.gemini/`, `.qoder/`, `.kiro/`, `.github/`
- Deep guidance: `references/`

If you update the skill, update `SKILL.md` first.

## What it helps with

Use `ui-aesthetics` when a UI needs:

- cleaner composition and hierarchy
- tighter spacing, typography, and information density
- more refined buttons, cards, forms, tables, and overlays
- calmer hover, focus, selected, loading, and error states
- better motion discipline
- more coherent shadow, blur, highlight, and dark-mode depth logic

Typical requests:

- "Make this dashboard feel cleaner and more premium."
- "Explain why this page looks AI-generated."
- "Refactor this settings panel without changing the information density."
- "Tighten hover, focus, selected, loading, and dark-mode depth behavior."

## Core principles

- preserve requested scope
- fix hierarchy before decoration
- prefer restraint over fake luxury
- keep default states quiet and semantic states distinct
- use motion and depth to clarify, not to perform
- keep the result shippable and maintainable

## Supported platforms

| Platform | Entry in this repo | Type |
| --- | --- | --- |
| Codex | `.codex/skills/ui-aesthetics/` + `agents/openai.yaml` | Skill |
| Claude Code | `.claude/skills/ui-aesthetics/` | Skill |
| OpenCode | `.opencode/skills/ui-aesthetics/` | Skill |
| OpenCode | `.opencode/commands/ui-aesthetics.md` | Command |
| Cursor | `.cursor/rules/ui-aesthetics.mdc` | Rule |
| Windsurf | `.windsurf/skills/ui-aesthetics/` | Skill |
| Windsurf | `.windsurf/workflows/ui-aesthetics.md` | Workflow |
| Gemini CLI | `.gemini/skills/ui-aesthetics/` | Skill |
| Qoder | `.qoder/skills/ui-aesthetics/` | Skill |
| Kiro | `.kiro/steering/ui-aesthetics.md` | Steering |
| GitHub Copilot | `.github/prompts/ui-aesthetics.prompt.md` | Prompt file |
| Generic shared alias | `.agents/skills/ui-aesthetics/` | Skill alias |
| Compatibility wrappers | `.agent/workflows/`, `.roo/commands/`, `.codebuddy/commands/` | Workflow / command |

## Installation

Clone this repository:

```bash
git clone https://github.com/kasonye/ui-aesthetics-skill.git
cd ui-aesthetics-skill
```

Or vendor it into another repository as a submodule:

```bash
git submodule add https://github.com/kasonye/ui-aesthetics-skill.git .agent-skills/ui-aesthetics
```

After cloning, point your platform at the matching entrypoint inside this repository.

Common entrypoints:

- Codex: `.codex/skills/ui-aesthetics/`
- Claude Code: `.claude/skills/ui-aesthetics/`
- OpenCode: `.opencode/skills/ui-aesthetics/` or `.opencode/commands/ui-aesthetics.md`
- Cursor: `.cursor/rules/ui-aesthetics.mdc`
- Windsurf: `.windsurf/skills/ui-aesthetics/` and `.windsurf/workflows/ui-aesthetics.md`
- Gemini CLI: `.gemini/skills/ui-aesthetics/`
- Qoder: `.qoder/skills/ui-aesthetics/`
- Kiro: `.kiro/steering/ui-aesthetics.md`
- GitHub Copilot: `.github/prompts/ui-aesthetics.prompt.md`

## Usage

Depending on the platform, `ui-aesthetics` can be:

- auto-selected when the task is clearly about UI polish
- explicitly invoked as a skill, rule, workflow, command, or prompt

Common invocation patterns:

- `$ui-aesthetics`
- `/ui-aesthetics`
- `@ui-aesthetics`
- prompt-file selection in GitHub Copilot

## Example prompt and outputs

Prompt used for the example:

> 用仓库的skill写一个产品介绍页，配色要亮眼能够吸引人，要有一点动画和光效，有立体感

<table>
  <tr>
    <td width="50%" align="center">
      <strong>由 Codex + GPT-5.4 生成</strong>
      <br />
      <img src="./assets/readme/codex-gpt54-showcase.png" alt="Product landing page example generated with Codex and GPT-5.4" width="100%" />
    </td>
    <td width="50%" align="center">
      <strong>由 Claude Code + MiniMax M2.7 生成</strong>
      <br />
      <img src="assets/readme/cc-minimax-m27-showcase.png" alt="Product landing page example generated with Claude Code and MiniMax M2.7" width="100%" />
    </td>
  </tr>
</table>
<table>
  <tr>
    <td width="50%" align="center">
      <strong>由 Claude Code + Claude Opus 4.6 生成</strong>
      <br />
      <img src="./assets/readme/cc-claude-opus-46-showcase.png" alt="Product landing page example generated with Codex and GPT-5.4" width="100%" />
    </td>
    <td width="50%" align="center">
      <strong>由 Claude Code + GLM-5.1 生成</strong>
      <br />
      <img src="assets/readme/cc-glm-51-showcase.png" alt="Product landing page example generated with Claude Code and MiniMax M2.7" width="100%" />
    </td>
  </tr>
</table>

These four showcase images summarize the kind of bright color, lighting, subtle motion language, and layered depth this skill tends to encourage for marketing-style product pages.

## Skill routes

The skill is optimized around six working modes:

1. Generation
2. Review
3. Refactor
4. Component Polish
5. State / Motion Refinement
6. Depth / Lighting Refinement

## Platform behavior

_Last verified against public docs and reference repos on April 11, 2026._

| Platform | Use this entry | Invocation / behavior |
| --- | --- | --- |
| Codex | `.codex/skills/ui-aesthetics/` + `agents/openai.yaml` | Auto-selected when relevant, or invoke with the client skill UX, commonly `$ui-aesthetics ...` |
| Claude Code | `.claude/skills/ui-aesthetics/` | Auto-selected when relevant, or invoke with `/ui-aesthetics ...` |
| OpenCode | `.opencode/skills/ui-aesthetics/` | Auto-selected when relevant |
| OpenCode command | `.opencode/commands/ui-aesthetics.md` | Explicit `/ui-aesthetics` command |
| Cursor | `.cursor/rules/ui-aesthetics.mdc` | Agent Requested rule, or explicit `@ui-aesthetics` |
| Windsurf | `.windsurf/skills/ui-aesthetics/` | Auto skill or `@ui-aesthetics` |
| Windsurf workflow | `.windsurf/workflows/ui-aesthetics.md` | Explicit `/ui-aesthetics` workflow |
| Gemini CLI | `.gemini/skills/ui-aesthetics/` | Auto skill selection; manageable via `/skills` or `gemini skills ...` |
| Qoder | `.qoder/skills/ui-aesthetics/` | Auto skill or `/ui-aesthetics` |
| Kiro | `.kiro/steering/ui-aesthetics.md` | Auto steering and `/ui-aesthetics` |
| GitHub Copilot | `.github/prompts/ui-aesthetics.prompt.md` | Select from the prompt-file picker |
| Generic alias | `.agents/skills/ui-aesthetics/` | For tools that support shared `.agents/skills/` discovery |
| Compatibility wrappers | `.agent/workflows/`, `.roo/commands/`, `.codebuddy/commands/` | Best-effort command/workflow surfaces aligned with reference repos |

## Repository structure

```text
.
|- SKILL.md
|- README.md
|- .shared/ui-aesthetics/
|- references/
|- .codex/skills/ui-aesthetics/
|- .claude/skills/ui-aesthetics/
|- .cursor/rules/
|- .windsurf/skills/
|- .windsurf/workflows/
|- .opencode/
|- .gemini/
|- .qoder/
|- .kiro/
`- .github/prompts/
```

## Maintenance

Recommended update flow:

1. edit `SKILL.md`
2. refresh `.shared/ui-aesthetics/` if the condensed guidance changed
3. update platform wrappers only when adapter format or invocation behavior changes
4. update this `README.md` when installation, supported platforms, or usage expectations change
