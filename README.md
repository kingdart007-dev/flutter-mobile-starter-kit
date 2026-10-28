# Flutter Mobile Starter Kit

A product-neutral foundation for thoughtful, maintainable Flutter applications for **Android and iOS**.

The aim is a starter that feels idiomatic to Flutter and Dart developers: intentionally small, well-structured, accessible, tested, and easy to adapt—not a generic framework full of unnecessary abstractions.

> **Status: early foundation; not release-ready.** The official Flutter-generated Android/iOS project files and dependency lockfile are committed. The foundation includes persisted appearance and language preferences, handwritten English/Arabic localization, accessible shared loading/empty/error states, and tested route recovery/back-stack behavior. CI checks formatting, static analysis, widget tests, an Android debug build, and an iOS no-code-sign build. Release readiness still requires successful validation on both platforms and real-device accessibility/navigation review.

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

The project targets Flutter 3.44+ / Dart 3.12+ and declares Riverpod 3.4.x, go_router 18.1.x, and shared_preferences 2.5.x. The committed lockfile pins the currently resolved transitive dependency graph. Update dependencies deliberately and validate the result through CI.

- Flutter and Dart
- Riverpod without code generation
- go_router without route generation
- shared_preferences async API for non-critical local UI preferences
- Handwritten English/Arabic application strings without generated localization code
- Flutter tests and GitHub Actions

## Source structure

```text
lib/
  main.dart
  app/
    localization/
    preferences/
    router/
    theme/
    starter_kit_app.dart
  shared/
    ui/
      app_card.dart
      app_page.dart
      app_section_header.dart
      app_status_state.dart
  features/
    home/presentation/
    settings/presentation/
    design_system/presentation/
    foundation/presentation/
test/
  accessibility_test.dart
  app_navigation_test.dart
  router_error_recovery_test.dart
  shared_state_widgets_test.dart
  widget_test.dart
docs/
  ARCHITECTURE.md
  DESIGN_SYSTEM.md
  LOCALIZATION.md
  PATTERNS.md
  SOLID.md
  ROADMAP.md
AGENTS.md
```

## Guides

- [Contributor and coding-agent rules](AGENTS.md)
- [Architecture](docs/ARCHITECTURE.md)
- [Design system and style guide](docs/DESIGN_SYSTEM.md)
- [Localization conventions](docs/LOCALIZATION.md)
- [UI, UX, and engineering patterns](docs/PATTERNS.md)
- [Pragmatic SOLID principles](docs/SOLID.md)
- [Implementation roadmap](docs/ROADMAP.md)

## Getting started

Install Flutter stable and confirm `flutter doctor` is healthy. Android builds require the Android SDK; iOS builds require macOS and Xcode.

The official native project files and `pubspec.lock` are now checked in. From the repository root:

```sh
flutter pub get
dart format --output=none --set-exit-if-changed lib test
flutter analyze --fatal-infos
flutter test --coverage
```

To launch on a connected Android device/emulator, run `flutter run`. For a local Android build, run `flutter build apk --debug`. An iOS build requires macOS and Xcode; run `flutter build ios --no-codesign` on that platform. See [the CI workflow](.github/workflows/flutter-ci.yml) for the canonical validation commands.

## Official references

- [Flutter app architecture guide](https://docs.flutter.dev/app-architecture/guide)
- [Flutter architecture recommendations](https://docs.flutter.dev/app-architecture/recommendations)
- [Effective Dart](https://dart.dev/effective-dart)
- [Flutter testing overview](https://docs.flutter.dev/testing/overview)
- [Flutter internationalization](https://docs.flutter.dev/ui/internationalization)
- [Flutter accessibility](https://docs.flutter.dev/ui/accessibility)
