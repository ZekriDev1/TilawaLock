import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/services/local_database_manager.dart';
import 'dart:io';

class LocaleNotifier extends StateNotifier<Locale?> {
  LocaleNotifier() : super(null) {
    _loadLocale();
  }

  void _loadLocale() {
    final savedLanguage = LocalDatabaseManager.getLanguage();
    if (savedLanguage != null) {
      state = Locale(savedLanguage);
    } else {
      // Auto detect device language on first launch
      String deviceLocale = Platform.localeName.split('_')[0];
      if (['en', 'ar', 'fr'].contains(deviceLocale)) {
        setLocale(deviceLocale);
      } else {
        setLocale('en'); // Fallback
      }
    }
  }

  Future<void> setLocale(String languageCode) async {
    state = Locale(languageCode);
    await LocalDatabaseManager.saveLanguage(languageCode);
  }
}

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale?>((ref) {
  return LocaleNotifier();
});
