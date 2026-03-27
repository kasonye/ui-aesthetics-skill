# Distilled Examples

## Use This File

Use this file to capture strong Gemini web outputs in a format that can be generalized into reusable rules.

## Capture Schema

Record each example with these fields:

1. **Task**
2. **Gemini Judgment**
3. **Observed Strengths**
4. **Abstracted Rules**
5. **Failure Signal** (optional when the example reveals an anti-pattern)

## Capture Template

~~~text
### Example <id>

Task:
- <original request>

Gemini Judgment:
- <summary of the design reasoning>

Observed Strengths:
- <specific reason the answer was stronger than baseline model output>

Abstracted Rules:
- <portable rule 1>
- <portable rule 2>

Failure Signal:
- <what generic model behavior this example helps prevent>
~~~

## Worked Example: New Landing Section

Task:
- Design a premium landing page section for a developer tool.

Gemini Judgment:
- The section should feel editorial rather than dashboard-like.
- The headline should dominate the first read and the supporting grid should recede.
- Accent color should be reserved for a single call to action and a few signal points.

Observed Strengths:
- The answer set a visual thesis before talking about implementation.
- It improved emphasis through composition rather than ornament.
- It avoided default equal-weight cards.

Abstracted Rules:
- When the page needs to feel premium, start by choosing the dominant emotional impression.
- Let supporting modules reinforce the hero instead of competing with it.
- Use accent color sparingly so emphasis remains meaningful.

Failure Signal:
- Prevents the common pattern where a generic hero and feature grid compete for the same visual weight.

## Worked Example: UI Review

Task:
- Review a marketing page and explain why it still looks generic.

Gemini Judgment:
- The real problem is not color choice but the absence of hierarchy and compositional tension.
- Repeated card shapes and equal spacing flatten the page.

Observed Strengths:
- The answer diagnosed a structural issue instead of recommending random styling tweaks.
- It connected visual weakness to user perception.

Abstracted Rules:
- Diagnose hierarchy before suggesting decorative changes.
- Treat repeated equal-weight modules as a signal to recompose the layout.

Failure Signal:
- Prevents low-value review output that lists CSS nits without explaining the user impact.
