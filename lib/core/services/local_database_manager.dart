import 'package:hive_flutter/hive_flutter.dart';

class LocalDatabaseManager {
  static const String settingsBoxName = 'settings';
  static const String statsBoxName = 'stats';
  static const String appsBoxName = 'locked_apps';

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(settingsBoxName);
    await Hive.openBox(statsBoxName);
    await Hive.openBox(appsBoxName);
  }

  static Box get settingsBox => Hive.box(settingsBoxName);
  static Box get statsBox => Hive.box(statsBoxName);
  static Box get appsBox => Hive.box(appsBoxName);

  static Future<void> saveUsageLimit(int minutes) async {
    await settingsBox.put('usage_limit', minutes);
  }

  static int getUsageLimit() {
    return settingsBox.get('usage_limit', defaultValue: 60);
  }

  static Future<void> setLockedApps(List<String> packageNames) async {
    await appsBox.put('list', packageNames);
  }

  static List<String> getLockedApps() {
    return List<String>.from(appsBox.get('list', defaultValue: []));
  }

  static Future<void> updateStreak(int days) async {
    await statsBox.put('streak', days);
  }

  static int getStreak() {
    return statsBox.get('streak', defaultValue: 0);
  }

  // Language helpers
  static Future<void> saveLanguage(String languageCode) async {
    await settingsBox.put('language_code', languageCode);
  }

  static String? getLanguage() {
    return settingsBox.get('language_code');
  }
}

