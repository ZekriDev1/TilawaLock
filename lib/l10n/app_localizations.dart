import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('fr'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'TilawaLock'**
  String get appTitle;

  /// No description provided for @tagline.
  ///
  /// In en, this message translates to:
  /// **'Discipline begins with recitation.'**
  String get tagline;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @permissionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Required Permissions'**
  String get permissionsTitle;

  /// No description provided for @permissionsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'TilawaLock needs these permissions to help you stay disciplined.'**
  String get permissionsSubtitle;

  /// No description provided for @microphone.
  ///
  /// In en, this message translates to:
  /// **'Microphone'**
  String get microphone;

  /// No description provided for @microphoneDesc.
  ///
  /// In en, this message translates to:
  /// **'Required for Quran recitation matching.'**
  String get microphoneDesc;

  /// No description provided for @usageStats.
  ///
  /// In en, this message translates to:
  /// **'Usage Statistics'**
  String get usageStats;

  /// No description provided for @usageStatsDesc.
  ///
  /// In en, this message translates to:
  /// **'Used to monitor and limit distracting apps.'**
  String get usageStatsDesc;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @notificationsDesc.
  ///
  /// In en, this message translates to:
  /// **'To send reminders and session alerts.'**
  String get notificationsDesc;

  /// No description provided for @overlay.
  ///
  /// In en, this message translates to:
  /// **'System Overlay'**
  String get overlay;

  /// No description provided for @overlayDesc.
  ///
  /// In en, this message translates to:
  /// **'Required to show the lock screen over other apps.'**
  String get overlayDesc;

  /// No description provided for @allow.
  ///
  /// In en, this message translates to:
  /// **'Allow'**
  String get allow;

  /// No description provided for @continueText.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueText;

  /// No description provided for @selectApps.
  ///
  /// In en, this message translates to:
  /// **'Select Apps to Lock'**
  String get selectApps;

  /// No description provided for @searchApps.
  ///
  /// In en, this message translates to:
  /// **'Search apps...'**
  String get searchApps;

  /// No description provided for @usageLimit.
  ///
  /// In en, this message translates to:
  /// **'Usage Limit'**
  String get usageLimit;

  /// No description provided for @dailyAllowedUsage.
  ///
  /// In en, this message translates to:
  /// **'Daily Allowed Usage'**
  String get dailyAllowedUsage;

  /// No description provided for @usageLimitDesc.
  ///
  /// In en, this message translates to:
  /// **'How much time would you like to allow yourself for selected apps each day?'**
  String get usageLimitDesc;

  /// No description provided for @minutes.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 minute} other{{count} minutes}}'**
  String minutes(num count);

  /// No description provided for @hours.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 hour} other{{count} hours}}'**
  String hours(num count);

  /// No description provided for @customMinutes.
  ///
  /// In en, this message translates to:
  /// **'Custom minutes...'**
  String get customMinutes;

  /// No description provided for @recitationSetup.
  ///
  /// In en, this message translates to:
  /// **'Recitation Setup'**
  String get recitationSetup;

  /// No description provided for @recitationRequirement.
  ///
  /// In en, this message translates to:
  /// **'Recitation Requirement'**
  String get recitationRequirement;

  /// No description provided for @difficultyLevel.
  ///
  /// In en, this message translates to:
  /// **'Difficulty Level'**
  String get difficultyLevel;

  /// No description provided for @finishSetup.
  ///
  /// In en, this message translates to:
  /// **'Finish Setup'**
  String get finishSetup;

  /// No description provided for @easy.
  ///
  /// In en, this message translates to:
  /// **'Easy'**
  String get easy;

  /// No description provided for @easyDesc.
  ///
  /// In en, this message translates to:
  /// **'Word matching only'**
  String get easyDesc;

  /// No description provided for @standard.
  ///
  /// In en, this message translates to:
  /// **'Standard'**
  String get standard;

  /// No description provided for @standardDesc.
  ///
  /// In en, this message translates to:
  /// **'Pronunciation match'**
  String get standardDesc;

  /// No description provided for @strict.
  ///
  /// In en, this message translates to:
  /// **'Strict'**
  String get strict;

  /// No description provided for @strictDesc.
  ///
  /// In en, this message translates to:
  /// **'High accuracy tajweed'**
  String get strictDesc;

  /// No description provided for @homeGreeting.
  ///
  /// In en, this message translates to:
  /// **'As-salamu alaykum'**
  String get homeGreeting;

  /// No description provided for @dailyRecitation.
  ///
  /// In en, this message translates to:
  /// **'Daily Recitation'**
  String get dailyRecitation;

  /// No description provided for @streak.
  ///
  /// In en, this message translates to:
  /// **'Streak'**
  String get streak;

  /// No description provided for @points.
  ///
  /// In en, this message translates to:
  /// **'Points'**
  String get points;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 Day} other{{count} Days}}'**
  String days(num count);

  /// No description provided for @appsBlocked.
  ///
  /// In en, this message translates to:
  /// **'Apps Blocked'**
  String get appsBlocked;

  /// No description provided for @timeSaved.
  ///
  /// In en, this message translates to:
  /// **'Time Saved'**
  String get timeSaved;

  /// No description provided for @achievements.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get achievements;

  /// No description provided for @reciteNow.
  ///
  /// In en, this message translates to:
  /// **'Recite Now'**
  String get reciteNow;

  /// No description provided for @timeForTilawa.
  ///
  /// In en, this message translates to:
  /// **'Time for Tilawa'**
  String get timeForTilawa;

  /// No description provided for @lockMessage.
  ///
  /// In en, this message translates to:
  /// **'You\'ve reached your limit. Recite 5 ayat to continue using this app.'**
  String get lockMessage;

  /// No description provided for @startRecitation.
  ///
  /// In en, this message translates to:
  /// **'Start Recitation'**
  String get startRecitation;

  /// No description provided for @closeAndDiscipline.
  ///
  /// In en, this message translates to:
  /// **'Close & Discipline'**
  String get closeAndDiscipline;

  /// No description provided for @verseCounter.
  ///
  /// In en, this message translates to:
  /// **'Verse {current} of {total}'**
  String verseCounter(Object current, Object total);

  /// No description provided for @listening.
  ///
  /// In en, this message translates to:
  /// **'Listening...'**
  String get listening;

  /// No description provided for @tapToRecite.
  ///
  /// In en, this message translates to:
  /// **'Tap to Recite'**
  String get tapToRecite;

  /// No description provided for @mashaAllah.
  ///
  /// In en, this message translates to:
  /// **'Masha\'Allah!'**
  String get mashaAllah;

  /// No description provided for @successMessage.
  ///
  /// In en, this message translates to:
  /// **'Recitation completed successfully. Session restored.'**
  String get successMessage;

  /// No description provided for @finish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finish;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @french.
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get french;

  /// No description provided for @ramadanMode.
  ///
  /// In en, this message translates to:
  /// **'Ramadan Mode'**
  String get ramadanMode;

  /// No description provided for @ramadanModeDesc.
  ///
  /// In en, this message translates to:
  /// **'Stricter limits and higher rewards during the holy month.'**
  String get ramadanModeDesc;

  /// No description provided for @strictRecitation.
  ///
  /// In en, this message translates to:
  /// **'Strict Recitation'**
  String get strictRecitation;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
