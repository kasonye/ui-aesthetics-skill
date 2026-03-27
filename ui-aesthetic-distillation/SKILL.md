---
name: ui-aesthetic-distillation
description: Distill, normalize, and apply high-aesthetic UI design prompts and guardrails from model conversations (for example Gemini) into reusable prompt templates, anti-pattern constraints, and measurable checklists. Use when building or critiquing web/app UI and you need stronger visual quality in layout, whitespace, hierarchy, typography, color, motion, consistency, accessibility, and responsive behavior.
---

# UI Aesthetic Distillation

## Workflow

1. Ingest raw distilled data from conversation transcripts or JSON/JSONL.
2. Normalize each item into a strict schema:
   - `scenario`
   - `positive_prompt`
   - `negative_taboo`
   - `checklist` (5-8 verifiable checks)
   - `category`
   - `source`
3. Rewrite ambiguous language into measurable constraints.
4. Compose output prompt using one template from `references/prompt-templates.md`.
5. Run the quality rubric in `references/quality-rubric.md` before final output.
6. Run script-based normalization and lint checks before using a rules file in production prompts.

## Output Contract

Always output four blocks in this order:

1. `Design Direction`
2. `Prompt` (directly usable by a coding/design model)
3. `Negative Constraints`
4. `Self-Check` (checkbox list)

## Hard Guardrails

- Use concrete constraints; avoid vague terms such as "高级感" or "更好看" without measurable definitions.
- Keep spacing on an 8px system unless a strong reason exists.
- Define type scale, contrast, and interaction states explicitly.
- Cap visual variants to protect consistency (button variants, card widths, shadow styles).
- Require accessibility checks (contrast, focus visible, touch target on mobile).
- Prefer mobile-first layout logic and explicit breakpoint behavior.

## Distillation Rules

- Prefer scenario-specific prompts over universal prompts.
- Pair every positive rule with one anti-pattern.
- Convert every anti-pattern into a lint-like check.
- Keep each checklist item binary (pass/fail).
- If source data conflicts, prefer the rule that is easier to verify objectively.

## Anti-Slop UI Policy

When generating UI prompts, require:

- Intentional typography choice (no default generic stack unless project already mandates it)
- Coherent color system (scale + semantic states)
- Controlled motion with duration/easing ranges
- Distinct layout composition (not center-stacked boilerplate by default)

## References

- Distillation playbook: `references/distillation-playbook.md`
- Prompt templates: `references/prompt-templates.md`
- Quality rubric: `references/quality-rubric.md`
- Distilled rules dataset: `references/rules-v1.json`
- Normalized dataset: `references/rules-v1-normalized.json`
- Current production dataset: `references/rules-v7-curated.json`
- Next-round prompts: `references/next-round-prompts.md`
- Gap-closing prompts: `references/next-round-prompts-v2-focus.md`
- Calibration prompts: `references/next-round-prompts-v3-calibration.md`
- Collection protocol: `references/collection-protocol-v2.md`
- Audit report: `references/v1-audit.md`
- Progress report: `references/v2-progress.md`
- Latest progress report: `references/v3-progress.md`
- Tooling update: `references/v4-tooling-update.md`
- Previous ingestion progress: `references/v5-progress.md`
- Latest ingestion progress: `references/v6-progress.md`
- Current ingestion progress: `references/v8-progress.md`

## Scripts

- Sanitize copied JSON/JSONL (fix markdown escaping):
  - `scripts/sanitize-jsonl.ps1 -InputPath <incoming> -OutputPath <sanitized>`
- Split mixed payload into rules/contrast/templates:
  - `scripts/split-mixed-jsonl.ps1 -InputPath <mixed-jsonl> -RulesOut <rules-jsonl> -ContrastOut <contrast-jsonl> -TemplatesOut <templates-jsonl>`
- Convert contrast pairs (`bad_prompt/good_prompt`) to rules:
  - `scripts/convert-contrast-to-rules.ps1 -InputPath <contrast-json> -OutputPath <rules-json> -Source <source-tag>`
- Merge multi-round data:
  - `scripts/merge-jsonl.ps1 -InputPaths <file1>,<file2> -OutputPath <merged-json>`
- Normalize incoming rules:
  - `scripts/normalize-rules.ps1 -InputPath <raw-json-or-jsonl> -OutputPath <normalized-json>`
- Lint normalized rules:
  - `scripts/lint-rules.ps1 -InputPath <normalized-json>`
