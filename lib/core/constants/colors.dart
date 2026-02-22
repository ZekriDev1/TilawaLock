import 'package:flutter/material.dart';

class AppColors {
  static const Color emerald = Color(0xFF0F3D3E);
  static const Color gold = Color(0xFFD4AF37);
  static const Color background = Color(0xFFF8F9FA);
  static const Color surface = Colors.white;
  static const Color error = Color(0xFFB00020);
  
  static const Color emeraldDark = Color(0xFF0A2A2A);
  static const Color goldLight = Color(0xFFFFE082);
  
  static const LinearGradient ramadanGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [emerald, emeraldDark],
  );

  static const LinearGradient goldGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [goldLight, gold],
  );
}
