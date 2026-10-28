# Implementation roadmap

The repository is currently in the planning stage. Complete work in small, verifiable phases; do not treat a committed file as proof that the app works.

## Phase 0 — Project contract

- [x] Confirm repository purpose and Android/iOS-only scope.
- [x] Record engineering instructions for contributors and coding agents.
- [x] Record architecture and design-system principles.
- [x] Define a staged delivery plan.
- [ ] Review these conventions against the first runnable implementation and adjust only where evidence justifies it.

## Phase 1 — Runnable Flutter scaffold

- [ ] Generate the official Android/iOS baseline using the current stable Flutter SDK.
- [ ] Choose a stable SDK constraint and compatible dependency versions.
- [ ] Add Riverpod and go_router with the smallest required dependency set.
- [ ] Create a minimal app entry point and a deliberately simple home screen.
- [ ] Confirm Android and iOS project files are valid.
- [ ] Commit the dependency lockfile for reproducible app builds.
- [ ] Add initial smoke/widget test.
- [ ] Add setup instructions only after the commands have been verified.

## Phase 2 — App shell and design foundation

- [ ] Add semantic design tokens and theme extensions only where required.
- [ ] Implement light, dark, and system theme modes.
- [ ] Set typography, spacing, shape, and focus conventions.
- [ ] Add the minimum app/page scaffold and shared layout patterns.
- [ ] Add meaningful component tests and visual state coverage.

## Phase 3 — Localization and accessibility

- [ ] Add English and Arabic string resources using the agreed no-code-generation approach.
- [ ] Verify app direction changes with locale and explicit direction context where applicable.
- [ ] Verify directional icon mirroring without mirroring non-directional symbols.
- [ ] Test large text, semantics, focus order, contrast, and reduced motion.
- [ ] Test long translated strings, mixed Arabic/Latin text, and numeric/date formatting.

## Phase 4 — Navigation and common UX states

- [ ] Add a minimal go_router configuration with correct route/back behavior.
- [ ] Define shared loading, empty, error, retry, validation, and feedback patterns only where needed.
- [ ] Verify dialogs/sheets and Android/iOS back behavior.
- [ ] Document navigation and state-preservation conventions.

## Phase 5 — Quality gates

- [ ] Add CI on pull requests and pushes to the default branch.
- [ ] Run formatting checks, `flutter analyze`, and `flutter test`.
- [ ] Add targeted integration tests for the essential app flows.
- [ ] Validate Android build in CI; validate iOS build on a macOS runner.
- [ ] Keep dependency changes deliberate and review licensing/platform support.
- [ ] Confirm CI status is visible and setup docs match actual workflows.

## Phase 6 — Hardening and release readiness

- [ ] Review dependency/security updates and remove unnecessary packages.
- [ ] Audit configuration and logging for secrets or sensitive data.
- [ ] Check performance, startup behavior, accessibility, localization, and recovery paths.
- [ ] Verify a clean checkout builds with documented commands.
- [ ] Tag a first usable version only after all required checks pass.

## Exit criteria

The starter is ready for adoption only when a clean checkout can resolve dependencies and pass formatting, static analysis, automated tests, and Android/iOS build validation; when docs are accurate; and when the mobile, localization, and accessibility behaviors have been verified rather than merely planned.
