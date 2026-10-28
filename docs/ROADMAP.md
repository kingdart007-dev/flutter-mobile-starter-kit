# Implementation roadmap

Complete work in small, verifiable phases. A committed file is not proof that the app builds or behaves correctly; CI and platform checks are part of the deliverable.

## Phase 0 — Project contract

- [x] Confirm repository purpose and Android/iOS-only scope.
- [x] Record engineering instructions for contributors and coding agents.
- [x] Record architecture and design-system principles.
- [x] Define a staged delivery plan.

## Phase 1 — Runnable Flutter scaffold

- [x] Establish an SDK baseline (Flutter 3.44+ / Dart 3.12+) and dependency constraints.
- [x] Add Riverpod and go_router without Freezed or code generation.
- [x] Add app entry point, root app shell, central theme entry point, and a minimal home screen.
- [x] Add example routes and initial widget tests.
- [x] Add GitHub Actions workflows for formatting, analysis, tests, and Android/iOS build validation.
- [ ] Run the workflow and review real output; fix all errors rather than assuming the source passes.
- [ ] Generate and commit the official Android/iOS native platform scaffold.
- [ ] Resolve and commit `pubspec.lock` for reproducible app dependency resolution.
- [ ] Confirm first-checkout setup commands and build instructions on a clean environment.

## Phase 2 — App shell and luxury monochrome design foundation

- [x] Define a neutral palette with separate light/dark semantic surface roles.
- [x] Centralize spacing, shape/radius, typography adjustments, and motion tokens.
- [x] Add a shared scroll-safe page scaffold, a themed card surface, and a section-heading component.
- [x] Apply a restrained card-based style to the example app and add a live design-system showcase.
- [x] Document the style guide, reusable UI patterns, and pragmatic SOLID principles.
- [ ] Add a persisted, user-selectable Light/Dark/System theme preference without race conditions.
- [ ] Verify color contrast, touch targets, text scaling, and component states with tests.
- [ ] Confirm animated transitions honor reduced-motion settings.
- [ ] Review the design on real Android and iOS device/simulator sizes.

## Phase 3 — Localization and accessibility

- [ ] Add English and Arabic string resources using the agreed no-code-generation approach.
- [ ] Verify app direction changes with locale and explicit direction context where applicable.
- [ ] Verify directional icon mirroring without mirroring non-directional symbols.
- [ ] Test large text, semantics, focus order, contrast, touch targets, and reduced motion.
- [ ] Test long translated strings, mixed Arabic/Latin text, and numeric/date formatting.

## Phase 4 — Navigation and common UX states

- [ ] Verify Android system back and iOS navigation behavior on devices/simulators.
- [ ] Exercise nested routes, dialogs/sheets, and state preservation before adding complexity.
- [ ] Define loading, empty, error, retry, validation, and feedback patterns only where needed.
- [ ] Document navigation and state-preservation conventions.

## Phase 5 — Quality gates

- [x] Add CI on pushes to the default branch, pull requests, and manual dispatch.
- [ ] Confirm formatting, `flutter analyze`, and `flutter test` jobs are green.
- [ ] Add targeted integration tests for critical flows when widget tests are insufficient.
- [ ] Confirm Android build in CI and iOS build on a macOS runner both pass.
- [ ] Review dependency licensing/platform support and require CI status before merge where supported.

## Phase 6 — Hardening and release readiness

- [ ] Review dependency/security updates and remove unnecessary packages.
- [ ] Audit configuration and logging for secrets or sensitive data.
- [ ] Check performance, startup behavior, accessibility, localization, and recovery paths.
- [ ] Verify a clean checkout builds with documented commands.
- [ ] Tag a first usable version only after all required checks pass.

## Exit criteria

The starter is ready for adoption only when a clean checkout can resolve dependencies and pass formatting, static analysis, automated tests, and Android/iOS build validation; when native platform files and the lockfile are committed; when docs are accurate; and when mobile, localization, and accessibility behavior has been verified rather than merely planned.
