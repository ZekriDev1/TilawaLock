// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'تلاوة لوك';

  @override
  String get tagline => 'الانضباط يبدأ بالتلاوة.';

  @override
  String get getStarted => 'ابدأ الآن';

  @override
  String get next => 'التالي';

  @override
  String get skip => 'تخطي';

  @override
  String get permissionsTitle => 'الأذونات المطلوبة';

  @override
  String get permissionsSubtitle =>
      'يحتاج تطبيق تلاوة لوك إلى هذه الأذونات لمساعدتك على الانضباط.';

  @override
  String get microphone => 'الميكروفون';

  @override
  String get microphoneDesc => 'مطلوب لمطابقة تلاوة القرآن.';

  @override
  String get usageStats => 'إحصائيات الاستخدام';

  @override
  String get usageStatsDesc => 'يستخدم لمراقبة وتقييد التطبيقات المشتتة.';

  @override
  String get notifications => 'الإشعارات';

  @override
  String get notificationsDesc => 'لإرسال التذكيرات وتنبيهات الجلسة.';

  @override
  String get overlay => 'ظهور فوق التطبيقات';

  @override
  String get overlayDesc => 'مطلوب لإظهار شاشة القفل فوق التطبيقات الأخرى.';

  @override
  String get allow => 'سماح';

  @override
  String get continueText => 'متابعة';

  @override
  String get selectApps => 'اختر التطبيقات للقفل';

  @override
  String get searchApps => 'ابحث عن التطبيقات...';

  @override
  String get usageLimit => 'حد الاستخدام';

  @override
  String get dailyAllowedUsage => 'الاستخدام اليومي المسموح به';

  @override
  String get usageLimitDesc =>
      'كم من الوقت تود السماح لنفسك باستخدام التطبيقات المختارة يومياً؟';

  @override
  String minutes(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count دقائق',
      two: 'دقيقتان',
      one: 'دقيقة واحدة',
    );
    return '$_temp0';
  }

  @override
  String hours(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ساعات',
      two: 'ساعتان',
      one: 'ساعة واحدة',
    );
    return '$_temp0';
  }

  @override
  String get customMinutes => 'دقائق مخصصة...';

  @override
  String get recitationSetup => 'إعداد التلاوة';

  @override
  String get recitationRequirement => 'متطلبات التلاوة';

  @override
  String get difficultyLevel => 'مستوى الصعوبة';

  @override
  String get finishSetup => 'إنهاء الإعداد';

  @override
  String get easy => 'سهل';

  @override
  String get easyDesc => 'مطابقة الكلمات فقط';

  @override
  String get standard => 'قياسي';

  @override
  String get standardDesc => 'مطابقة النطق';

  @override
  String get strict => 'صعب';

  @override
  String get strictDesc => 'تجويد بدقة عالية';

  @override
  String get homeGreeting => 'السلام عليكم';

  @override
  String get dailyRecitation => 'التلاوة اليومية';

  @override
  String get streak => 'التتابُع';

  @override
  String get points => 'النقاط';

  @override
  String days(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count أيام',
      two: 'يومان',
      one: 'يوم واحد',
    );
    return '$_temp0';
  }

  @override
  String get appsBlocked => 'تطبيقات محجوبة';

  @override
  String get timeSaved => 'الوقت الموفر';

  @override
  String get achievements => 'الإنجازات';

  @override
  String get reciteNow => 'اتلُ الآن';

  @override
  String get timeForTilawa => 'وقت التلاوة';

  @override
  String get lockMessage =>
      'لقد وصلت إلى الحد المسموح به. اتلُ 5 آيات لمتابعة استخدام هذا التطبيق.';

  @override
  String get startRecitation => 'ابدأ التلاوة';

  @override
  String get closeAndDiscipline => 'أغلق وانضبط';

  @override
  String verseCounter(Object current, Object total) {
    return 'الآية $current من $total';
  }

  @override
  String get listening => 'جاري الاستماع...';

  @override
  String get tapToRecite => 'اضغط للتلاوة';

  @override
  String get mashaAllah => 'ما شاء الله!';

  @override
  String get successMessage => 'تمت التلاوة بنجاح. تم استعادة الجلسة.';

  @override
  String get finish => 'إنهاء';

  @override
  String get settings => 'الإعدادات';

  @override
  String get language => 'اللغة';

  @override
  String get arabic => 'العربية';

  @override
  String get english => 'الإنجليزية';

  @override
  String get french => 'الفرنسية';

  @override
  String get ramadanMode => 'وضع رمضان';

  @override
  String get ramadanModeDesc =>
      'قيود أكثر صرامة ومكافآت أعلى خلال الشهر الفضيل.';

  @override
  String get strictRecitation => 'تلاوة دقيقة';
}
