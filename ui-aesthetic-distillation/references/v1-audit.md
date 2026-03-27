# Rules V1 Audit

## Summary

- Dataset: `references/rules-v1-normalized.json`
- Total items: 30
- Critical issues: 0
- Warnings: 4
- Checklist count per item: fixed to 5

## Category Coverage

- 布局 (Layout): 4
- 留白 (Whitespace): 3
- 层级 (Hierarchy): 3
- 字体 (Typography): 4
- 配色 (Color): 4
- 动效 (Animation): 3
- 组件一致性 (Consistency): 4
- 可访问性 (Accessibility): 3
- 响应式 (Responsiveness): 2

## Warning Items (Need More Measurable Constraints)

- id 13: 数字与数据表展示
- id 14: 多语言混合排版
- id 17: 语义化状态颜色
- id 18: 渐变色使用

## Priority Actions

1. Re-distill warning items with numeric thresholds and binary checks.
2. Add missing product scenarios listed in `references/next-round-prompts.md`.
3. Keep new data in JSONL and run:
   - `scripts/normalize-rules.ps1`
   - `scripts/lint-rules.ps1`

## Acceptance Gate for V2

- Total rules >= 42
- Every item checklist count in [5, 8]
- Measurability warnings <= 2
- Responsive category >= 4 items
