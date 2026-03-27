# V5 Progress (After Round16 Batch1)

## Ingestion Summary

- Incoming file: `references/round16-batch1.raw.jsonl`
- Sanitized file: `references/round16-batch1.sanitized.jsonl`
- Split result: 10 rules + 2 contrast + 0 templates
- Converted contrast rules: 2

## Dataset Output

- Merged raw dataset: `references/rules-v4-raw.json` (54)
- Normalized dataset: `references/rules-v4-normalized.json` (54)
- Curated production dataset: `references/rules-v4-curated.json` (54)

## Quality Gate

- Items: 54
- Critical issues: 0
- Warnings: 0

## Category Distribution

- 组件一致性 (Consistency): 11
- 可访问性 (Accessibility): 8
- 响应式 (Responsiveness): 7
- 配色 (Color): 5
- 布局 (Layout): 5
- 字体 (Typography): 5
- 留白 (Whitespace): 4
- 动效 (Animation): 4
- 层级 (Hierarchy): 3
- 场景化 (Vertical): 2

## Notes

- Added mixed-payload ingestion tooling (`sanitize-jsonl.ps1`, `split-mixed-jsonl.ps1`).
- Updated category normalization to better handle Navigation/Action/Form/A11y aliases.
- Updated lint measurability regex to reduce false positives for accessibility constraints.
