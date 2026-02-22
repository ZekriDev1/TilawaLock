// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'TilawaLock';

  @override
  String get tagline => 'Discipline begins with recitation.';

  @override
  String get getStarted => 'Get Started';

  @override
  String get next => 'Next';

  @override
  String get skip => 'Skip';

  @override
  String get permissionsTitle => 'Required Permissions';

  @override
  String get permissionsSubtitle =>
      'TilawaLock needs these permissions to help you stay disciplined.';

  @override
  String get microphone => 'Microphone';

  @override
  String get microphoneDesc => 'Required for Quran recitation matching.';

  @override
  String get usageStats => 'Usage Statistics';

  @override
  String get usageStatsDesc => 'Used to monitor and limit distracting apps.';

  @override
  String get notifications => 'Notifications';

  @override
  String get notificationsDesc => 'To send reminders and session alerts.';

  @override
  String get overlay => 'System Overlay';

  @override
  String get overlayDesc => 'Required to show the lock screen over other apps.';

  @override
  String get allow => 'Allow';

  @override
  String get continueText => 'Continue';

  @override
  String get selectApps => 'Select Apps to Lock';

  @override
  String get searchApps => 'Search apps...';

  @override
  String get usageLimit => 'Usage Limit';

  @override
  String get dailyAllowedUsage => 'Daily Allowed Usage';

  @override
  String get usageLimitDesc =>
      'How much time would you like to allow yourself for selected apps each day?';

  @override
  String minutes(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutes',
      one: '1 minute',
    );
    return '$_temp0';
  }

  @override
  String hours(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hours',
      one: '1 hour',
    );
    return '$_temp0';
  }

  @override
  String get customMinutes => 'Custom minutes...';

  @override
  String get recitationSetup => 'Recitation Setup';

  @override
  String get recitationRequirement => 'Recitation Requirement';

  @override
  String get difficultyLevel => 'Difficulty Level';

  @override
  String get finishSetup => 'Finish Setup';

  @override
  String get easy => 'Easy';

  @override
  String get easyDesc => 'Word matching only';

  @override
  String get standard => 'Standard';

  @override
  String get standardDesc => 'Pronunciation match';

  @override
  String get strict => 'Strict';

  @override
  String get strictDesc => 'High accuracy tajweed';

  @override
  String get homeGreeting => 'As-salamu alaykum';

  @override
  String get dailyRecitation => 'Daily Recitation';

  @override
  String get streak => 'Streak';

  @override
  String get points => 'Points';

  @override
  String days(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Days',
      one: '1 Day',
    );
    return '$_temp0';
  }

  @override
  String get appsBlocked => 'Apps Blocked';

  @override
  String get timeSaved => 'Time Saved';

  @override
  String get achievements => 'Achievements';

  @override
  String get reciteNow => 'Recite Now';

  @override
  String get timeForTilawa => 'Time for Tilawa';

  @override
  String get lockMessage =>
      'You\'ve reached your limit. Recite 5 ayat to continue using this app.';

  @override
  String get startRecitation => 'Start Recitation';

  @override
  String get closeAndDiscipline => 'Close & Discipline';

  @override
  String verseCounter(Object current, Object total) {
    return 'Verse $current of $total';
  }

  @override
  String get listening => 'Listening...';

  @override
  String get tapToRecite => 'Tap to Recite';

  @override
  String get mashaAllah => 'Masha\'Allah!';

  @override
  String get successMessage =>
      'Recitation completed successfully. Session restored.';

  @override
  String get finish => 'Finish';

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get arabic => 'Arabic';

  @override
  String get english => 'English';

  @override
  String get french => 'French';

  @override
  String get ramadanMode => 'Ramadan Mode';

  @override
  String get ramadanModeDesc =>
      'Stricter limits and higher rewards during the holy month.';

  @override
  String get strictRecitation => 'Strict Recitation';
}
