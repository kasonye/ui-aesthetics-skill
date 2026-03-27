# Quality Rubric

Use this rubric to evaluate each generated UI prompt before delivery.

## Scoring

Score each dimension from 0 to 5.

- `0`: missing
- `1-2`: weak or vague
- `3`: acceptable
- `4`: strong
- `5`: excellent and measurable

Pass threshold: total score >= 30/40 and no dimension below 3.

## Dimensions

1. Layout Structure
- Explicit grid, container width, and composition ratio defined.

2. Whitespace System
- 8px-based spacing scale and macro/micro spacing logic defined.

3. Visual Hierarchy
- Clear primary/secondary/tertiary emphasis via size, color, and elevation.

4. Typography System
- Heading/body/data typography and line-height constraints defined.

5. Color System
- Palette scale + semantic states + dark-mode handling defined.

6. Motion Behavior
- Duration/easing/interaction triggers are concrete and restrained.

7. Component Consistency
- Button/input/modal/icon specs are unified and state-complete.

8. Accessibility and Responsiveness
- Contrast, focus-visible, touch targets, breakpoints, and mobile-first behavior defined.

## Rejection Triggers

Reject output if any of these exists:

- Vague directives without measurable thresholds.
- Missing negative constraints.
- No self-check list.
- No accessibility criteria.
- Contradictory rules in one prompt.

## Final Output Format

```text
Score: 34/40
Weakest Dimension: Motion Behavior (3/5)
Fixes Applied: Added 150-220ms duration range and ease-out curve
```
