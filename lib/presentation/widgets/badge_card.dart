import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';

class BadgeCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final bool isUnlocked;
  final Color? color;

  const BadgeCard({
    super.key,
    required this.name,
    required this.icon,
    required this.isUnlocked,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isUnlocked ? AppColors.gold.withOpacity(0.1) : Colors.grey.shade100,
              shape: BoxShape.circle,
              border: Border.all(
                color: isUnlocked ? AppColors.gold : Colors.grey.shade300,
                width: 2,
              ),
            ),
            child: Icon(
              icon,
              color: isUnlocked ? AppColors.gold : Colors.grey.shade400,
              size: 30,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: isUnlocked ? AppColors.emerald : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
