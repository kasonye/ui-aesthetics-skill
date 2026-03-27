# UI Aesthetics Skill Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a framework-agnostic `ui-aesthetics` skill that improves web UI generation, review, and refactor quality for Claude Code and Codex.

**Architecture:** Implement the skill as a small, behavior-focused `SKILL.md` plus five reference files that hold reusable design principles, anti-patterns, review criteria, rewrite-depth guidance, and distilled Gemini sample formats. Use the Codex skill scaffolding and validation scripts to generate a valid skill folder and keep metadata in sync with the final skill body.

**Tech Stack:** Markdown, YAML, PowerShell, Python skill tooling (`init_skill.py`, `generate_openai_yaml.py`, `quick_validate.py`)

---

## File Structure

### Planned Files

- Create: `ui-aesthetics/SKILL.md`
- Create: `ui-aesthetics/agents/openai.yaml`
- Create: `ui-aesthetics/references/design-principles.md`
- Create: `ui-aesthetics/references/anti-patterns.md`
- Create: `ui-aesthetics/references/review-rubric.md`
- Create: `ui-aesthetics/references/rewrite-playbook.md`
- Create: `ui-aesthetics/references/distilled-examples.md`

### File Responsibilities

- `ui-aesthetics/SKILL.md`: Trigger metadata, task routing, hard rules, and self-critique loop.
- `ui-aesthetics/agents/openai.yaml`: UI-facing metadata for discovery and invocation.
- `ui-aesthetics/references/design-principles.md`: Positive design rules and composition heuristics.
- `ui-aesthetics/references/anti-patterns.md`: Explicit "AI-looking UI" failures to avoid.
- `ui-aesthetics/references/review-rubric.md`: Ordered review dimensions and severity language.
- `ui-aesthetics/references/rewrite-playbook.md`: Decision rules for light polish vs restructure vs rebuild.
- `ui-aesthetics/references/distilled-examples.md`: Manual Gemini intake format and worked distilled examples.

### Task 1: Scaffold The Skill Folder

**Files:**
- Create: `ui-aesthetics/SKILL.md`
- Create: `ui-aesthetics/agents/openai.yaml`
- Create: `ui-aesthetics/references/`

- [ ] **Step 1: Initialize the skill skeleton**

Run:

```powershell
python "C:\Users\Kason\.codex\skills\.system\skill-creator\scripts\init_skill.py" ui-aesthetics `
  --path "." `
  --resources references `
  --interface display_name="UI Aesthetics" `
  --interface short_description="Upgrade web UI generation, review, and refactors" `
  --interface default_prompt="Use $ui-aesthetics to improve this web UI's visual direction, hierarchy, and UX."
```

Expected:
- A new `ui-aesthetics/` directory exists.
- `ui-aesthetics/SKILL.md` exists with template content.
- `ui-aesthetics/agents/openai.yaml` exists.
- `ui-aesthetics/references/` exists.

- [ ] **Step 2: Verify the generated file tree**

Run:

```powershell
Get-ChildItem -Recurse -Force ".\ui-aesthetics"
```

Expected:
- Output lists `SKILL.md`, `agents\openai.yaml`, and `references\`.

- [ ] **Step 3: Commit the scaffold**

Run:

```powershell
git add ui-aesthetics
git commit -m "chore: scaffold ui aesthetics skill"
```

Expected:
- Commit succeeds with only the new scaffolded skill files staged.

### Task 2: Write The Core Skill Behavior

**Files:**
- Modify: `ui-aesthetics/SKILL.md`

- [ ] **Step 1: Replace the generated `SKILL.md` with the final skill body**

Write this file:

```markdown
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
```

- [ ] **Step 2: Validate the skill frontmatter**

Run:

```powershell
python "C:\Users\Kason\.codex\skills\.system\skill-creator\scripts\quick_validate.py" ".\ui-aesthetics"
```

Expected:
- Output contains `Skill is valid!`

- [ ] **Step 3: Commit the skill body**

Run:

```powershell
git add ui-aesthetics/SKILL.md
git commit -m "feat: define ui aesthetics skill behavior"
```

Expected:
- Commit succeeds with only `ui-aesthetics/SKILL.md` changed.

### Task 3: Add Positive Rules And Anti-Patterns

**Files:**
- Create: `ui-aesthetics/references/design-principles.md`
- Create: `ui-aesthetics/references/anti-patterns.md`

- [ ] **Step 1: Write `design-principles.md`**

Write this file:

```markdown
# Design Principles

## Use This File

Read this file when the task needs stronger visual direction, when a layout feels generic, or when the user asks for a more refined or premium result.

## Principle 1: Start With A Visual Thesis

- Name the page's dominant impression before implementing it.
- Decide whether the interface should feel editorial, product-heavy, atmospheric, crisp, or restrained.
- Keep the entire composition aligned with that thesis.

## Principle 2: Build Hierarchy Before Decoration

- Decide what should be seen first, second, and third.
- Use size, contrast, spacing, alignment, and density to communicate importance.
- Fix weak hierarchy before introducing color accents, gradients, or shadows.

## Principle 3: Control Information Density

- Match density to the page role.
- Hero sections need fewer simultaneous ideas and stronger emphasis.
- Dashboards and settings surfaces can carry more density, but only with clear grouping and contrast.

## Principle 4: Create Rhythm, Not Uniformity

- Avoid layouts where every block has the same width, weight, spacing, and treatment.
- Use repetition selectively and break it deliberately.
- Let one area dominate and let supporting areas recede.

## Principle 5: Use Color Structurally

- Let color separate roles, not merely decorate surfaces.
- Reserve the strongest accent for actions or emphasis.
- Keep neutrals stable so accent color carries meaning.

## Principle 6: Make Typography Do Real Work

- Use type scale and weight to create hierarchy before adding extra containers.
- Short, high-priority copy should read with confidence and restraint.
- Reduce filler text before shrinking type into illegibility.

## Principle 7: Motion And Interaction Must Clarify

- Use motion to support orientation, emphasis, or feedback.
- Keep transitions controlled and brief.
- Do not add motion where a static hierarchy would solve the same problem more clearly.

## Principle 8: Design Mobile Intentionally

- Recompose layouts for mobile instead of compressing desktop structure.
- Protect tap targets, spacing, and scannability.
- Preserve the primary focal point on the first viewport.

## Principle 9: Respect Implementation Reality

- Prefer a strong, coherent system over many one-off flourishes.
- Keep components reusable and states explicit.
- If a styling move is hard to maintain, it needs stronger justification.
```

- [ ] **Step 2: Write `anti-patterns.md`**

Write this file:

```markdown
# Anti-Patterns

## Use This File

Read this file when a result feels like generic AI UI, when "premium" styling is becoming superficial, or when a review needs concrete language for visual failures.

## Flat Hierarchy

Symptoms:

- every card has similar weight
- no section dominates the viewport
- headings, body text, and metadata feel visually interchangeable

Corrective move:

- pick one focal area
- increase contrast between primary and secondary content
- reduce the number of equally loud surfaces

## Center-Stacked Generic SaaS Layout

Symptoms:

- headline, paragraph, and button centered above a predictable card grid
- no compositional tension
- layout could belong to any startup in any category

Corrective move:

- choose a stronger alignment system
- vary block widths and emphasis
- make the page structure respond to the actual content

## Decorative Polish Without Structure

Symptoms:

- gradients, blur, or shadow are doing most of the work
- the page still looks weak when stripped to grayscale
- ornament is hiding poor hierarchy

Corrective move:

- inspect the layout without decoration
- fix focus, grouping, and spacing before reintroducing effects

## Radius And Border Overload

Symptoms:

- every surface has heavy rounding
- borders are used on almost everything
- the interface looks padded but not purposeful

Corrective move:

- reduce treatments to a small system
- use contrast, spacing, and typography to create separation

## Monotone Card Rhythm

Symptoms:

- repeated cards create a wallpaper effect
- eye movement has no clear sequence
- supporting content competes with the primary message

Corrective move:

- vary scale or layout role
- compress secondary information
- give one module dominance and let the rest support it

## Fake Premium Styling

Symptoms:

- dark background plus glow plus gradient equals "premium"
- expensive-looking surfaces with weak copy hierarchy
- dramatic styling but no strong action path

Corrective move:

- define what should feel premium: restraint, confidence, materiality, contrast, or editorial composition
- rebuild the hierarchy around that decision

## Desktop Shrink-On-Mobile

Symptoms:

- multi-column desktop layouts collapse awkwardly
- emphasis disappears on small screens
- spacing and tap targets become cramped

Corrective move:

- redesign the mobile sequence
- simplify supporting content
- ensure the first viewport communicates the core action or message
```

- [ ] **Step 3: Verify the reference headings are present**

Run:

```powershell
Select-String -Path ".\ui-aesthetics\references\design-principles.md" -Pattern "^## "
Select-String -Path ".\ui-aesthetics\references\anti-patterns.md" -Pattern "^## "
```

Expected:
- Output lists the section headers from both files.

- [ ] **Step 4: Commit the rule references**

Run:

```powershell
git add ui-aesthetics/references/design-principles.md ui-aesthetics/references/anti-patterns.md
git commit -m "feat: add ui aesthetics design rules and anti-patterns"
```

Expected:
- Commit succeeds with only the two new reference files.

### Task 4: Add Review And Rewrite Guides

**Files:**
- Create: `ui-aesthetics/references/review-rubric.md`
- Create: `ui-aesthetics/references/rewrite-playbook.md`

- [ ] **Step 1: Write `review-rubric.md`**

Write this file:

```markdown
# Review Rubric

## Use This File

Use this rubric when reviewing frontend code or rendered UI from an aesthetic and UX perspective.

## Review Order

Always review in this order:

1. Visual hierarchy
2. Focal point and action clarity
3. Layout rhythm and grouping
4. Information density and readability
5. Interaction feedback and states
6. Consistency of visual system
7. Mobile responsiveness

## Severity Language

Use these severity levels:

- **Critical:** the page fails to communicate the primary action, message, or structure
- **High:** the hierarchy or composition is materially weakening trust, clarity, or usability
- **Medium:** the design direction is acceptable but uneven or generic in important areas
- **Low:** the issue is local polish and does not undermine the overall structure

## Finding Format

For each finding, provide:

1. the visible problem
2. why it hurts the experience
3. the recommended correction

Example structure:

- **High:** The hero and the feature grid compete for first attention.
  Why it matters: the page has no single entry point, so the message feels unfocused.
  Fix direction: reduce grid prominence and let the hero establish the first read.

## What To Avoid In Reviews

- lists of CSS tweaks without explaining user impact
- vague praise and vague criticism
- comments that focus on decoration before structure
- nitpicks that hide the most important issues
```

- [ ] **Step 2: Write `rewrite-playbook.md`**

Write this file:

```markdown
# Rewrite Playbook

## Use This File

Read this file before editing an existing UI when the user wants a visual upgrade, a premium feel, or a stronger UX outcome.

## Rewrite Levels

### Light Polish

Use when:

- the structure is fundamentally correct
- the primary issue is weak contrast, spacing, type scale, or emphasis

Allowed changes:

- adjust spacing rhythm
- tighten typography hierarchy
- improve CTA emphasis
- refine surface treatments

### Medium Restructure

Use when:

- the page goal is clear but the current grouping or rhythm is weak
- multiple blocks compete for attention
- the sequence of information is correctable without rebuilding the whole page

Allowed changes:

- regroup sections
- reweight modules
- change alignments and block widths
- simplify or consolidate secondary content

### Full Rebuild

Use when:

- the current page has no strong focal point
- layout patterns are fundamentally generic or mismatched to the content
- the mobile experience collapses badly

Allowed changes:

- rebuild section order
- replace the composition system
- redefine dominant and supporting modules
- rewrite component treatments to serve the new hierarchy

## Decision Rule

Start at the lightest level that can realistically solve the problem.

Escalate only when the weaker rewrite level cannot create a convincing focal point, hierarchy, and interaction path.

## Output Contract

Before making code edits, state:

1. the chosen rewrite level
2. the main visual problem
3. the intended direction of the rewrite
```

- [ ] **Step 3: Verify both guidance files include the expected headings**

Run:

```powershell
Select-String -Path ".\ui-aesthetics\references\review-rubric.md" -Pattern "^## "
Select-String -Path ".\ui-aesthetics\references\rewrite-playbook.md" -Pattern "^## |^### "
```

Expected:
- Output lists the rubric sections and rewrite levels.

- [ ] **Step 4: Commit the review and rewrite guides**

Run:

```powershell
git add ui-aesthetics/references/review-rubric.md ui-aesthetics/references/rewrite-playbook.md
git commit -m "feat: add ui aesthetics review and rewrite guides"
```

Expected:
- Commit succeeds with only the two new reference files.

### Task 5: Add The Distilled Sample Intake Reference

**Files:**
- Create: `ui-aesthetics/references/distilled-examples.md`

- [ ] **Step 1: Write `distilled-examples.md`**

Write this file:

```markdown
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
```

- [ ] **Step 2: Verify the sample file contains the schema and worked examples**

Run:

```powershell
Select-String -Path ".\ui-aesthetics\references\distilled-examples.md" -Pattern "^## |^### "
```

Expected:
- Output lists `## Capture Schema`, `## Capture Template`, and both worked examples.

- [ ] **Step 3: Commit the distilled example reference**

Run:

```powershell
git add ui-aesthetics/references/distilled-examples.md
git commit -m "feat: add ui aesthetics distilled example guide"
```

Expected:
- Commit succeeds with only the new sample reference file.

### Task 6: Regenerate Metadata And Run Final Validation

**Files:**
- Modify: `ui-aesthetics/agents/openai.yaml`
- Verify: `ui-aesthetics/SKILL.md`
- Verify: `ui-aesthetics/references/*.md`

- [ ] **Step 1: Regenerate `agents/openai.yaml` from the final skill**

Run:

```powershell
python "C:\Users\Kason\.codex\skills\.system\skill-creator\scripts\generate_openai_yaml.py" ".\ui-aesthetics" `
  --interface display_name="UI Aesthetics" `
  --interface short_description="Upgrade web UI generation, review, and refactors" `
  --interface default_prompt="Use $ui-aesthetics to improve this web UI's visual direction, hierarchy, and UX."
```

Expected:
- Output contains `[OK] Created agents/openai.yaml`

- [ ] **Step 2: Verify the generated metadata**

Run:

```powershell
Get-Content ".\ui-aesthetics\agents\openai.yaml"
```

Expected:

```yaml
interface:
  display_name: "UI Aesthetics"
  short_description: "Upgrade web UI generation, review, and refactors"
  default_prompt: "Use $ui-aesthetics to improve this web UI's visual direction, hierarchy, and UX."
```

- [ ] **Step 3: Run final validation and tree check**

Run:

```powershell
python "C:\Users\Kason\.codex\skills\.system\skill-creator\scripts\quick_validate.py" ".\ui-aesthetics"
Get-ChildItem -Recurse -Force ".\ui-aesthetics"
git status --short
```

Expected:
- `Skill is valid!`
- The file tree lists `SKILL.md`, `agents\openai.yaml`, and all five reference files.
- `git status --short` shows only the expected `ui-aesthetics` changes before the final commit.

- [ ] **Step 4: Commit the finished skill**

Run:

```powershell
git add ui-aesthetics
git commit -m "feat: add initial ui aesthetics skill"
```

Expected:
- Commit succeeds with the final skill contents.
