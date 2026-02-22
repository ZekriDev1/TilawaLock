import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../core/constants/colors.dart';
import 'recitation_setup_screen.dart';

class UsageLimitSetupScreen extends StatefulWidget {
  const UsageLimitSetupScreen({super.key});

  @override
  State<UsageLimitSetupScreen> createState() => _UsageLimitSetupScreenState();
}

class _UsageLimitSetupScreenState extends State<UsageLimitSetupScreen> {
  int _selectedMinutes = 60;
  final TextEditingController _customController = TextEditingController();

  final List<int> _presetOptions = [30, 60, 120];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: Text(l10n.usageLimit)),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.dailyAllowedUsage,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.emerald),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.usageLimitDesc,
              style: TextStyle(color: AppColors.emerald.withOpacity(0.7)),
            ),
            const SizedBox(height: 40),
            
            Expanded(
              child: ListView(
                children: [
                  ..._presetOptions.map((mins) => _buildOptionTile(mins, l10n)),
                  _buildCustomOptionTile(l10n),
                ],
              ),
            ),
            
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const RecitationSetupScreen())
                  );
                },
                child: Text(l10n.next),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionTile(int minutes, AppLocalizations l10n) {
    bool isSelected = _selectedMinutes == minutes;
    String label = minutes < 60 ? l10n.minutes(minutes) : l10n.hours(minutes ~/ 60);
    
    return GestureDetector(
      onTap: () => setState(() => _selectedMinutes = minutes),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.emerald : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isSelected ? AppColors.gold : Colors.transparent, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
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

  Widget _buildCustomOptionTile(AppLocalizations l10n) {
    bool isCustom = !_presetOptions.contains(_selectedMinutes);
    
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isCustom ? AppColors.emerald : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isCustom ? AppColors.gold : Colors.transparent, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _customController,
              keyboardType: TextInputType.number,
              style: TextStyle(
                color: isCustom ? Colors.white : AppColors.emerald,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                hintText: l10n.customMinutes,
                hintStyle: TextStyle(color: (isCustom ? Colors.white : AppColors.emerald).withOpacity(0.5)),
                border: InputBorder.none,
              ),
              onChanged: (val) {
                if (val.isNotEmpty) {
                  setState(() => _selectedMinutes = int.parse(val));
                }
              },
            ),
          ),
          if (isCustom) const Icon(Icons.check_circle, color: AppColors.gold),
        ],
      ),
    );
  }
}
