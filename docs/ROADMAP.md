# Implementation roadmap

Complete work in small, verifiable phases. A committed file is not proof that the application builds or behaves correctly; CI and platform checks are part of the deliverable.

## Phase 0 — Project contract

- [x] Confirm repository purpose and Android/iOS-only scope.
- [x] Record engineering instructions for contributors and coding agents.
- [x] Record architecture and design-system principles.
- [x] Define a staged delivery plan.
- [ ] Review the conventions against the evolving implementation and adjust only where evidence justifies it.

## Phase 1 — Runnable Flutter scaffold

- [x] Establish an SDK baseline (Flutter 3.44+ / Dart 3.12+) and compatible dependency constraints.
- [x] Add Riverpod and go_router without Freezed or code generation.
- [x] Add app entry point, root app shell, central theme entry point, and a minimal home screen.
- [x] Add an example route and a second screen to exercise navigation.
- [x] Add initial widget tests for rendering and navigation behavior.
- [x] Add GitHub Actions workflows for format, analysis, tests, and Android/iOS build validation.
- [ ] Run the workflow and review real output; fix all errors rather than assuming the source passes.
- [ ] Generate and commit the official Android/iOS native platform scaffold.
- [ ] Resolve and commit `pubspec.lock` for reproducible application dependency resolution.
- [ ] Confirm first-checkout setup commands and build instructions on a clean environment.

**Current phase status:** source and CI definitions are committed; the native project directories and lockfile remain pending. The workflow generates platform scaffolding in its temporary workspace so it can attempt platform builds without hand-written native files.

## Phase 2 — App shell and design foundation

- [ ] Add semantic design tokens and theme extensions only where required.
- [ ] Implement a user-selectable Light, Dark, and System theme mode.
- [ ] Set typography, spacing, shape, focus, and motion conventions.
- [ ] Add only the shared page/layout and UI components justified by repeated use.
- [ ] Add meaningful component tests and state coverage for light and dark themes.

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

- [x] Add CI on pull requests and pushes to the default branch.
- [ ] Confirm formatting, `flutter analyze`, and `flutter test` jobs are green.
- [ ] Add targeted integration tests for essential app flows where widget tests are insufficient.
- [ ] Confirm Android build in CI and iOS build on a macOS runner both pass.
- [ ] Keep dependency changes deliberate and review licensing/platform support.
- [ ] Confirm CI status is visible and repository checks are required before merging where supported.

## Phase 6 — Hardening and release readiness

- [ ] Review dependency/security updates and remove unnecessary packages.
- [ ] Audit configuration and logging for secrets or sensitive data.
- [ ] Check performance, startup behavior, accessibility, localization, and recovery paths.
- [ ] Verify a clean checkout builds with documented commands.
- [ ] Tag a first usable version only after all required checks pass.

## Exit criteria

The starter is ready for adoption only when a clean checkout can resolve dependencies and pass formatting, static analysis, automated tests, and Android/iOS build validation; when the platform files and lockfile are committed; when docs are accurate; and when mobile, localization, and accessibility behavior has been verified rather than merely planned.
