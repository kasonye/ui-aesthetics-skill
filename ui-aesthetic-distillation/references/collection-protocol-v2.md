# Collection Protocol V2

## Objective

Collect a larger, more measurable rule set from Gemini and keep it machine-usable without manual cleanup.

## Session Plan

1. Round 1: Weak-item rewrite (id 13/14/17/18)
2. Round 2: New scenario coverage (12 scenarios)
3. Round 3: bad/good contrast pairs (at least 20)
4. Round 4: template compression (12-20 mother templates)

## Output Format

Always request JSONL with this schema:

```json
{"category":"...","scene":"...","positive_prompt":"...","negative_taboo":"...","checklist":["..."],"source":"gemini_round_x"}
```

## Local Processing Pipeline

```powershell
# 1) Optional: sanitize copied chat payloads
scripts/sanitize-jsonl.ps1 -InputPath references/incoming-mixed.jsonl -OutputPath references/incoming-mixed-sanitized.jsonl

# 2) Optional: split mixed payload into rules/contrast/templates
scripts/split-mixed-jsonl.ps1 -InputPath references/incoming-mixed-sanitized.jsonl -RulesOut references/round-rules.jsonl -ContrastOut references/round-contrast.jsonl -TemplatesOut references/round-templates.jsonl

# 3) Optional: convert contrast-format rounds
scripts/convert-contrast-to-rules.ps1 -InputPath references/round-contrast.jsonl -OutputPath references/round-contrast-rules.json -Source gemini_round_contrast

# 4) Merge multiple rounds
scripts/merge-jsonl.ps1 -InputPaths references/rules-v3-curated.json,references/round-rules.jsonl,references/round-contrast-rules.json -OutputPath references/rules-next-raw.json

# 5) Normalize
scripts/normalize-rules.ps1 -InputPath references/rules-next-raw.json -OutputPath references/rules-next-normalized.json

# 6) Lint
scripts/lint-rules.ps1 -InputPath references/rules-next-normalized.json
```

## Acceptance Criteria

- Rule count >= 42
- Checklist count per item in [5, 8]
- Measurability warnings <= 2
- Responsive + Accessibility combined >= 10 items
- Every item contains one positive rule + one negative taboo

## Naming Convention

- `references/round1-weak-items.jsonl`
- `references/round2-new-scenarios.jsonl`
- `references/round3-contrast.jsonl`
- `references/rules-v2-raw.json`
- `references/rules-v2-normalized.json`
- `references/round3-contrast-rules.json`
- `references/incoming-mixed.jsonl`
- `references/incoming-mixed-sanitized.jsonl`
- `references/round-rules.jsonl`
- `references/round-contrast.jsonl`
- `references/round-templates.jsonl`
