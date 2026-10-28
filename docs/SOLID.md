# Applying SOLID pragmatically

SOLID helps keep code changeable. It is not permission to introduce an interface, class, service, and factory for every widget.

## S — Single Responsibility Principle

A type should have one coherent reason to change.

- A screen composes UI and forwards intent.
- A Notifier owns a cohesive state transition.
- A repository owns a clear data boundary.
- A theme module defines visual defaults.

Split a type when its responsibilities evolve independently—not merely because it has multiple methods.

## O — Open/Closed Principle

Prefer a stable API that can be extended without repeatedly editing unrelated code.

- Use component parameters and theme roles for legitimate variations.
- Prefer composition over inheritance for UI reuse.
- Avoid large `switch` statements spread across the app for every new variant.
- Do not add extension points for hypothetical future product requirements.

A component with ten boolean flags is usually a sign that distinct variants or simpler composition would be clearer.

## L — Liskov Substitution Principle

Implementations of a contract must honor the contract's behavior.

- Repository test doubles must behave like valid repositories for the operations they implement.
- A component variant must preserve its promised interaction, semantics, and layout expectations.
- Do not create implementations that silently ignore required operations or return fake valid-looking data.

## I — Interface Segregation Principle

Keep contracts narrow and specific to the caller's needs.

- Don't force a screen to depend on a broad repository when it needs one operation.
- Avoid universal service interfaces with unrelated methods.
- Use Dart's implicit interfaces when they are sufficient; an explicit abstract contract is useful when it establishes a meaningful boundary.

## D — Dependency Inversion Principle

High-level decisions should not depend on low-level details.

- Widgets should depend on a provider or a state contract, not directly on HTTP/database/platform implementation details.
- Wire dependencies through Riverpod and override them in tests where useful.
- Keep infrastructure imports out of pure business rules.
- Don't introduce an interface simply to invert dependencies when no volatile implementation boundary exists.

## A practical review

Before adding an abstraction, ask:
1. Which concrete change becomes easier because this exists?
2. Is this pattern already repeated or is there a credible current requirement?
3. Can the behavior be tested without constructing the whole app?
4. Does the new layer make dependency direction clearer?
5. Would a small function or composition solve this with less code?

If these questions do not have concrete answers, keep the implementation simpler.
