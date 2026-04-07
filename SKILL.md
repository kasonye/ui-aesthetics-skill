---
name: ui-aesthetics
description: Raise frontend visual judgment for web interfaces with a bias toward professional, balanced layouts, higher-end color systems, and smooth restrained motion. Use when Codex needs to generate, review, or refactor a page, section, or component that feels generic, cluttered, flat, over-styled, or AI-generated, or when the user asks for a cleaner, more premium, more polished, more minimal, more refined, or more product-grade UI.
---

# UI Aesthetics

## Intent

Use this skill to make web UI output feel more professional, stable, and product-grade.

Default goals:

- preserve the user's requested artifact scope and content footprint
- produce balanced composition before adding decoration
- make hierarchy readable at a glance
- keep color restrained but expensive-looking
- use shadows, blur, glow, and highlights only when they clarify depth
- keep motion short, smooth, and useful

This skill is framework-agnostic. Lead with design judgment, then implement.

## Task Routing

Classify the request before acting:

1. **Generation**
   Use when the user wants a new page, section, or component.
2. **Review**
   Use when the user wants critique, findings, or a diagnosis of why the UI feels weak.
3. **Refactor**
   Use when the user wants the existing implementation rewritten directly.

If the request mixes review and refactor, diagnose first, then choose rewrite depth before editing.

## Non-Negotiables

- Honor the requested scope exactly: a component stays a component, a card set stays a bounded module, a section stays a section, and a page becomes a page only when asked.
- Decide the visual thesis before touching implementation.
- Lock the artifact type before styling: do not turn card, widget, modal, panel, or section prompts into full landing pages or dashboards.
- Make layout, spacing, and type hierarchy carry most of the quality.
- Treat "premium" as restraint, consistency, and precision, not visual noise.
- Use fewer containers, fewer accents, and fewer simultaneous ideas.
- If the requested artifact is a page, default to a full-viewport composition that fills the screen width rather than a small centered canvas.
- Default to preserving the user's information density and copy footprint.
- Do not add hero copy, marketing paragraphs, navigation, footer, feature sections, badges, or CTA clusters unless the request requires them.
- Keep ordinary cards terse. Prefer strong labels, values, and compact supporting text over invented blurbs.
- Prefer crisp neutral or slightly cool neutral surfaces by default; do not use cream, beige, ivory, or warm off-white as an automatic premium signal.
- Keep component polish subordinate to page composition.
- Prefer balanced and stable layouts over tension, asymmetry, or visual provocation.
- Do not introduce asymmetry or exaggerated contrast just to avoid looking templated.
- Make mobile a recomposed layout, not a squeezed desktop.
- Keep the result shippable and maintainable.

## Priority Order

Work in this order unless the task clearly requires a different sequence:

1. Requested scope and artifact boundaries
2. Composition and structural balance
3. Spacing rhythm and information density
4. Typography and copy fit
5. Color system and surface contrast
6. Depth cues: border, shadow, blur, highlight
7. Motion, feedback, and state transitions

If the page still fails in grayscale, the structure is not solved yet.

## Workflow

### Generation

1. Identify the requested artifact type and hard scope: single component, component set, section, or full page.
2. Infer role, audience, and density within that scope instead of expanding it.
3. Name the desired impression in a short phrase such as `calm product clarity`, `enterprise polish`, or `quiet precision`.
4. Choose a stable primary block and supporting modules before writing markup.
5. If the request is for a card or component, use only the minimum surrounding canvas needed to present it clearly.
6. Preserve the copy footprint unless the user asks for content design. Tighten wording if needed, but do not invent extra explanatory text.
7. If the request is for a page, let the outer layout span the viewport by default instead of floating as a narrow centered slab.
8. Define the color logic: neutrals first, accent second.
9. Add depth and motion only after the static composition works.
10. Make desktop and mobile behavior explicit when the requested artifact actually spans both.

Read `references/design-principles.md` when the visual direction is still vague.
Read `references/color-system.md` when the palette feels loud, flat, or cheap.
Read `references/motion-principles.md` when transitions, hover behavior, or reveal motion need more control.

### Review

1. Start with the biggest structural failure, not CSS trivia.
2. Explain whether the problem is hierarchy, density, palette, depth, or motion.
3. Tie each finding to readability, trust, focus, or action clarity.
4. Prefer direct corrections over generic taste language.

Use `references/review-rubric.md` to structure findings.
Use `references/anti-patterns.md` when the UI feels AI-generated or superficially premium.
Use `references/color-system.md` when the main weakness is palette discipline or accent misuse.
Use `references/motion-principles.md` when the main weakness is animation quality, timing, or feedback behavior.

### Refactor

1. Choose `light polish`, `medium restructure`, or `full rebuild`.
2. Fix layout and grouping before component cosmetics.
3. Reduce visual noise before adding new effects.
4. Rebuild mobile intentionally if the desktop structure does not translate.
5. State the rewrite level, the core failure, and the intended direction before editing.

Use `references/rewrite-playbook.md` before broad visual changes.
Use `references/color-system.md` before rewriting a noisy palette.
Use `references/motion-principles.md` before adding or simplifying transitions.

## Anti-Pattern Policy

Reject outputs that rely on:

- scope inflation that turns a component request into a full page, dashboard shell, or landing layout
- decorative copy inflation that adds filler descriptions, badges, stats, or CTA blocks not requested
- page-level layouts trapped inside unnecessarily narrow centered shells without a content reason
- template-like center-stacked hero plus card grid layouts
- unstable or forced-asymmetric layouts used to create tension
- equal-weight modules with no clear reading order
- too many surfaces, strokes, pills, and radii
- cream, beige, ivory, or warm off-white neutrals used as a default shortcut for "premium"
- loud accent colors sitting on unstable neutrals
- glow, shadow, blur, or gradients used to fake sophistication
- animation that calls attention to itself instead of guiding perception
- strong-visual treatments designed to impress before they clarify
- mobile layouts that merely collapse columns without recomposing emphasis

Read `references/anti-patterns.md` when the result feels polished but still cheap.

## Self-Critique

Before final output, check:

- Did the result stay inside the user's requested scope without inventing a page around it?
- Is the first read obvious within three seconds?
- Does the layout still feel credible and well-balanced without gradients and shadows?
- If this is a page, does the composition actually occupy the screen width by default?
- Did the copy stay as short as the task allows, especially on ordinary cards?
- Are neutrals calm and consistent enough for the accent color to mean something?
- Did the palette avoid defaulting to creamy or warm-white luxury cues without a content reason?
- Do components look related without all having the same weight?
- Do shadows and highlights describe depth instead of creating fog?
- Do motion timings feel controlled and brief?
- Did the composition stay balanced instead of becoming attention-seeking?
- Does the first mobile viewport preserve the same primary message or action?
- Did the upgrade remove noise rather than add more styling?

## References

- Core design rules: `references/design-principles.md`
- Color system rules: `references/color-system.md`
- Motion rules: `references/motion-principles.md`
- Failure patterns: `references/anti-patterns.md`
- Review structure: `references/review-rubric.md`
- Rewrite depth and output contract: `references/rewrite-playbook.md`
- Distilled judgment examples: `references/distilled-examples.md`
