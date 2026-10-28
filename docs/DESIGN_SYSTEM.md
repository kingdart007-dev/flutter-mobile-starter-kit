# Design system

## Design intent

Premium minimal, calm, and functional. The starter should feel intentionally designed without imposing a brand identity on apps that use it.

Use generous whitespace, clear typography and hierarchy, open surfaces, subtle dividers, and purposeful transitions. Avoid default Material styling left untouched, oversized decorative cards, excessive elevation, gradients, neon/glow effects, background noise, or novelty that competes with content.

## Tokens before styling

Maintain a single source of truth for:
- Semantic colors and surface roles
- Typography roles
- Spacing
- Shape and corner radii
- Motion durations and curves
- Interaction and focus treatments

Use theme-aware semantic roles rather than referencing raw palette colors throughout feature code. Keep light and dark mappings coherent. Tokens are implementation details with a simple public API, not a general-purpose design-token engine.

## Starting scales

These are starting points to validate in real screens, not immutable laws.

### Spacing

`4, 8, 12, 16, 24, 32, 48`

### Shape

`8, 12, 16, 24`, plus pill/full rounding only where the meaning and interaction justify it.

### Typography

- Body: approximately 14
- Emphasized/control title: approximately 16
- Section heading: approximately 20
- Page heading: approximately 24

Use a coherent type scale and line heights. Do not shrink text to fit a layout; allow it to wrap and scale.

## Color

- Begin with neutral white, charcoal, and warm/cool gray roles.
- Keep the base foundation brand-neutral; product teams can add brand accents later.
- Avoid pure black/white combinations when softer values improve comfort and contrast remains sufficient.
- Verify contrast for text, icons, borders, focus, and disabled states in both themes.
- Never make color the only signal for success, warning, selection, or error.

## Components

Build only the foundational components that demonstrate repeated product value, likely including:
- Page/layout scaffold
- Section header
- Buttons and icon buttons
- Text fields with validation states
- Accessible selection controls
- Dialogs, sheets, and snackbar/feedback patterns
- Empty, loading, and error/retry states
- A small set of layout surfaces when grouping genuinely helps

Every component should have a clear reason to exist, a narrow API, explicit state behavior, theme support, semantics, and tests as appropriate. Do not create every possible variant in advance.

## Navigation and interaction

- Prefer platform-appropriate behavior over forcing one platform's look everywhere.
- Keep hit targets comfortable and interactions understandable.
- Give press, selection, loading, disabled, error, and focus states appropriate feedback.
- Motion should clarify cause and effect, not decorate. Keep transitions brief and consistent.
- Respect reduced-motion/accessibility settings and avoid essential information that is only conveyed by animation.

## Layout

- Never assume English-length labels or a single script.
- Prefer content-driven height and flexible constraints over hard-coded heights.
- Validate narrow devices, large text scaling, long Arabic strings, mixed-script text, keyboard appearance, safe areas, and landscape cases where relevant.
- A maximum reading width may help on larger phones/tablets, but Android/iOS phone layouts remain the primary target.
