# Flutter Mobile Starter Kit

A product-neutral foundation for building thoughtful, maintainable Flutter applications for **Android and iOS**.

The goal is a starter kit that feels idiomatic to Flutter and Dart developers: intentionally small, well-structured, accessible, tested, and easy to adapt—not a generic framework full of abstractions.

> **Status:** Foundation planning. The repository is being established; it is not yet a runnable starter app.

## Principles

- **Flutter-first, Dart-idiomatic.** Follow official Flutter and Dart guidance; prefer straightforward code over clever frameworks.
- **Mobile only.** Android and iOS are supported targets. Web and desktop are out of scope unless explicitly reconsidered.
- **Feature-first, responsibility-driven.** Keep UI, state/logic, and data access separate without imposing layers that do no useful work.
- **One coherent design system.** Shared tokens and components should create consistency, not become a design framework of their own.
- **Accessible by default.** Support text scaling, semantics, keyboard and focus behavior where relevant, adequate touch targets, contrast, and reduced motion.
- **Localization is structural.** English and Arabic must work in real LTR and RTL layouts, not just translated strings.
- **Reliable over ornamental.** Correctness, privacy, platform behavior, and recoverability take priority over visual effects.
- **No unnecessary machinery.** No Freezed, build_runner, generated app models, product backend, analytics, authentication, or monetization by default.

## Intended stack

- Flutter stable and Dart
- Riverpod for app state and dependency wiring
- go_router for declarative navigation and deep links
- Handwritten models and serialization where needed
- Flutter/Dart tests and GitHub Actions quality checks

Package versions and SDK constraints will be chosen together during the runnable scaffold phase and verified in CI.

## What the foundation will provide

- Light, dark, and system theme modes
- Neutral design tokens for color, type, spacing, shape, and motion
- Small, accessible shared UI components with explicit APIs
- Predictable navigation and back behavior
- A clear approach to asynchronous loading, errors, empty states, and retry
- English and Arabic localization with correct directionality
- Focused testing, static analysis, formatting, and CI
- Concise documentation explaining how to start, adapt, test, and maintain the project

## Project structure

The initial structure will be feature-oriented, with a small app/core layer for genuinely cross-cutting concerns. Shared code will be promoted only when a pattern is real and reusable. See [Architecture](docs/ARCHITECTURE.md) and [Design system](docs/DESIGN_SYSTEM.md).

## Getting started

The runnable instructions will be added once the Flutter SDK scaffold and CI baseline have been created and verified. Do not treat this planning commit as a runnable Flutter project.

## Engineering contract

Repository instructions for contributors and coding agents live in [AGENTS.md](AGENTS.md). The staged implementation plan is in [Roadmap](docs/ROADMAP.md).

## Official references

- [Flutter app architecture guide](https://docs.flutter.dev/app-architecture/guide)
- [Flutter architecture recommendations](https://docs.flutter.dev/app-architecture/recommendations)
- [Effective Dart](https://dart.dev/effective-dart)
- [Flutter testing overview](https://docs.flutter.dev/testing/overview)
- [Flutter internationalization](https://docs.flutter.dev/ui/internationalization)
- [Flutter accessibility](https://docs.flutter.dev/ui/accessibility)
