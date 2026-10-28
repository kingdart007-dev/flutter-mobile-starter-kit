# Flutter Mobile Starter Kit

A product-neutral foundation for thoughtful, maintainable Flutter applications for **Android and iOS**.

The aim is a starter that feels idiomatic to Flutter and Dart developers: intentionally small, well-structured, accessible, tested, and easy to adapt—not a generic framework full of unnecessary abstractions.

> **Status: early foundation.** The repository has a minimal Flutter app source shell, initial widget tests, monochrome design tokens, shared UI primitives, a live design-system showcase, architecture guidance, and CI definitions. Native platform files, a committed dependency lockfile, verified CI results, localization, and broader accessibility validation remain outstanding. This is not yet a release-ready starter.

## Design direction

**Luxury monochrome. Quietly confident.** Warm whites, ink black, graphite, nuanced greys, generous whitespace, confident typography, soft rounded cards, fine separators, and restrained motion. The goal is the craft and clarity of good native phone interfaces while respecting Android and iOS conventions.

## Principles

- Flutter-first and Dart-idiomatic; follow official guidance rather than copying internal implementation details.
- Mobile only: Android and iOS.
- Feature-oriented, responsibility-driven architecture with clear dependency direction.
- Riverpod for state/dependency wiring; go_router for navigation.
- A single theme and token system for colors, spacing, radii, typography, and motion.
- English/Arabic localization, genuine LTR/RTL behavior, and light/dark/system themes as foundation requirements.
- Accessibility, recovery, correctness, and platform behavior before decorative polish.
- No Freezed, build_runner, generated application models, unrequested backend, analytics, authentication, AI, or monetization.

## Stack

The dependency baseline currently targets Flutter 3.44+ / Dart 3.12+ and declares Riverpod 3.4.x and go_router 18.1.x. Package metadata indicates the chosen routing release requires Dart 3.12 / Flutter 3.44 or newer; successful CI and a committed lockfile are still required to confirm full resolution.

- Flutter and Dart
- Riverpod without code generation
- go_router without route generation
- Handwritten state/models where needed
- Flutter tests and GitHub Actions

## Source structure

```text
lib/
  main.dart
  app/
    starter_kit_app.dart
    router/
    theme/
  shared/
    ui/
  features/
    home/presentation/
    design_system/presentation/
    foundation/presentation/
test/
  widget_test.dart
docs/
  ARCHITECTURE.md
  DESIGN_SYSTEM.md
  PATTERNS.md
  SOLID.md
  ROADMAP.md
AGENTS.md
```

## Guides

- [Contributor and coding-agent rules](AGENTS.md)
- [Architecture](docs/ARCHITECTURE.md)
- [Design system and style guide](docs/DESIGN_SYSTEM.md)
- [UI, UX, and engineering patterns](docs/PATTERNS.md)
- [Pragmatic SOLID principles](docs/SOLID.md)
- [Implementation roadmap](docs/ROADMAP.md)

## Getting started

Install Flutter stable and confirm `flutter doctor` is healthy. Android builds require the Android SDK; iOS builds require macOS and Xcode.

Native `android/` and `ios/` directories and `pubspec.lock` have not yet been committed, so the repository is still being scaffolded. The temporary CI workflow attempts to generate native scaffolding with Flutter's own CLI. Once the platform files and lockfile are generated, committed, and validated, this section will be finalized for clean-checkout use.

## Official references

- [Flutter release notes](https://docs.flutter.dev/release/release-notes)
- [Flutter app architecture guide](https://docs.flutter.dev/app-architecture/guide)
- [Flutter architecture recommendations](https://docs.flutter.dev/app-architecture/recommendations)
- [Effective Dart](https://dart.dev/effective-dart)
- [Flutter testing overview](https://docs.flutter.dev/testing/overview)
- [Flutter Cupertino design](https://docs.flutter.dev/ui/design/cupertino)
- [Flutter accessibility](https://docs.flutter.dev/ui/accessibility)
