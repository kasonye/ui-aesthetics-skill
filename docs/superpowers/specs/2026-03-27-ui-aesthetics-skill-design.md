# UI Aesthetics Skill Design

## Summary

Create a skill for Claude Code and Codex that improves frontend UI/UX judgment across generation, review, and refactoring tasks. The skill should distill reusable design behavior from high-quality Gemini outputs without attempting to reproduce Gemini as a model. The output should reduce generic "AI-looking" UI, raise visual quality, and remain practical for real project implementation.

## Goals

- Improve the aesthetic quality of generated web UI.
- Improve the quality of UI/UX-focused code review findings.
- Improve the quality of UI refactors by matching rewrite depth to the severity of the design problem.
- Encode transferable design judgment, not just style snippets or component recipes.
- Keep outputs compatible with real implementation constraints such as readability, responsiveness, and maintainability.

## Non-Goals

- Do not bind the skill to a specific frontend framework or component library in v1.
- Do not attempt model training or weight-level distillation.
- Do not optimize for visual novelty at the expense of usability or maintainability.
- Do not act as a replacement for product definition when the underlying requirements are unclear.

## Primary Use Cases

The skill should trigger for three classes of requests:

1. Generate new UI with stronger aesthetic direction.
2. Review existing frontend code or pages from a UI/UX and aesthetic perspective.
3. Refactor an existing page or component to improve visual hierarchy, composition, and interaction quality.

Representative user requests:

- "Make this page feel more premium."
- "Design a more refined landing page section."
- "Review this frontend code from a UI/UX perspective and refactor it."

## Product Positioning

This is a mixed-mode skill:

- Rule-driven enough to behave consistently.
- Example-driven enough to preserve high-quality taste signals.
- Process-driven enough to improve output across generation, review, and refactor workflows.

The skill should function as a frontend aesthetic augmenter rather than a design encyclopedia.

## Distillation Strategy

V1 should use manual sample collection from Gemini web sessions. The focus is not to copy code verbatim. The focus is to extract the design judgment behind strong answers.

Each sample should preserve:

1. Original task input.
2. Gemini's design reasoning and judgment.
3. The specific strengths recognized by the user.
4. Abstracted rules that can generalize beyond the original example.

The strongest learning signal is expected to come from:

- hierarchy decisions
- layout and spacing judgment
- information density tradeoffs
- typography tone and contrast choices
- anti-pattern recognition
- rewrite depth calibration

## Sample Collection Scope

Collect an initial set of 15 to 25 high-quality samples before treating the skill as stable.

Prioritize coverage across:

1. New UI generation.
2. Existing page improvement.
3. UI/UX code review.
4. Direction comparison between different visual approaches.
5. Failure cases and anti-pattern examples.

Failure cases are first-class input because they help build explicit anti-pattern constraints.

## Skill Structure

Recommended layout:

```text
ui-aesthetics/
|- SKILL.md
|- agents/
|  `- openai.yaml
`- references/
   |- design-principles.md
   |- anti-patterns.md
   |- review-rubric.md
   |- rewrite-playbook.md
   `- distilled-examples.md
```

### SKILL.md

Keep `SKILL.md` short and behavior-changing. It should define:

- what the skill does
- when the skill triggers
- how to route tasks
- what hard constraints always apply
- how to self-critique before final output

### references/design-principles.md

Store reusable positive design rules, especially the ones general models do not apply consistently on their own.

### references/anti-patterns.md

Store explicit anti-patterns associated with generic AI UI. This file should be treated as a hard constraint source, not optional inspiration.

### references/review-rubric.md

Store the review dimensions and failure language used during critique tasks.

### references/rewrite-playbook.md

Store rewrite-depth guidance so the model can choose between light polish, medium restructuring, and full visual rebuild.

### references/distilled-examples.md

Store hand-curated distilled examples from Gemini sessions, emphasizing design judgment and abstraction rather than raw output volume.

## Core Behavior Model

The skill should always follow this top-level flow:

1. Classify the task.
2. Form a visual judgment.
3. Choose an intervention depth.
4. Execute.
5. Self-critique.

This sequence is intended to force design reasoning before implementation.

## Task Routing

### Generation Path

Use when the user wants a new page, section, or component.

Expected behavior:

1. Infer page role, audience, and information density.
2. Define a visual direction before implementation.
3. Set hierarchy, composition, spacing rhythm, emphasis, and interaction tone.
4. Implement only after the design direction is coherent.

### Review Path

Use when the user asks for critique or review.

Expected behavior:

1. Lead with the most severe UI/UX and aesthetic issues.
2. Prioritize structural problems over minor cosmetic nitpicks.
3. Explain why a problem hurts readability, focus, hierarchy, trust, or usability.
4. Make the findings actionable enough to guide a refactor.

### Refactor Path

Use when the user wants the page or component changed directly.

Expected behavior:

1. Decide whether the work is light polish, medium restructure, or full redesign.
2. Preserve existing structure when the issues are local.
3. Rebuild structure when the current composition fundamentally fails.
4. Match the amount of change to the severity of the design problem.

## Core Taste Rules

These rules belong in the skill body and should guide every task:

- Establish a visual thesis before implementing UI.
- Solve hierarchy, focus, rhythm, and density before adding decoration.
- Prefer intentional contrast over evenly weighted composition.
- Preserve clarity and responsiveness while improving aesthetics.
- Make interaction states and responsiveness explicit rather than implied.
- Avoid defaulting to bland center-stacked layouts and interchangeable SaaS patterns.

## Anti-Pattern Policy

The skill should explicitly guard against:

- Flat visual hierarchy where every card or block has similar weight.
- Decorative gradients, glass effects, or shadows without a structural purpose.
- Overuse of rounded corners, borders, or pills as a substitute for hierarchy.
- Pages with no clear focal point or primary call to action.
- Even spacing that creates visual monotony instead of rhythm.
- Desktop layouts that are merely compressed for mobile.
- Generic "premium" styling that adds ornament without improving composition.

## Self-Critique Contract

Before finalizing, the skill should check:

- Is there a clear focal point?
- Is the hierarchy legible at a glance?
- Does the result still look like generic AI-generated UI?
- Is the information density appropriate for the page role?
- Are desktop and mobile layouts both coherent?
- Are interaction states sufficiently defined?
- Did aesthetic gains come at an unreasonable maintainability cost?

## V1 Success Criteria

V1 should be considered successful if it reliably causes Claude Code and Codex to:

- produce less generic and more intentional web UI
- identify structural UI/UX issues during review instead of superficial CSS comments
- choose a sensible rewrite depth during refactors
- preserve engineering practicality while raising visual quality

## Open Questions Deferred From V1

- Whether to introduce framework-specific references later.
- Whether to add scripts for evaluating or linting aesthetic rules.
- Whether to split the skill into separate generation and review variants after observing usage patterns.

## Implementation Notes For The Future Skill

- The first implementation should optimize for clarity and trigger quality, not breadth.
- The reference files should be designed for incremental sample ingestion.
- The skill should treat anti-pattern avoidance as equally important as positive direction.
- The skill should remain framework-agnostic in the main body unless later evidence shows that this reduces effectiveness too much.
