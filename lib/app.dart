import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'design/tokens.dart';
import 'pages/home_page.dart';
import 'pages/activity_page.dart';
import 'pages/settings_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(path: '/', builder: (_, __) => const HomePage()),
        GoRoute(path: '/activity', builder: (_, __) => const ActivityPage()),
        GoRoute(path: '/settings', builder: (_, __) => const SettingsPage()),
      ],
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Pretendard',
        colorSchemeSeed: AppColors.seedBlue,
        scaffoldBackgroundColor: AppColors.bg,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(fontWeight: FontWeight.w700),
          titleMedium: TextStyle(fontWeight: FontWeight.w600),
          bodyMedium: TextStyle(height: 1.35),
        ),
      ),
    );
  }
}
