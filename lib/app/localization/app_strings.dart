import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// Handwritten application strings for the supported locales.
///
/// This keeps localization explicit and avoids generated source files. Add
/// each new UI string to both locales together.
class AppStrings {
  const AppStrings(this.locale);

  final Locale locale;

  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ar'),
  ];

  static const LocalizationsDelegate<AppStrings> delegate =
      _AppStringsDelegate();

  static AppStrings of(BuildContext context) {
    final AppStrings? strings = Localizations.of<AppStrings>(
      context,
      AppStrings,
    );
    assert(strings != null, 'AppStrings delegate is missing.');
    return strings!;
  }

  bool get isArabic => locale.languageCode == 'ar';

  String _text(String english, String arabic) =>
      isArabic ? arabic : english;

  String get appName => _text(
        'Flutter Mobile Starter Kit',
        'مجموعة أساسيات Flutter',
      );
  String get homeTitle => _text('Mobile foundation', 'أساس تطبيقات الهاتف');
  String get designSystemTitle => _text('Design system', 'نظام التصميم');
  String get foundationTitle => _text('Engineering principles', 'مبادئ الهندسة');
  String get settingsTitle => _text('Preferences', 'التفضيلات');
  String get settingsTooltip => _text('App preferences', 'تفضيلات التطبيق');
  String get designSystemTooltip => _text('Explore the design system', 'استكشف نظام التصميم');
  String get pageUnavailable => _text('Page unavailable', 'الصفحة غير متاحة');
  String get pageUnavailableMessage => _text(
        'We could not find that page.',
        'لم نتمكن من العثور على هذه الصفحة.',
      );

  String get homeEyebrow => _text('FLUTTER · ANDROID + IOS', 'FLUTTER · أندرويد + iOS');
  String get homeHeadline => _text('Quietly capable.', 'بساطة مدروسة.');
  String get homeDescription => _text(
        'A considered starting point for mobile apps: clarity in the interface, intention in the architecture, and quality built into the workflow.',
        'نقطة بداية مدروسة لتطبيقات الهاتف: واجهة واضحة، وبنية مقصودة، وجودة مدمجة في سير العمل.',
      );
  String get solidFoundation => _text('A solid foundation', 'أساس متين');
  String get solidFoundationDescription => _text(
        'The best abstraction is the one that makes the next change easier — not the one that adds the most code.',
        'أفضل تجريد هو ما يجعل التغيير التالي أسهل، لا ما يضيف مزيداً من الشيفرة.',
      );
  String get mobileFirst => _text('Mobile, first', 'الهاتف أولاً');
  String get mobileFirstDescription => _text(
        'Respect platform navigation, motion, and safe areas.',
        'احترام التنقل والحركة والمساحات الآمنة لكل منصة.',
      );
  String get clearBoundaries => _text('Clear boundaries', 'حدود واضحة');
  String get clearBoundariesDescription => _text(
        'Riverpod for state and dependencies; go_router for routes.',
        'Riverpod للحالة والاعتماديات، وgo_router للمسارات.',
      );
  String get accessibleByDefault => _text('Accessible by default', 'إمكانية الوصول افتراضياً');
  String get accessibleByDefaultDescription => _text(
        'Text scaling, semantics, contrast, and recovery matter.',
        'تكبير النص والدلالات والتباين والتعافي أمور أساسية.',
      );
  String get exploreFoundation => _text('EXPLORE THE FOUNDATION', 'استكشف الأساس');
  String get designSystemDescription => _text(
        'Monochrome tokens, type, surfaces, and controls.',
        'ألوان أحادية والخطوط والأسطح وعناصر التحكم.',
      );
  String get engineeringDescription => _text(
        'Simple architecture, SOLID, and purposeful patterns.',
        'بنية بسيطة ومبادئ SOLID وأنماط هادفة.',
      );

  String get foundationEyebrow => _text('HOW WE BUILD', 'كيف نبني');
  String get foundationHeadline => _text(
        'Principles, not layers for their own sake.',
        'مبادئ واضحة، لا طبقات بلا داعٍ.',
      );
  String get foundationDescription => _text(
        'Start with the smallest structure that solves the real problem. Add complexity only when it improves clarity, testability, or user experience.',
        'ابدأ بأبسط بنية تحل المشكلة الحقيقية. أضف التعقيد فقط عندما يحسن الوضوح أو قابلية الاختبار أو تجربة المستخدم.',
      );
  String get easyPathTitle => _text('Make the easy path the good path', 'اجعل المسار الأسهل هو الأفضل');
  String get easyPathDescription => _text(
        'Sensible defaults, clear naming, and few decisions before a developer can build a screen.',
        'إعدادات افتراضية منطقية وأسماء واضحة وقرارات أقل قبل بناء الشاشة.',
      );
  String get testableTitle => _text('Keep behavior testable', 'اجعل السلوك قابلاً للاختبار');
  String get testableDescription => _text(
        'Separate decisions from rendering and keep dependencies explicit and replaceable in tests.',
        'افصل القرارات عن العرض واجعل الاعتماديات واضحة وقابلة للاستبدال في الاختبارات.',
      );
  String get platformTitle => _text('Respect the platform', 'احترم المنصة');
  String get platformDescription => _text(
        'Navigation, accessibility, text scaling, and system settings are product behavior—not polish to add later.',
        'التنقل وإمكانية الوصول وتكبير النص وإعدادات النظام جزء من المنتج، وليست تحسينات مؤجلة.',
      );
  String get foundationFooter => _text(
        'This starter evolves in small, verifiable phases. Planned capabilities are documented separately from implemented and tested behavior.',
        'يتطور هذا المشروع على مراحل صغيرة قابلة للتحقق. نفصل القدرات المخطط لها عن السلوك المنفذ والمختبر.',
      );

  String get designEyebrow => _text('STYLE GUIDE · 01', 'دليل الأسلوب · 01');
  String get designHeadline => _text('The visual language.', 'لغة بصرية متناسقة.');
  String get designDescription => _text(
        'Luxury through restraint: a neutral palette, confident typography, generous space, and surfaces that feel considered rather than decorated.',
        'فخامة بلا مبالغة: لوحة محايدة وخطوط واثقة ومساحات رحبة وأسطح مدروسة لا مزخرفة.',
      );
  String get monochromePalette => _text('Monochrome palette', 'لوحة أحادية اللون');
  String get colorIsRole => _text('Color is a role, not an ornament.', 'اللون يؤدي وظيفة، لا يضيف زينة.');
  String get ink => _text('Ink', 'حبر');
  String get graphite => _text('Graphite', 'جرافيت');
  String get mist => _text('Mist', 'ضباب');
  String get paper => _text('Paper', 'ورق');
  String get typography => _text('Typography', 'الخطوط');
  String get hierarchyFirst => _text('Hierarchy first. Decoration last.', 'التسلسل أولاً، والزخرفة أخيراً.');
  String get displayLabel => _text('Display', 'عنوان رئيسي');
  String get displaySample => _text('Make room\nfor clarity.', 'اترك مساحة\nللوضوح.');
  String get sectionHeading => _text('Section heading', 'عنوان قسم');
  String get typographyBody => _text(
        'Body copy should stay readable, relaxed, and comfortable at larger accessibility text sizes.',
        'يجب أن يظل النص واضحاً ومريحاً حتى مع أحجام الخط الكبيرة لإمكانية الوصول.',
      );
  String get surfaces => _text('Surfaces', 'الأسطح');
  String get surfaceDescription => _text(
        'Group related content; leave the rest open.',
        'اجمع المحتوى المترابط واترك الباقي بسيطاً.',
      );
  String get standardCard => _text('Standard card', 'بطاقة أساسية');
  String get cardDescription => _text(
        'White surface, fine neutral outline, 20 px radius, no heavy shadow.',
        'سطح أبيض وحد محايد رفيع وزوايا 20 بكسل بلا ظل ثقيل.',
      );
  String get secondarySurface => _text('Secondary surface', 'سطح ثانوي');
  String get controls => _text('Controls', 'عناصر التحكم');
  String get controlsDescription => _text(
        'Clear labels, comfortable targets, quiet feedback.',
        'تسميات واضحة ومساحات لمس مريحة واستجابة هادئة.',
      );
  String get primaryAction => _text('Primary action', 'الإجراء الأساسي');
  String get secondaryAction => _text('Secondary action', 'الإجراء الثانوي');
  String get buttonGuidance => _text(
        'Buttons use a minimum 48 px height. Real actions should always have a clear label and a meaningful result.',
        'يبلغ ارتفاع الأزرار 48 بكسل على الأقل. يجب أن يحمل كل إجراء تسمية واضحة ونتيجة مفيدة.',
      );
  String get spacingRhythm => _text('Spacing rhythm', 'إيقاع المسافات');
  String get spacingDescription => _text(
        'A small scale keeps layouts consistent.',
        'مقياس صغير يحافظ على اتساق التخطيط.',
      );

  String get themePreference => _text('Appearance', 'المظهر');
  String get themePreferenceDescription => _text(
        'Choose how the app looks. System follows your device setting.',
        'اختر مظهر التطبيق. يتبع خيار النظام إعدادات جهازك.',
      );
  String get system => _text('System', 'النظام');
  String get light => _text('Light', 'فاتح');
  String get dark => _text('Dark', 'داكن');
  String get language => _text('Language', 'اللغة');
  String get languageDescription => _text(
        'Choose the app language independently of your device.',
        'اختر لغة التطبيق بشكل مستقل عن لغة الجهاز.',
      );
  String get english => _text('English', 'الإنجليزية');
  String get arabic => _text('Arabic', 'العربية');
  String get preferenceSaveError => _text(
        'Your change could not be saved. Please try again.',
        'تعذر حفظ التغيير. يرجى المحاولة مرة أخرى.',
      );
  String get retry => _text('Retry', 'إعادة المحاولة');
  String get loadingPreferences => _text('Loading preferences…', 'جارٍ تحميل التفضيلات…');
}

class _AppStringsDelegate extends LocalizationsDelegate<AppStrings> {
  const _AppStringsDelegate();

  @override
  bool isSupported(Locale locale) =>
      const <String>{'en', 'ar'}.contains(locale.languageCode);

  @override
  Future<AppStrings> load(Locale locale) =>
      SynchronousFuture<AppStrings>(AppStrings(locale));

  @override
  bool shouldReload(_AppStringsDelegate old) => false;
}
