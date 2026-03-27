# Distillation Playbook

## Goal

Distill high-aesthetic UI know-how from a stronger design model into reusable constraints that another model can execute reliably.

## Phase 1: Rule Extraction

Use this prompt:

```text
你是资深 UI 设计总监。目标：提炼“高审美 UI”可执行提示词规则。
要求：
- 输出必须可操作、可检查，避免空泛形容词
- 每条规则包含：场景、正向写法、反向禁忌、检查清单
- 覆盖：布局、留白、层级、字体、配色、动效、组件一致性、可访问性、响应式
先输出 30 条规则（JSON）。
```

## Phase 2: Contrast Distillation

Use this prompt:

```text
针对每个场景输出：
- bad_prompt
- good_prompt
- delta（按视觉原则拆解差异）
- checklist（5-8条）
输出 JSON，不要解释。
```

## Phase 3: Rewrite Distillation

Use this prompt:

```text
我给你一条普通 UI 提示词，你重写为高审美版本：
- 保留业务目标
- 增加视觉与交互约束
- 增加负面约束
输出 {before, after, added_constraints, removed_ambiguity, measurable_checks}
```

## Phase 4: Template Compression

Use this prompt:

```text
将规则压缩为 12 个母提示模板：
- 适用任务
- Prompt 模板（含变量）
- Negative 模板
- 自检清单
输出 JSON。
```

## Data Format

Store each item as JSONL:

```json
{"scenario":"dashboard","category":"layout","positive_prompt":"...","negative_taboo":"...","checklist":["..."],"source":"gemini_turn_07"}
```

## Data Hygiene

- Remove chain-of-thought fragments and tool tags.
- Normalize units (`px`, ratios, durations).
- Merge duplicate checks.
- Ensure each checklist item is pass/fail.
- Keep 5-8 checks per item.

## Minimum Coverage

- Rule items: 50+
- Contrast pairs: 40+
- Rewrite pairs: 30+
- Templates: 12-20
