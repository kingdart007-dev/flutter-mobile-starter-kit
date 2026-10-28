# Architecture

## Goals

The architecture should make ordinary changes easy to understand, implement, and test. It should support real applications without forcing every small app to adopt enterprise-scale complexity.

Use the official [Flutter architecture guide](https://docs.flutter.dev/app-architecture/guide) and [recommendations](https://docs.flutter.dev/app-architecture/recommendations) as the primary reference, adapted to this repository's Riverpod choice and product-neutral scope.

## Dependency direction

The intended flow is:

```text
Screen / Widget
      |
      v
Feature state and presentation logic (Riverpod)
      |
      v
Repository interface / application data boundary
      |
      v
Data source or repository implementation (when needed)
```

Dependencies should point inward toward stable contracts. Widgets render state and forward user intent; they should not own networking, persistence, or business rules.

## State and dependencies

- Use Riverpod as the single application state/dependency mechanism.
- Prefer the current, project-compatible Notifier or AsyncNotifier APIs for owned mutable/async state.
- Use provider composition for dependency injection and test overrides.
- Keep state as local as practical. Do not put ephemeral field focus, animation controllers, or simple widget-only state into global providers without a real need.
- Model asynchronous states explicitly. The user-facing UI should account for loading, success, empty content, errors, and retry/recovery where relevant.
- Do not use code generation, Freezed, or build_runner for application state/models.

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
- Support correct back behavior for nested routes, dialogs, sheets, unsaved input, Android system back, and iOS navigation gestures.
- Use the Navigator API directly for a focused imperative flow if it genuinely fits better than router configuration.

## Suggested structure

Start small; do not create every directory before a real feature needs it.

```text
lib/
  main.dart
  app/
    app.dart
    router/
    theme/
    localization/
  core/
    errors/
    accessibility/        # only shared policies/helpers that are needed
  shared/
    ui/                    # genuinely reusable, product-neutral components
  features/
    home/
      presentation/
      application/         # only if logic warrants a separate layer
      data/                # only if the feature owns data access
```

The exact files can change as the implementation becomes concrete. Avoid catch-all folders such as `utils/` or `widgets/` that accumulate unrelated code. Prefer a name that explains the responsibility.

## UI components

- Start with Flutter primitives and compose them.
- Extract a shared component after a pattern is repeated or a consistent public API is clearly valuable.
- Give components a narrow API, predictable states, theme integration, semantics, and tests for meaningful behavior.
- Avoid creating custom wrappers that merely rename a Flutter widget without adding behavior, policy, accessibility, or consistency.

## Errors and observability

- Translate low-level exceptions into understandable UI states at a suitable boundary.
- Avoid leaking raw exception details or sensitive data to users and logs.
- Do not add an analytics or logging vendor by default. Logging must be intentional, safe, and useful for debugging.
