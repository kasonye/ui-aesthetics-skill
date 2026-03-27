# V4 Tooling Update

## Added Scripts

- `scripts/sanitize-jsonl.ps1`
- `scripts/split-mixed-jsonl.ps1`

## Purpose

- Sanitize chat-copied JSONL with markdown escape artifacts.
- Split mixed payloads into rules, contrast pairs, and templates before ingestion.

## Updated Docs

- `SKILL.md` script list updated.
- `references/collection-protocol-v2.md` now includes sanitize/split steps.
- `references/next-round-prompts-v3-calibration.md` added.

## Current Production Dataset Health

- Dataset: `references/rules-v3-curated.json`
- Lint: 42 items, 0 critical issues, 0 warnings.
