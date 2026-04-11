# UI Aesthetics

English | [简体中文](./README.zh-CN.md)

[![GitHub Repo](https://img.shields.io/badge/github-repo-blue?logo=github)](https://github.com/kasonye/ui-aesthetics-skill)
[![Linux DO](https://img.shields.io/badge/Linux-DO-f5b301?style=flat-square&labelColor=1c1c1e&logo=data:image/svg%2bxml;base64,PHN2ZyB3aWR0aD0iMTIwIiBoZWlnaHQ9IjEyMCIgdmlld0JveD0iMCAwIDEyMCAxMjAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGNsaXBQYXRoIGlkPSJhIj48Y2lyY2xlIGN4PSI2MCIgY3k9IjYwIiByPSI0NyIvPjwvY2xpcFBhdGg+PGNpcmNsZSBmaWxsPSIjZjBmMGYwIiBjeD0iNjAiIGN5PSI2MCIgcj0iNTAiLz48cmVjdCBmaWxsPSIjMWMxYzFlIiBjbGlwLXBhdGg9InVybCgjYSkiIHg9IjEwIiB5PSIxMCIgd2lkdGg9IjEwMCIgaGVpZ2h0PSIzMCIvPjxyZWN0IGZpbGw9IiNmMGYwZjAiIGNsaXAtcGF0aD0idXJsKCNhKSIgeD0iMTAiIHk9IjQwIiB3aWR0aD0iMTAwIiBoZWlnaHQ9IjQwIi8+PHJlY3QgZmlsbD0iI2ZmYjAwMyIgY2xpcC1wYXRoPSJ1cmwoI2EpIiB4PSIxMCIgeT0iODAiIHdpZHRoPSIxMDAiIGhlaWdodD0iMzAiLz48L3N2Zz4=)](https://linux.do/)
[![Release](https://img.shields.io/github/v/tag/kasonye/ui-aesthetics-skill?sort=semver&style=flat-square&label=release)](https://github.com/kasonye/ui-aesthetics-skill/releases/latest)
[![GitHub Repo stars](https://img.shields.io/github/stars/kasonye/ui-aesthetics-skill?style=flat-square)](https://github.com/kasonye/ui-aesthetics-skill/stargazers)

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

> Use the repository skill to create a product landing page. Make the colors bright and attention-grabbing, add a bit of motion and lighting, and keep some dimensional depth.

<table>
  <tr>
    <td width="50%" align="center">
      <strong>Generated with Codex + GPT-5.4</strong>
      <br />
      <img src="./assets/readme/codex-gpt54-showcase.png" alt="Product landing page example generated with Codex and GPT-5.4" width="100%" />
    </td>
    <td width="50%" align="center">
      <strong>Generated with Claude Code + MiniMax M2.7</strong>
      <br />
      <img src="assets/readme/cc-minimax-m27-showcase.png" alt="Product landing page example generated with Claude Code and MiniMax M2.7" width="100%" />
    </td>
  </tr>
</table>
<table>
  <tr>
    <td width="50%" align="center">
      <strong>Generated with Claude Code + Claude Opus 4.6</strong>
      <br />
      <img src="./assets/readme/cc-claude-opus-46-showcase.png" alt="Product landing page example generated with Claude Code and Claude Opus 4.6" width="100%" />
    </td>
    <td width="50%" align="center">
      <strong>Generated with Claude Code + GLM-5.1</strong>
      <br />
      <img src="assets/readme/cc-glm-51-showcase.png" alt="Product landing page example generated with Claude Code and GLM-5.1" width="100%" />
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
|- README.zh-CN.md
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
4. update both `README.md` and `README.zh-CN.md` when installation, supported platforms, or usage expectations change
