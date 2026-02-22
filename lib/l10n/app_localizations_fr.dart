// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'TilawaLock';

  @override
  String get tagline => 'La discipline commence par la récitation.';

  @override
  String get getStarted => 'Commencer';

  @override
  String get next => 'Suivant';

  @override
  String get skip => 'Passer';

  @override
  String get permissionsTitle => 'Autorisations Requises';

  @override
  String get permissionsSubtitle =>
      'TilawaLock a besoin de ces autorisations pour vous aider à rester discipliné.';

  @override
  String get microphone => 'Microphone';

  @override
  String get microphoneDesc =>
      'Requis pour la correspondance de la récitation du Coran.';

  @override
  String get usageStats => 'Statistiques d\'utilisation';

  @override
  String get usageStatsDesc =>
      'Utilisé pour surveiller et limiter les applications distrayantes.';

  @override
  String get notifications => 'Notifications';

  @override
  String get notificationsDesc =>
      'Pour envoyer des rappels et des alertes de session.';

  @override
  String get overlay => 'Superposition Système';

  @override
  String get overlayDesc =>
      'Requis pour afficher l\'écran de verrouillage sur d\'autres applications.';

  @override
  String get allow => 'Autoriser';

  @override
  String get continueText => 'Continuer';

  @override
  String get selectApps => 'Sélectionner les applications à verrouiller';

  @override
  String get searchApps => 'Rechercher des applications...';

  @override
  String get usageLimit => 'Limite d\'utilisation';

  @override
  String get dailyAllowedUsage => 'Utilisation quotidienne autorisée';

  @override
  String get usageLimitDesc =>
      'Combien de temps souhaitez-vous vous accorder pour les applications sélectionnées chaque jour ?';

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
      other: '$count heures',
      one: '1 heure',
    );
    return '$_temp0';
  }

  @override
  String get customMinutes => 'Minutes personnalisées...';

  @override
  String get recitationSetup => 'Configuration de la récitation';

  @override
  String get recitationRequirement => 'Exigence de récitation';

  @override
  String get difficultyLevel => 'Niveau de difficulté';

  @override
  String get finishSetup => 'Terminer la configuration';

  @override
  String get easy => 'Facile';

  @override
  String get easyDesc => 'Correspondance de mots uniquement';

  @override
  String get standard => 'Standard';

  @override
  String get standardDesc => 'Correspondance de prononciation';

  @override
  String get strict => 'Strict';

  @override
  String get strictDesc => 'Tajweed de haute précision';

  @override
  String get homeGreeting => 'As-salamu alaykum';

  @override
  String get dailyRecitation => 'Récitation Quotidienne';

  @override
  String get streak => 'Série';

  @override
  String get points => 'Points';

  @override
  String days(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Jours',
      one: '1 Jour',
    );
    return '$_temp0';
  }

  @override
  String get appsBlocked => 'Applications Bloquées';

  @override
  String get timeSaved => 'Temps Économisé';

  @override
  String get achievements => 'Succès';

  @override
  String get reciteNow => 'Réciter Maintenant';

  @override
  String get timeForTilawa => 'Il est temps de lire';

  @override
  String get lockMessage =>
      'Vous avez atteint votre limite. Récitez 5 versets pour continuer à utiliser cette application.';

  @override
  String get startRecitation => 'Commencer la récitation';

  @override
  String get closeAndDiscipline => 'Fermer et se discipliner';

  @override
  String verseCounter(Object current, Object total) {
    return 'Verset $current sur $total';
  }

  @override
  String get listening => 'Écoute en cours...';

  @override
  String get tapToRecite => 'Appuyer pour réciter';

  @override
  String get mashaAllah => 'Masha\'Allah !';

  @override
  String get successMessage =>
      'Récitation terminée avec succès. Session restaurée.';

  @override
  String get finish => 'Terminer';

  @override
  String get settings => 'Paramètres';

  @override
  String get language => 'Langue';

  @override
  String get arabic => 'Arabe';

  @override
  String get english => 'Anglais';

  @override
  String get french => 'Français';

  @override
  String get ramadanMode => 'Mode Ramadan';

  @override
  String get ramadanModeDesc =>
      'Limites plus strictes et récompenses plus élevées pendant le mois sacré.';

  @override
  String get strictRecitation => 'Récitation Stricte';
}
