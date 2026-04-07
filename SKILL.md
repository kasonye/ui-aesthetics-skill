---
name: ui-aesthetics
description: Improve frontend UI/UX judgment for web interfaces by raising aesthetic quality across generation, review, and refactor tasks. Use when Codex or Claude Code needs to design a new page, section, or component; critique an existing frontend UI from a visual and UX perspective; or rewrite a page to improve hierarchy, composition, interaction quality, and responsiveness while avoiding generic AI-looking design.
---

# UI Aesthetics

## Overview

Use this skill to improve web UI work when the default output would likely be visually generic, weakly structured, or shallow in its UX critique.

This skill is framework-agnostic in v1. Focus on design judgment first, implementation second.

## Task Routing

Classify the request before acting:

1. **Generation**
   Use when the user wants a new page, section, or component.
2. **Review**
   Use when the user wants critique, findings, or UI/UX analysis of existing code or pages.
3. **Refactor**
   Use when the user wants the existing implementation changed directly.

If the request mixes review and refactor, review first, then choose rewrite depth before editing.

## Core Rules

- Establish a visual thesis before writing implementation code.
- Prioritize hierarchy, focus, rhythm, and information density before decorative styling.
- Prefer intentional contrast over uniformly weighted composition.
- Make desktop and mobile behavior explicit.
- Define interaction states when they affect clarity, trust, or usability.
- Raise design quality without making the result harder to read, maintain, or ship.

## Anti-Pattern Policy

Reject outputs that rely on:

- interchangeable center-stacked SaaS layouts
- evenly weighted cards with no clear emphasis
- decoration used in place of hierarchy
- glass, gradients, or shadows without structural purpose
- overuse of pills, borders, or large radii to fake polish
- desktop layouts that merely shrink on mobile
- "premium" styling that adds ornament without improving composition

Read `references/anti-patterns.md` when the output feels generic or over-styled.

## Workflow

### Generation

1. Infer the page role, audience, and information density.
2. Choose a visual direction before implementation.
3. Set hierarchy, composition, spacing rhythm, and emphasis.
4. Implement only after the direction is coherent.

### Review

1. Lead with the most severe UI/UX and aesthetic failures.
2. Prioritize structural problems over surface-level CSS comments.
3. Explain why each issue harms readability, focus, trust, or usability.
4. Use `references/review-rubric.md` to structure findings.

### Refactor

1. Decide whether the work is light polish, medium restructure, or full rebuild.
2. Preserve existing structure when issues are local.
3. Rebuild structure when the composition fundamentally fails.
4. Use `references/rewrite-playbook.md` before making broad visual changes.

## Self-Critique

Before final output, check:

- Is there a clear focal point?
- Is the hierarchy legible at a glance?
- Does the result still look like generic AI-generated UI?
- Is the information density appropriate for the page role?
- Are desktop and mobile layouts both coherent?
- Are interaction states sufficiently defined?
- Did the visual upgrade preserve maintainability?

## References

- Positive rules: `references/design-principles.md`
- Anti-patterns: `references/anti-patterns.md`
- Review rubric: `references/review-rubric.md`
- Rewrite guide: `references/rewrite-playbook.md`
- Distilled Gemini examples: `references/distilled-examples.md`
