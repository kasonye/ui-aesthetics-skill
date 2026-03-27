# Next Round Prompts V4 (Final Fill)

## Final Round Master Prompt

```text
你是 UI 审美规则蒸馏器。请只输出 JSONL（每行一个 JSON 对象），不要输出 markdown、注释或解释。

目标：做“最后一轮补齐”，重点补当前薄弱类别。

输出总数：30 行，且必须满足配额：
1) category=场景化 (Vertical) -> 18 行
2) category=层级 (Hierarchy) -> 10 行
3) category=响应式 (Responsiveness) 或 可访问性 (Accessibility) -> 2 行（任意分配）

字段必须严格为：
category, scene, positive_prompt, negative_taboo, checklist, source

每行 schema 示例：
{"category":"场景化 (Vertical)","scene":"SaaS Billing Plan Switcher","positive_prompt":"...","negative_taboo":"...","checklist":["...","...","...","...","...","..."],"source":"gemini_round18_final_fill"}

硬性约束：
- checklist 固定 6 条，且是可验证的 pass/fail 句子（建议以 Is... 开头）。
- positive_prompt 每条至少 5 个可量化约束（px/ms/比例/颜色/断点/对比度/z-index 等）。
- negative_taboo 必须是“明确禁止项”，不能写泛泛建议。
- source 固定为 gemini_round18_final_fill。
- 所有 scene 必须唯一，不得重复，不得与“Button/Input/Modal/Table/Dropdown/Toast”状态矩阵重复。
- 不要输出 bad_prompt/good_prompt/delta 字段。

JSON 格式安全要求（必须遵守）：
- 只用双引号包裹 JSON 字符串。
- 字符串内部不要出现未转义双引号；如需表达 role/menu 等，改写为 role=menu 或使用单引号语义表达，不要嵌套双引号。
- 不要使用键名中的转义下划线（必须是 positive_prompt，不是 positive\_prompt）。
- 不要在行尾加逗号，不要输出空行。

内容约束（最后一轮专用）：
- Vertical 18 行需覆盖：SaaS、Finance、E-commerce、Content、Education，各至少 3 行。
- Hierarchy 10 行要强调：信息主次、标题/副标题权重、卡片层级、导航层级、数据可视化层级。
- 至少 8 行包含移动端断点行为（例如 <=768px / <=1024px）。
- 至少 8 行包含可访问性硬约束（如 4.5:1、focus-visible、aria-*、键盘可达）。

为了减少冲突，若同一 scene 存在多个可能值，统一采用“更易验证”的值，并在 positive_prompt 末句写：
Resolved conflict: kept X, removed Y.

请直接输出 30 行 JSONL。
```

## Optional Backup Prompt (If Master Prompt Fails JSON Validity)

```text
请仅输出 10 行 JSONL，字段固定为：
category, scene, positive_prompt, negative_taboo, checklist, source
source 固定 gemini_round18_final_fill_retry

只生成 category=场景化 (Vertical) 和 category=层级 (Hierarchy)。
每行 checklist 固定 6 条，每条必须含可测量词（px/ms/%/ratio/breakpoint/contrast/z-index）。
不要输出任何额外文字。
```
