import 'package:flutter/material.dart';

class AppColors {
  static const seedBlue = Color(0xFF0064FF);
  static const bg = Color(0xFFF7F7FA);
  static const card = Colors.white;
  static Color shadow = Colors.black.withOpacity(.08);
  static const textPrimary = Colors.black;
  static const textSecondary = Colors.black54;
  static const danger = Color(0xFFD32F2F);
  static const success = Color(0xFF2E7D32);
}

class AppRadius {
  static const card = 20.0;
  static const chip = 999.0;
  static const button = 16.0;
  static const sheetTop = 24.0;
}

class AppSpace {
  static const page = EdgeInsets.fromLTRB(16, 12, 16, 24);
  static const cardPad = EdgeInsets.all(20);
  static const listGap = SizedBox(height: 16);
  static const sectionGap = SizedBox(height: 24);
}

class AppText {
  static const h1 = TextStyle(fontSize: 22, fontWeight: FontWeight.w700);
  static const h2 = TextStyle(fontSize: 18, fontWeight: FontWeight.w700);
  static const body = TextStyle(height: 1.35);
  static const sub = TextStyle(fontSize: 14, color: Colors.black54);
}

BoxShadow appShadow() =>
    BoxShadow(color: AppColors.shadow, blurRadius: 20, spreadRadius: -10);
