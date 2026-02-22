import 'package:flutter/material.dart';
import 'package:tilawalock/l10n/app_localizations.dart';
import '../../core/constants/colors.dart';
import 'home_dashboard_screen.dart';

class RecitationSetupScreen extends StatefulWidget {
  const RecitationSetupScreen({super.key});

  @override
  State<RecitationSetupScreen> createState() => _RecitationSetupScreenState();
}

class _RecitationSetupScreenState extends State<RecitationSetupScreen> {
  String _selectedAmount = "5 Ayat";
  String _selectedDifficulty = "Standard";

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    final List<String> amounts = ["5 Ayat", "Half Page", "Full Page"];
    final List<Map<String, String>> difficulties = [
      {"title": l10n.easy, "desc": l10n.easyDesc},
      {"title": l10n.standard, "desc": l10n.standardDesc},
      {"title": l10n.strict, "desc": l10n.strictDesc},
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: Text(l10n.recitationSetup)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.recitationRequirement,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.emerald),
            ),
            const SizedBox(height: 20),
            ...amounts.map((amount) => _buildAmountTile(amount)),
            
            const SizedBox(height: 40),
            Text(
              l10n.difficultyLevel,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.emerald),
            ),
            const SizedBox(height: 20),
            ...difficulties.map((diff) => _buildDifficultyTile(diff)),
            
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const HomeDashboardScreen()),
                    (route) => false,
                  );
                },
                child: Text(l10n.finishSetup),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountTile(String amount) {
    bool isSelected = _selectedAmount == amount;
    return GestureDetector(
      onTap: () => setState(() => _selectedAmount = amount),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.emerald : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? AppColors.gold : Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              amount,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : AppColors.emerald,
              ),
            ),
            if (isSelected) const Icon(Icons.check_circle, color: AppColors.gold),
          ],
        ),
      ),
    );
  }

  Widget _buildDifficultyTile(Map<String, String> diff) {
    bool isSelected = _selectedDifficulty == diff["title"];
    return GestureDetector(
      onTap: () => setState(() => _selectedDifficulty = diff["title"]!),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.emerald : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? AppColors.gold : Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    diff["title"]!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : AppColors.emerald,
                    ),
                  ),
                  Text(
                    diff["desc"]!,
                    style: TextStyle(
                      fontSize: 12,
                      color: (isSelected ? Colors.white : AppColors.emerald).withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected) const Icon(Icons.check_circle, color: AppColors.gold),
          ],
        ),
      ),
    );
  }
}
