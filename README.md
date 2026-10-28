# Flutter Mobile Starter Kit

A product-neutral foundation for building thoughtful, maintainable Flutter applications for **Android and iOS**.

The goal is a starter kit that feels idiomatic to Flutter and Dart developers: intentionally small, well-structured, accessible, tested, and easy to adapt—not a generic framework full of abstractions.

> **Status: early app scaffold.** The Dart app shell, navigation example, first widget tests, and CI workflow are now committed. The generated `android/` and `ios/` project directories and `pubspec.lock` are not yet checked in. CI creates the native scaffolding with the official Flutter CLI for its build jobs. This is not yet a release-ready starter; the roadmap tracks the remaining validation and repository setup.

## Principles

- **Flutter-first, Dart-idiomatic.** Follow official Flutter and Dart guidance; prefer straightforward code over clever frameworks.
- **Mobile only.** Android and iOS are supported targets. Web and desktop are out of scope unless explicitly reconsidered.
- **Feature-first, responsibility-driven.** Keep UI, state/logic, and data access separate without imposing layers that do no useful work.
- **One coherent design system.** Shared tokens and components should create consistency, not become a design framework of their own.
- **Accessible by default.** Support text scaling, semantics, keyboard and focus behavior where relevant, adequate touch targets, contrast, and reduced motion.
- **Localization is structural.** English and Arabic must work in real LTR and RTL layouts, not just translated strings.
- **Reliable over ornamental.** Correctness, privacy, platform behavior, and recoverability take priority over visual effects.
- **No unnecessary machinery.** No Freezed, build_runner, generated app models, product backend, analytics, authentication, or monetization by default.

## Stack

The first scaffold targets Flutter 3.44+ / Dart 3.12+ and uses:

- Flutter and Dart
- Riverpod for app state and dependency wiring
- go_router for declarative navigation
- Handwritten Dart code; no Freezed or code generation
- Flutter/Dart tests and GitHub Actions quality checks

See the [go_router package requirements](https://pub.dev/packages/go_router/versions/18.1.1) and [Riverpod package](https://pub.dev/packages/flutter_riverpod) for current package metadata. Dependency compatibility and CI results still need to be verified by the first successful workflow run.

## Getting started

Install Flutter stable and confirm `flutter doctor` is healthy. Android builds require the Android SDK; iOS builds require macOS and Xcode.

Because the generated native platform directories are not checked in yet, generate them once from the repository root using the official Flutter CLI:

```sh
flutter create --platforms=android,ios --project-name=flutter_mobile_starter_kit --org=com.kingdart --no-pub .
flutter pub get
```

Then run the local quality checks:

```sh
dart format lib test
flutter analyze --fatal-infos
flutter test
```

Launch on a connected Android device/emulator with `flutter run`. iOS simulator/device builds require macOS and Xcode. The setup instructions will be simplified after the native scaffold, dependency lockfile, and CI have been validated and committed.

## Current source layout

```text
lib/
  main.dart
  app/
    starter_kit_app.dart
    router/app_router.dart
    theme/app_theme.dart
  features/
    home/presentation/home_screen.dart
    foundation/presentation/foundation_screen.dart
test/
  widget_test.dart
```

Keep shared code in a small core/shared layer only when it is genuinely cross-cutting. Promote repeated UI patterns into shared components when the public API and reuse are clear—not preemptively.

## Planned foundation

- Light, dark, and system theme modes from a central theme
- Neutral tokens for color, typography, spacing, shape, and motion
- Small, accessible shared UI components with explicit APIs
- Predictable navigation and platform-correct back behavior
- Loading, empty, error, retry, validation, and feedback patterns where needed
- English and Arabic localization with correct directionality
- Focused tests, static analysis, formatting, and CI
- Concise documentation explaining how to adapt and maintain the project

## Engineering contract

Repository instructions for contributors and coding agents live in [AGENTS.md](AGENTS.md). See [Architecture](docs/ARCHITECTURE.md), [Design system](docs/DESIGN_SYSTEM.md), and the [implementation roadmap](docs/ROADMAP.md).

## Official references

- [Flutter app architecture guide](https://docs.flutter.dev/app-architecture/guide)
- [Flutter architecture recommendations](https://docs.flutter.dev/app-architecture/recommendations)
- [Effective Dart](https://dart.dev/effective-dart)
- [Flutter testing overview](https://docs.flutter.dev/testing/overview)
- [Flutter internationalization](https://docs.flutter.dev/ui/internationalization)
- [Flutter accessibility](https://docs.flutter.dev/ui/accessibility)
