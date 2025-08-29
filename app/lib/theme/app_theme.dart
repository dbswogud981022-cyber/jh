// app_theme.dart — 앱 공통 테마(뜻: 색/모서리/글자 스타일)
import 'package:flutter/material.dart';

final Color _primaryBlue = const Color(0xFF246BFD); // (뜻: 포인트 블루)
final Color _bg = const Color(0xFFF6F7FB);          // (뜻: 밝은 배경)

ThemeData buildAppTheme() {
  final scheme = ColorScheme.fromSeed(
    seedColor: _primaryBlue,     // (뜻: 시드 컬러로 파생 팔레트 생성)
    brightness: Brightness.light,
  );

  return ThemeData(
    colorScheme: scheme,
    scaffoldBackgroundColor: _bg, // (뜻: 기본 화면 배경)
    useMaterial3: true,           // (뜻: 최신 머티리얼)
    appBarTheme: AppBarTheme(
      backgroundColor: _bg,
      elevation: 0,
      foregroundColor: scheme.onSurface,
    ),
    cardTheme: const CardTheme(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)), // (뜻: 부드러운 모서리)
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );
}
