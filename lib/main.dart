import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'core/theme/app_theme.dart';
import 'core/services/local_database_manager.dart';
import 'presentation/providers/locale_provider.dart';
import 'presentation/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Local Database
  await LocalDatabaseManager.init();
  
  runApp(
    const ProviderScope(
      child: TilawaLockApp(),
    ),
  );
}

class TilawaLockApp extends ConsumerWidget {
  const TilawaLockApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    
    return MaterialApp(
      title: 'TilawaLock',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getTheme(locale),
      locale: locale,

      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
        Locale('fr'),
      ],
      home: const SplashScreen(),
    );
  }
}
