# Implementation roadmap

Complete work in small, verifiable phases. A committed file is not proof that the app builds or behaves correctly; CI and platform checks are part of the deliverable.

## Phase 0 — Project contract

- [x] Confirm repository purpose and Android/iOS-only scope.
- [x] Record engineering instructions for contributors and coding agents.
- [x] Record architecture, design-system, patterns, and SOLID principles.

## Phase 1 — Runnable Flutter scaffold

- [x] Establish an SDK baseline (Flutter 3.44+ / Dart 3.12+) and dependency constraints.
- [x] Add Riverpod and go_router without Freezed or code generation.
- [x] Add app entry point, root app shell, central theme entry point, and example screens/routes.
- [x] Add initial widget tests.
- [x] Add GitHub Actions quality and platform-build workflows.
- [x] Generate and commit the official Android/iOS platform scaffold using Flutter CLI.
- [x] Resolve and commit `pubspec.lock`.
- [x] Verify formatting, analysis, widget tests, and Android debug build on the bootstrap commit.
- [ ] Obtain a successful iOS build result; the bootstrap iOS job was cancelled.
- [ ] Re-run all CI checks after preference/localization changes.

## Phase 2 — App shell and luxury monochrome design foundation

- [x] Define a neutral palette and light/dark semantic surface roles.
- [x] Centralize spacing, radius, typography adjustments, and motion tokens.
- [x] Add AppPage, AppCard, and AppSectionHeader.
- [x] Add a live design-system showcase and style/architecture guidance.
- [x] Add persisted System/Light/Dark theme preference.
- [x] Add persisted System/English/Arabic locale preference.
- [ ] Verify all new preference, locale, theme, and navigation behavior in CI.
- [ ] Verify color contrast, touch targets, text scaling, and component states.
- [ ] Confirm optional animated transitions honor reduced-motion settings.
- [ ] Review on real Android and iOS device/simulator sizes.

## Phase 3 — Localization and accessibility

- [x] Add handwritten English and Arabic application strings without generated source.
- [x] Use Flutter framework localization delegates for supported Material controls and directionality.
- [x] Add user-selectable language and direction-aware layout primitives.
- [ ] Test long Arabic strings, mixed Arabic/Latin content, and large text.
- [ ] Audit all current UI strings and ensure both locales remain complete.
- [ ] Test semantics, focus order, contrast, touch targets, and reduced motion.
- [ ] Add additional accessibility tests for shared components.

## Phase 4 — Navigation and common UX states

- [x] Add centralized go_router route configuration.
- [ ] Verify Android system back and iOS navigation behavior on devices/simulators.
- [ ] Exercise nested routes, dialogs/sheets, and state preservation before adding complexity.
- [ ] Define loading, empty, error, retry, validation, and feedback patterns where genuinely needed.
- [ ] Document navigation and state-preservation conventions.

## Phase 5 — Quality gates

- [x] Add CI on pushes to the default branch, pull requests, and manual dispatch.
- [x] Verify formatting, analysis, widget tests, and Android debug build on the scaffold commit.
- [ ] Verify the updated preference/localization commit is green.
- [ ] Confirm iOS build succeeds on a macOS runner.
- [ ] Add targeted integration tests for critical flows where widget tests are insufficient.
- [ ] Review dependency licensing/platform support and require CI status before merge where supported.

## Phase 6 — Hardening and release readiness

- [ ] Review dependency/security updates and remove unnecessary packages.
- [ ] Audit configuration and logging for secrets or sensitive data.
- [ ] Check performance, startup behavior, accessibility, localization, and recovery paths.
- [ ] Verify a clean checkout builds with documented commands.
- [ ] Tag a first usable version only after all required checks pass.

## Exit criteria

The starter is ready for adoption only when a clean checkout can resolve dependencies and pass formatting, static analysis, automated tests, and Android/iOS build validation; when platform files and the lockfile are committed; when docs are accurate; and when mobile, localization, and accessibility behavior has been verified rather than merely planned.
