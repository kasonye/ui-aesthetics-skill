# Prompt Templates

Use one template per task. Fill all placeholders.

## 1. Landing Hero

```text
设计一个 {brand_tone} 的落地页首屏。
布局：左 {left_ratio}% 文案 + 右 {right_ratio}% 视觉主体，垂直居中。
字体：H1={h1_size}px, line-height={h1_lh}，正文={body_size}px。
颜色：中性色为主，主色仅用于 CTA 和关键强调。
动效：首屏元素采用 {enter_duration}ms ease-out 渐入上移 8px。
```

Negative:

```text
禁止全居中堆叠；禁止主色大面积铺底；禁止无对比度 CTA。
```

## 2. Dashboard

```text
生成数据仪表盘，采用 {grid_cols} 列网格与 {gutter}px 间距。
主区与侧区比例 {main_ratio}:{side_ratio}，卡片宽度规格不超过 {card_width_variants} 种。
数字列使用 tabular figures 且右对齐。
```

## 3. Pricing Page

```text
设计定价页，3-4 个价格卡片，主推荐卡片仅一个。
卡片内边距 >= {card_padding}px，标题与价格层级清晰。
CTA 层级：Primary 1 个，Secondary 若干。
```

## 4. Auth Form

```text
设计登录/注册表单。
输入框高度 {input_height}px，label 与输入框间距 8px，focus ring 2px。
错误信息 {error_size}px 且位置固定于输入框下方。
```

## 5. Blog Detail

```text
设计图文详情页，正文宽度限制 {content_max_width}px，单行字符 60-75。
正文颜色使用深灰而非纯黑，行高 1.5-1.7。
```

## 6. Mobile Settings

```text
设计移动端设置页，触控热区 >= 44x44px，相邻热区间隔 >= 8px。
导航与开关组件保持统一高度和行间距。
```

## 7. Modal/Drawer

```text
统一弹窗系统：遮罩 rgba(0,0,0,{overlay_alpha}) + backdrop blur {blur}px。
关闭按钮右上角，主操作右下角，max-height 限制并内部滚动。
```

## 8. Data Table

```text
设计数据表：列标题与数据层级明确，数字列右对齐并采用等宽数字。
排序、筛选、分页交互状态完整。
```

## 9. Dark Mode

```text
生成深色主题：背景使用带色相倾向的深灰，不用纯黑。
层级通过亮度抬升区分，强调色降低饱和度避免荧光感。
```

## 10. Design System Seed

```text
输出最小设计系统：
- spacing: 8px scale
- type: H1-H6 + body + caption
- color: neutral + primary + semantic states
- radius, shadow, border, motion tokens
```

## 11. E-commerce PDP

```text
设计商品详情页：媒体区与信息区采用非对称布局。
购买路径（规格、数量、加入购物车、立即购买）在首屏可见。
强调信息层级与可信元素（评价、保障、配送）顺序。
```

## 12. Portfolio Homepage

```text
设计作品集首页，强调视觉节奏与留白层级。
首屏呈现明确叙事主线，项目卡片风格统一，hover 反馈 150-220ms。
```

## Universal Self-Check

- Grid and spacing are measurable.
- Typography scale is explicit.
- Color and contrast are explicit.
- Component states are complete.
- Motion has constrained duration and easing.
- Accessibility and responsive behavior are explicit.
