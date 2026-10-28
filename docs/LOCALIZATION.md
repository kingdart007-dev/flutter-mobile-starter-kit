# Localization conventions

The starter supports English and Arabic, including a real right-to-left layout direction. Application strings are handwritten and code generation is intentionally avoided.

## Runtime setup

- Supported locales are declared in `AppStrings.supportedLocales`.
- `AppStrings.delegate` loads the handwritten string resource for the active locale.
- Flutter's `GlobalMaterialLocalizations.delegates` supplies framework/widget localization, including correct directionality for supported locales.
- A saved locale preference can be System, English, or Arabic. System sets `MaterialApp.locale` to null so Flutter follows the platform's preferred locale when it is supported.
- The current locale preference is persisted through `SharedPreferencesAsync`. This is a convenience setting, not critical data.

## Adding or changing a string

1. Add a typed getter to `lib/app/localization/app_strings.dart`.
2. Provide both English and Arabic values in that getter.
3. Consume it through `AppStrings.of(context)`; do not put user-facing literal strings in a widget.
4. Add/adjust a widget test for the behavior and for both language contexts when relevant.

Avoid string keys passed around as untyped values. Typed getters provide IDE navigation and compile-time discoverability without generated sources.

## Direction and layout

- Let Flutter's `Directionality` follow the selected locale.
- Prefer `EdgeInsetsDirectional`, `AlignmentDirectional`, `start`/ `end`, and direction-aware icons for layout intent.
- Set `matchTextDirection: true` only on icons whose meaning is directional.
- Never manually reverse text or rely on left/right-specific layout for a reusable component.
- Mixed Arabic/Latin strings, identifiers, code samples, numerals, and formatted dates may need dedicated layout or formatting tests.

## Framework and product strings

Flutter's Material/Cupertino widgets use the framework localization delegates. Product text is maintained by `AppStrings`. If the app grows beyond this small foundation, consider a typed resource catalogue or a future localization generation migration only after explicitly changing the no-code-generation decision; do not introduce generated files silently.

## Test checklist

- English LTR and Arabic RTL
- Long translated labels and multi-line body text
- Large accessibility text scales
- Icon mirroring and back/navigation affordances
- Mixed Arabic/Latin labels and numeric content
- System theme and explicit language preference persistence
