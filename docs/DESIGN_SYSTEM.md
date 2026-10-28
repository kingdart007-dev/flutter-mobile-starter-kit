# Design system and visual style guide

## Design intent

**Luxury monochrome. Quietly confident. Card-based when grouping helps.**

Use the clarity, tactile confidence, and motion discipline associated with excellent native phone interfaces as inspiration—not as a copy of Apple's branding or a one-size-fits-all iOS skin. The design must remain comfortable on Android and idiomatic to Flutter.

The visual language is built from warm whites, ink black, graphite, and nuanced greys; generous breathing room; clear type hierarchy; fine separators; softly rounded surfaces; and motion that clarifies cause and effect.

Avoid:
- Brand colors in the product-neutral base layer
- Decorative gradients, neon, glows, grain, and visual noise
- Heavy shadows/elevation or stacking cards inside cards without a clear hierarchy
- Huge pill buttons everywhere, excessive icon decoration, and ornamental labels
- Over-animating screens or animating content just because it can move
- Rigid fixed heights that clip large text or Arabic translations
- One-off hard-coded colors or spacing that bypass shared tokens

## Color system

The primitive palette lives in `lib/app/theme/app_palette.dart`. UI components should consume semantic `ColorScheme` roles instead of reaching for primitive hex values.

### Light theme direction

| Role | Token / reference | Use |
|---|---|---|
| Canvas | Paper, `#FBFBF9` | Main app background |
| Primary surface | White, `#FFFFFF` | Standard cards and content surfaces |
| Soft surface | Cloud, `#F4F4F1` | Secondary groups and subtle controls |
| Quiet border | Mist, `#E8E8E3` | Hairlines and card boundaries |
| Primary ink | Ink, `#171715` | Primary text and primary action |
| Secondary ink | Graphite, `#555550` | Secondary emphasis |
| Muted ink | Slate, `#73736D` | Secondary text; verify contrast per use |

### Dark theme direction

| Role | Token / reference | Use |
|---|---|---|
| Canvas | Night, `#111110` | Main app background |
| Primary surface | Dark surface, `#1A1A18` | Standard cards |
| Raised surface | `#232321` / `#2A2A27` | Secondary groups and selected surfaces |
| Primary text | `#F3F3EF` | Main text |
| Muted text | `#B5B5AE` | Secondary text |
| Quiet border | `#3A3A35` | Surface separation |

These hex values are starting tokens, not a substitute for contrast testing. Use semantic error/success/warning roles when needed; monochrome does not mean removing important status information. Never communicate status by color alone.

## Spacing and layout

Spacing tokens are defined in `AppSpacing`:
- `xxs`: 4
- `xs`: 8
- `sm`: 12
- `md`: 16
- `lg`: 24
- `xl`: 32
- `xxl`: 48

Use 16–24 logical pixels as a common content inset, adjusted for the screen and density of the content. Keep related items close and distinct sections comfortably separated. Use `AppPage` to establish a scroll-safe layout with a readable maximum width; do not force all screen content into a 640-pixel column when a platform-native full-width layout is more appropriate.

## Shape language

The `AppRadii` scale:
- Control: 12
- Card: 20
- Panel: 24
- Overlay: 28
- Pill: use only when the interaction or control convention warrants it

Use one dominant radius per surface. Prefer rounded rectangles with quiet outlines over excessive nested rounded containers. Cards should usually have no visible elevation; depth comes from surface contrast and spacing.

## Typography

The default Flutter/platform font stack is intentional in the first foundation release. Do not add downloaded fonts simply for novelty. A product may add a licensed font after reviewing script coverage, rendering, file size, and the look across Android and iOS.

Use semantic roles rather than arbitrary sizes:
- Display: one confident headline, allowed to wrap
- Headline: page/section heading
- Title: card and control headings
- Body: reading and explanatory text
- Label: compact metadata and control labels

Use weight to establish hierarchy before increasing size. Short labels may use subtle positive tracking; large headings may use subtle negative tracking. Keep body line heights comfortable. Do not shrink text to make a layout fit.

## Card and surface patterns

`AppCard` is the shared bordered, theme-aware content surface. Use it when content belongs together or the whole surface is one tappable action.

- Use cards to create meaningful grouping, not to wrap every paragraph.
- Prefer one main card with dividers/list rows over many tiny cards.
- Use `onTap` only if the card represents one clear action.
- When the card contains multiple independent actions, do not make the entire card tappable.
- Preserve a visible boundary in light and dark themes; avoid heavy shadows.
- Do not communicate selection by fill color alone; include a checkmark, label, or semantic state.

## Controls and touch

- Theme filled, outlined, text, icon, and field treatments centrally.
- A primary action should be easy to locate and should describe an outcome.
- Respect platform conventions for back buttons, dialogs, action sheets, keyboards, and system gestures.
- Use at least 48 logical pixels for common interactive control height; verify accessible target size and spacing in real device layouts.
- Always provide tooltips or semantic labels for icon-only actions.
- Disabled, loading, focused, selected, invalid, and pressed states need distinct, understandable feedback.
- Do not replace the normal system keyboard or input behavior without a demonstrated need.

## Motion and feel

The token scale lives in `AppMotion`:
- Quick: 120 ms
- Standard: 200 ms
- Emphasis: 280 ms
- Standard curve: ease-out cubic
- Enter curve: ease-out quart

Treat these as defaults, not targets to animate every element. Keep transitions brief, directional and reversible where appropriate, and consistent with the platform. Prefer built-in navigation transitions and scrolling physics unless a measured product need supports customization.

If the system requests reduced motion, use `AppMotion.durationFor` for optional motion and avoid essential information that depends on animation. Do not animate large layouts repeatedly or add custom physics merely to make a demo feel active.

## Accessibility and localization

- Preserve text scaling and content-driven height.
- Provide meaningful labels/semantics for controls and interactive cards.
- Keep focus order and screen-reader reading order logical.
- Use contrast that meets the applicable accessibility guidance; check text, borders, icons, focus, and disabled states in both themes.
- Use direction-aware layout widgets and support English LTR and Arabic RTL from the layout layer.
- Mirror only directional symbols. Do not manually reverse translated strings.
- Test long Arabic labels, mixed-script text, dates/numbers, keyboard appearance, narrow screens, and large accessibility text sizes.

## Implementation map

- Primitive colors: `lib/app/theme/app_palette.dart`
- Spacing: `lib/app/theme/app_spacing.dart`
- Radii: `lib/app/theme/app_radii.dart`
- Motion: `lib/app/theme/app_motion.dart`
- Theme composition: `lib/app/theme/app_theme.dart`
- Shared layout/surfaces/headings: `lib/shared/ui/`
- Live examples: `lib/features/design_system/presentation/design_system_screen.dart`

The design-system screen is a living reference. If its appearance and this document disagree, resolve the inconsistency rather than creating a second token system.
