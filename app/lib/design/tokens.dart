import 'package:flutter/material.dart';

class AppColors {
  static const seedBlue = Color(0xFF0064FF);
  static const bg = Color(0xFFF7F7FA);
  static const card = Colors.white;
  static Color shadow = Colors.black.withOpacity(.08);
}

BoxShadow appShadow() =>
    BoxShadow(color: AppColors.shadow, blurRadius: 20, spreadRadius: -10);
