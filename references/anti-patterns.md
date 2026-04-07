# Anti-Patterns

## Use This File

Read this file when the output looks polished on first glance but still feels generic, noisy, or cheap.

## Template Hero Plus Card Grid

Symptoms:

- centered headline, paragraph, and CTA above a predictable feature grid
- every section feels interchangeable with any SaaS landing page
- the page has no product structure or hierarchy

Corrective move:

- choose a clearer alignment system
- establish a stable primary block in the first viewport
- vary density only where the content role truly requires it

## Narrow Page Shell

Symptoms:

- a full page sits inside a small centered card-like wrapper without a product reason
- large amounts of screen width are left unused on desktop
- the result feels like a mockup pasted onto the page instead of a real page layout

Corrective move:

- let page-level layouts span the viewport by default
- constrain inner content areas intentionally instead of boxing the whole page
- reserve centered shells for components, dialogs, or specific editorial use cases

## Scope Inflation

Symptoms:

- a card, widget, or modal prompt gets expanded into a full page or dashboard shell
- navigation, hero copy, footer, or extra sections appear without being requested
- the result feels like a themed demo site instead of the artifact the user asked for

Corrective move:

- lock the requested artifact type before designing
- keep any surrounding canvas minimal and visually quiet
- spend the effort on the requested component itself rather than invented page chrome

## Copy Inflation

Symptoms:

- ordinary cards receive extra headlines, blurbs, badges, or CTA text that were not requested
- visual polish comes from added words instead of better hierarchy
- the interface feels verbose for the amount of functionality it actually has

Corrective move:

- preserve the original information density by default
- tighten labels and supporting text instead of multiplying them
- add new copy only when it solves a functional or clarity problem

## Forced Asymmetry

Symptoms:

- columns, offsets, or card sizes are intentionally imbalanced without a product reason
- the layout leans on tension to feel designed
- the page tries to look bespoke by breaking alignment discipline

Corrective move:

- restore structural balance first
- use hierarchy through spacing, typography, and grouping instead of imbalance
- keep deviations from symmetry rare and content-driven

## Equal-Weight Everything

Symptoms:

- every card, badge, and section competes for the same attention
- there is no fast path for the eye
- the page feels busy despite having enough whitespace

Corrective move:

- reduce the number of visually loud surfaces
- decide what is primary, secondary, and tertiary
- compress secondary modules

## Surface Inflation

Symptoms:

- too many boxes, strokes, shadows, pills, and rounded corners
- layout feels padded but not precise
- components look "designed" individually but weak together

Corrective move:

- remove non-essential containers
- let spacing and typography separate content
- keep only a small set of surface treatments

## Muddy Premium Palette

Symptoms:

- neutral colors shift too much from section to section
- accent colors appear in too many places
- "premium" is attempted through dark backgrounds plus bright glow
- cream, beige, or warm off-white is used by default to imply luxury

Corrective move:

- stabilize the neutral scale first
- return to crisp neutral or slightly cool neutral surfaces unless warmth is purposeful
- reduce accent usage to actions and a few emphasis points
- choose restrained contrast over attention-seeking drama

## Shadow Fog And Decorative Glow

Symptoms:

- shadows are broad, blurry, and always present
- glow is added without a clear source or purpose
- depth effects obscure edges instead of clarifying them

Corrective move:

- use fewer shadow styles with clearer intent
- keep glow minimal and rare, limited to active emphasis or subtle separation
- let borders and contrast carry most separation

## Motion As Decoration

Symptoms:

- everything fades, slides, scales, and blurs at once
- the UI feels slower after animation is added
- hover or entrance effects call attention to themselves

Corrective move:

- animate only what improves orientation or feedback
- shorten durations
- remove overlapping motion channels on the same element

## False Minimalism

Symptoms:

- the page is sparse but not intentional
- large empty gaps replace real hierarchy
- typography is weak, so the interface feels unfinished instead of refined

Corrective move:

- strengthen alignment, scale, and focal contrast
- strengthen alignment, spacing, and copy hierarchy
- let whitespace support hierarchy rather than replace it
- make the primary message more decisive

## Desktop Shrink-On-Mobile

Symptoms:

- desktop multi-column logic collapses into a long, flat stack
- emphasis disappears on small screens
- cards and controls feel cramped or repetitive

Corrective move:

- redesign the mobile reading sequence
- combine or remove low-value supporting modules
- preserve the primary action in the first viewport
