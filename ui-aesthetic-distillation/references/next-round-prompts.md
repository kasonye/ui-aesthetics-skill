# Next-Round Prompts

Use this batch to improve measurability for weaker items (current warnings: id 13/14/17/18).

## Prompt A: Make Typography Rules Fully Measurable

```text
请重写“数字与数据表展示”和“多语言混排”两条规则，要求：
- 每条都给出最少 3 个明确数值阈值（例如字号、字重、列间距、对齐、最大偏差）
- 给出 1 个错误示例和 1 个正确示例
- checklist 必须是 6 条，全部可二值判断（是/否）
输出 JSON。
```

## Prompt B: Make Status Color Rules Measurable

```text
请重写“语义化状态颜色”规则，要求：
- 给出成功/警告/危险/信息四类状态色的亮度区间与最小对比度要求
- 指定图标与文本组合规则（图标尺寸、文字字号、间距）
- 输出 bad_prompt/good_prompt/delta/checklist
checklist 6 条，必须包含 WCAG 对比度条目。
```

## Prompt C: Make Gradient Rules Measurable

```text
请重写“渐变色使用”规则，要求：
- 指定色相跨度范围、饱和度范围、角度范围
- 指定最大色标节点数量
- 指定渐变可使用区域占比上限
输出 JSON，并包含 negative_taboo 与 6 条 checklist。
```

## Prompt D: Fill Missing Product Scenarios

```text
请新增 12 条规则，覆盖以下场景：
- 搜索结果页
- 空状态页
- 错误页
- 新手引导
- 多步骤结账流程
- 设置页（隐私权限）
- 文件上传页
- 聊天界面
- 日历与时间选择器
- 地图与定位界面
- 通知中心
- 数据导出/报表页
每条都输出 category/scene/positive_prompt/negative_taboo/checklist/source。
checklist 6 条。
```
