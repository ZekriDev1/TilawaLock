import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../core/constants/colors.dart';
import '../providers/locale_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final currentLocale = ref.watch(localeProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(l10n.settings),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _buildSectionHeader(l10n.language),
          const SizedBox(height: 16),
          _buildLanguageTile(
            context,
            ref,
            l10n.english,
            'en',
            currentLocale?.languageCode == 'en',
          ),
          _buildLanguageTile(
            context,
            ref,
            l10n.arabic,
            'ar',
            currentLocale?.languageCode == 'ar',
          ),
          _buildLanguageTile(
            context,
            ref,
            l10n.french,
            'fr',
            currentLocale?.languageCode == 'fr',
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.emerald,
      ),
    );
  }

  Widget _buildLanguageTile(
    BuildContext context,
    WidgetRef ref,
    String label,
    String code,
    bool isSelected,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? AppColors.gold : Colors.grey.shade200,
          width: 2,
        ),
      ),
      child: RadioListTile<String>(
        value: code,
        groupValue: isSelected ? code : null,
        onChanged: (value) {
          if (value != null) {
            ref.read(localeProvider.notifier).setLocale(value);
          }
        },
        title: Text(
          label,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: AppColors.emerald,
          ),
        ),
        activeColor: AppColors.gold,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
