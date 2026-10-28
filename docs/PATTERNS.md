# UI, UX, and engineering patterns

Patterns are defaults for recurring problems, not rules to apply regardless of context. Start with the simplest Flutter-native implementation that makes behavior clear and testable.

## Screen composition

- A screen owns the composition and user-facing states for one route.
- Use `AppPage` for the recurring scroll-safe inset and readable width. Keep route-specific app bars, navigation chrome, and bottom actions explicit.
- Use `AppSectionHeader` for the repeated eyebrow/title/description hierarchy.
- Use `AppCard` to group related content or express one tappable destination.
- Keep feature-specific widgets in the feature until a genuinely shared, stable pattern emerges.
- Avoid giant build methods by extracting a focused widget when it has a meaningful name, behavior, API, or test boundary—not merely to make a file shorter.

## State ownership

Choose the narrowest owner that meets the need:
1. Local widget state for ephemeral UI details, such as expanded/collapsed state.
2. A Riverpod Notifier for user-visible mutable state shared by multiple widgets or requiring explicit tests.
3. An AsyncNotifier/provider for asynchronous state and dependency composition.
4. A repository boundary only when it isolates data access, supports alternate implementations, or improves testability.

Keep state out of global providers if one widget can own it safely. Do not use multiple state-management packages or a service locator.

## Async state pattern

When a feature loads data, represent loading, success, empty, and failure as distinct states. Make errors recoverable when retry is meaningful. Keep raw exceptions and stack traces out of the UI. Never silently convert an unexpected error into a valid-looking empty result.

Use Riverpod's asynchronous provider state where it fits rather than maintaining separate booleans like `isLoading`, `hasError`, and `hasData` that can contradict each other.

## Navigation

- Configure top-level routes centrally with go_router.
- Use named route helpers when they improve discoverability; don't hide route definitions behind a registry or code generation.
- Prefer stable IDs or compact route data over serializing entire domain objects into route strings.
- Respect Android system back and iOS navigation gestures.
- Keep dialogs/sheets and their dismissal behavior explicit. Preserve form or nested navigation state when the task warrants it.
- Add deep links and nested shell navigation when a product requirement actually exists, not by default.

## Forms and validation

- Give fields persistent labels when context isn't obvious; don't rely on placeholders as the only label.
- Validate near the relevant field, state how to recover, and preserve entered values after recoverable errors.
- Distinguish field-level validation from submission-level failure.
- Use semantic errors and accessible announcements; never indicate invalid state by color alone.
- Don't use fixed-height fields that clip scaled text or localized messages.

## Empty, loading, error, and retry

- Empty: tell people what the empty state means and the useful next step, if one exists.
- Loading: keep layout stable; use progress indicators or skeletons only when they improve perceived continuity.
- Error: explain the problem at the right level without leaking internals; offer retry or another recovery route where useful.
- Success: confirm meaningful completion, but avoid interrupting for routine actions.
- Disabled: explain why when the reason is not obvious.
- Avoid decorative skeletons, fake progress, or controls with no meaningful outcome.

### Shared loading, empty, and error widgets

- Use `AppLoadingState` while an operation is pending; provide a localized message and let the feature own the operation.
- Use `AppEmptyState` when a feature has no content to show, not when a request failed.
- Use `AppErrorState` for a user-safe failure message and add a retry action only when retry is useful.
- Supply localized title, message, and action labels from the owning feature; these widgets do not own product wording or data logic.
- Keep raw exceptions, stack traces, internal URLs, and sensitive details out of the message.
- Status widgets follow the shared theme, support text scaling and RTL through Flutter layout, and expose loading/error announcements semantically.

Implementation: `lib/shared/ui/app_status_state.dart`.

## Feedback and motion

- Prefer platform feedback and built-in transitions first.
- Use lightweight, short feedback for small state changes; reserve dialogs for decisions that require attention.
- Use bottom sheets for focused secondary tasks where they fit platform behavior; ensure dismissal and drag handles don't hide important content.
- Honor reduced motion and accessible focus settings.
- Every control should have a meaningful action, feedback, or explicit disabled state.

## Testing patterns

- Unit-test pure logic and state transitions.
- Widget-test layout, semantics, validation, loading/error/empty states, and user interaction.
- Test both light and dark themes, LTR and RTL, and larger text at reusable-component boundaries.
- Use integration tests for a small number of critical end-to-end mobile flows.
- Prefer stable semantic finders and behavior assertions over tests tied to implementation details.
- Don't describe CI as green until the run result is observed.
