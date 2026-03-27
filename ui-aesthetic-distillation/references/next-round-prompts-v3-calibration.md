# Next Round Prompts V3 (Calibration)

Use these prompts to improve consistency after large mixed-round ingestion.

## Prompt A: Conflict Merge With Numeric Priority

```text
请对同一 scene 的多条规则做冲突合并，输出唯一规则。
要求：
- 仅输出 JSONL
- 字段：category, scene, positive_prompt, negative_taboo, checklist, source
- checklist 固定 6 条
- positive_prompt 至少 5 个量化约束
- 明确说明保留了哪个值、删除了哪个冲突值（写入 positive_prompt 最后一句）
source=gemini_round16_conflict_resolve
输出 24 行
```

## Prompt B: Token + Runtime Constraint Hybrid

```text
输出 JSONL 规则，要求每条同时包含：
- design token 约束（例如 --space-16 / --radius-8）
- runtime 约束（例如 200ms / 4.5:1 / 44x44）
字段：category, scene, positive_prompt, negative_taboo, checklist, source
source=gemini_round16_token_runtime
输出 20 行
```

## Prompt C: State Matrix Hardening

```text
围绕 Button/Input/Modal/Table/Dropdown/Toast 输出状态矩阵规则。
每条必须包含：default, hover, active, disabled, focus-visible, error（如不适用写 N/A 并给理由）。
必须给出至少 4 个具体数值或颜色值。
输出 JSONL，字段：category, scene, positive_prompt, negative_taboo, checklist, source
source=gemini_round16_state_hardening
输出 18 行
```

## Prompt D: Accessibility Adversarial Cases

```text
请只输出“高风险可访问性场景”规则：
- 键盘陷阱
- 屏幕阅读器误读
- 对比度边界值
- prefers-reduced-motion
- 图表替代文本
每条给出失败条件与修复条件（写在 negative_taboo 与 positive_prompt）。
输出 JSONL，字段固定。
source=gemini_round16_a11y_adversarial
输出 16 行
```

## Prompt E: Vertical-Specific Quality Upgrade

```text
针对 SaaS/Finance/E-commerce/Content/Education 各输出 6 条规则（共 30 条）。
要求：
- 每条必须包含行业特有约束 + 通用审美约束
- 至少 4 个量化约束
- checklist 固定 6 条
输出 JSONL，字段固定。
source=gemini_round16_vertical_upgrade
```
