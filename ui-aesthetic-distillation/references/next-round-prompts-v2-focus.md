# Next Round Focus Prompts (V2 Gap Closing)

## Prompt 1: Fix the 4 Measurability Warnings

```text
请重写以下4条规则，要求每条必须包含至少4个可量化参数（如 px、ms、比例、对比度阈值），并输出 6 条二值 checklist：
1) 数字与数据表展示
2) 多语言混合排版
3) 语义化状态颜色
4) 渐变色使用
输出 JSONL，字段固定为：category, scene, positive_prompt, negative_taboo, checklist, source。
```

## Prompt 2: Add Accessibility Rules (+2)

```text
请新增 2 条“可访问性”规则，场景限定：
- 表单错误恢复与辅助提示
- 数据图表的无障碍替代表达
要求：
- 每条包含 WCAG 对比度或键盘导航约束
- 每条 checklist 6 条，全部可二值判断
输出 JSONL。
```

## Prompt 3: Add Responsive Rules (+2)

```text
请新增 2 条“响应式”规则，场景限定：
- 多列卡片在断点下的重排策略
- 导航栏在移动端的折叠与展开
要求：
- 必须包含明确断点（如640/768/1024）
- 必须包含字体或间距流式策略（如 clamp）
- checklist 6 条
输出 JSONL。
```

## Prompt 4: Add Mixed Scenario Rules (+4 optional)

```text
请新增 4 条规则，优先场景：搜索结果页、错误页、空状态页、聊天界面。
要求覆盖：布局、层级、可访问性、响应式至少各1条。
输出 JSONL。
```
