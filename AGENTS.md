# Repository instructions for coding agents

These instructions apply to every change in this repository. The objective is a high-quality independent Flutter starter kit—not a claim that this project is built or endorsed by Google or the Flutter team.

## Product boundaries

- Ship a reusable, product-neutral foundation for **Android and iOS only**.
- Do not add web or desktop targets unless the owner explicitly changes scope.
- Do not invent a sample business, backend, authentication flow, analytics, AI service, monetization, or brand identity.
- English and Arabic, genuine LTR/RTL behavior, and Light/Dark/System themes are foundational requirements.
- The visual direction is **luxury monochrome**: warm white, black/ink, graphite, nuanced greys, generous whitespace, clear type hierarchy, softly rounded cards, and fine separators.
- Use an iOS-quality feel as inspiration for craft and interaction, but respect Android as a first-class target. Prefer platform defaults/adaptive controls before custom interaction physics.
- Avoid emojis as app icons, decorative gradients/glows/noise, heavy elevation, clutter, and motion that does not clarify behavior.

## Engineering rules

1. Read the relevant files and current repository patterns before editing. Prefer a small, coherent change over a broad rewrite.
2. Follow current official Flutter/Dart guidance and the APIs of the versions actually declared by the project. Do not assume an API or dependency version is current without checking.
3. Follow Effective Dart. Use clear names, small focused classes, explicit responsibilities, and consistent formatting.
4. Keep a clear UI/data boundary. Use Riverpod for state and dependency wiring, and go_router for navigation. Prefer Notifier/AsyncNotifier-style state where appropriate to the installed Riverpod version.
5. Introduce repositories, interfaces, services, or shared widgets when they provide a real boundary or remove meaningful duplication—not just to satisfy a pattern.
6. Keep dependencies moving in one direction. Avoid circular imports, global mutable state, service locators, god classes, giant widgets, duplicate token systems, and parallel state-management systems.
7. No Freezed, build_runner, or code generation for application models/state. Use handwritten model mapping and copy methods when needed. Keep localization compatible with the no-code-generation decision; do not silently introduce generated localization code.
8. Never commit secrets, credentials, personal data, real API keys, or sensitive logs. Do not use `print()` for application logging. Do not add network calls or persistent storage without a documented need and safe behavior.
9. Do not suppress analyzer diagnostics broadly. Explain any necessary targeted ignore and keep its scope minimal.
10. Prefer framework/platform capabilities before adding a package. For every new dependency, document the concrete requirement it satisfies and confirm platform support, maintenance, license, and SDK compatibility.

## UX and accessibility requirements

- Keep all color, spacing, radii, type, and motion decisions in one shared design system. Use semantic ColorScheme roles inside components rather than hard-coded primitive colors.
- Support light, dark, and system theme modes; do not introduce a second theme/token mechanism.
- Do not depend on color alone to communicate a state. Honor text scaling; avoid fixed-height text containers that clip localized content.
- Provide meaningful semantics/labels, logical focus and reading order, adequate touch targets, clear validation and recovery, and reduced-motion behavior.
- Use direction-aware layout primitives. Mirror only directional icons; do not mirror symbols whose meaning is not directional.
- Preserve navigation and form state when appropriate. Respect Android system back and iOS navigation conventions.
- Keep UI strings out of widgets where localization belongs. Never build RTL support by reversing strings manually.

## Testing and validation

For each meaningful change:
- Add or update tests for the behavior introduced.
- Format Dart code with `dart format`.
- Run `flutter analyze` and relevant `flutter test` commands when a Flutter SDK environment is available.
- Test important loading, success, empty, error, retry, and disabled states where applicable.
- Consider accessibility, theme, locale/direction, text scaling, and platform behavior in widget tests.
- Do not claim a command or test passed unless it was actually run and its result was observed.
- If tooling is unavailable, state exactly what could not be verified and add CI coverage rather than guessing.

## Change discipline

- Keep documentation aligned with actual implementation; distinguish planned work from working functionality.
- Avoid placeholders that appear functional, speculative abstractions, unnecessary generated/binary files, and large unrelated changes.
- Preserve the official Flutter scaffold's platform configuration where possible. Prefer generating baseline Android/iOS project files with the Flutter SDK rather than hand-inventing native project files.
- Explain meaningful trade-offs in documentation or a short decision record.
- Before declaring the starter ready, confirm a clean checkout can resolve dependencies, analyze, test, and build for the supported mobile platforms in CI.

## Definition of done

A change is done only when its behavior and limitations are clear, tests cover relevant behavior, formatting/static analysis are clean or documented, accessibility/localization concerns are addressed, documentation is accurate, and CI evidence exists when applicable.
