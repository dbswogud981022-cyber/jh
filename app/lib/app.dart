import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'design/tokens.dart';
import 'pages/home_page.dart';
import 'pages/activity_page.dart';
import 'pages/settings_page.dart';
import 'pages/pay_page.dart';
import 'pages/my_page.dart';
import 'pages/login_page.dart';
import 'admin/admin_home_page.dart';
import 'services/auth_service.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(path: '/', builder: (_, __) => const HomePage()),
        GoRoute(path: '/activity', builder: (_, __) => const ActivityPage()),
        GoRoute(path: '/settings', builder: (_, __) => const SettingsPage()),
        GoRoute(path: '/pay', builder: (_, __) => const PayPage()),
        GoRoute(path: '/my', builder: (_, __) => const MyPage()),
        GoRoute(path: '/login', builder: (_, __) => const LoginPage()),
        GoRoute(path: '/admin', builder: (_, __) => const AdminHomePage()),
      ],
      redirect: (context, state) {
        final u = AuthService.I.current;
        final needAuth = {'/pay', '/my', '/admin'}.contains(state.fullPath);
        if (needAuth && u == null) return '/login';
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
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
