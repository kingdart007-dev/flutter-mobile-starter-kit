# Architecture

## Goals

The architecture should make ordinary changes easy to understand, implement, and test. It should support real applications without forcing every small app to adopt enterprise-scale complexity.

Use the official [Flutter architecture guide](https://docs.flutter.dev/app-architecture/guide) and [recommendations](https://docs.flutter.dev/app-architecture/recommendations) as primary references, adapted to this repository's Riverpod choice and product-neutral scope.

## Dependency direction

```text
Screen / Widget
      |
      v
Feature state and presentation logic (Riverpod)
      |
      v
Repository contract / application data boundary (when useful)
      |
      v
Data source or repository implementation
```

Dependencies should point inward toward stable contracts. Widgets render state and forward user intent; they should not own networking, persistence, or business rules.

## State and dependencies

- Use Riverpod as the single app state/dependency mechanism.
- Prefer the current, project-compatible Notifier or AsyncNotifier APIs for owned mutable/async state.
- Use provider composition for dependency injection and test overrides.
- Keep state as local as practical. Do not put ephemeral field focus, animation controllers, or simple widget-only state into global providers without a real need.
- Model asynchronous states explicitly. The UI should account for loading, success, empty content, errors, and retry/recovery where relevant.
- Do not use Freezed, build_runner, or generated code for application state/models.

## Data boundaries

- A repository is the source of truth for a domain's data when that domain needs a reusable data boundary.
- Define an abstract repository contract when it enables independent testing, multiple implementations, or isolates infrastructure details.
- Avoid creating a repository and service pair for every trivial value. Pure local UI preferences may not need a domain repository abstraction.
- Keep platform APIs, HTTP clients, database details, serialization, and error translation outside presentation widgets.
- Add persistence, network access, authentication, or product-specific services only when explicitly required.

## Navigation

- Use go_router for top-level declarative navigation, named destinations when helpful, nested navigation, and deep links.
- Centralize route configuration without turning it into a global registry framework.
- Keep screens responsible for presentation; pass only stable, serializable identifiers or simple route data when appropriate.
- Respect native Android back handling and iOS navigation gestures, and test real route behavior on both platforms.
- Use the Navigator API directly for a focused imperative flow if it genuinely fits better than router configuration.

## Suggested structure

Start small; do not create every directory before a real feature needs it.

```text
lib/
  main.dart
  app/
    starter_kit_app.dart
    router/
    theme/
    localization/       # when locale resources are implemented
  core/
    errors/             # only shared error policy/types that are needed
  shared/
    ui/                 # reusable, product-neutral components
  features/
    feature_name/
      presentation/
      application/      # only if logic warrants a separate layer
      data/             # only if the feature owns data access
```

Avoid catch-all folders such as `utils/` or `widgets/` that accumulate unrelated code. Prefer names that explain responsibility.

## UI components

- Start with Flutter primitives and compose them.
- Extract a shared component when a pattern is repeated or a consistent public API is clearly valuable.
- Give components a narrow API, predictable states, theme integration, semantics, and tests for meaningful behavior.
- Avoid wrappers that merely rename a Flutter widget without adding behavior, policy, accessibility, or consistency.
- Follow the visual rules in [Design system](DESIGN_SYSTEM.md) and component/interaction conventions in [Patterns](PATTERNS.md).
- Apply [SOLID pragmatically](SOLID.md); do not introduce speculative abstractions.

## Errors and observability

- Translate low-level exceptions into understandable UI states at a suitable boundary.
- Avoid leaking raw exception details or sensitive data to users and logs.
- Do not add an analytics or logging vendor by default. Logging must be intentional, safe, and useful for debugging.
