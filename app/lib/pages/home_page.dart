import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:app/design/tokens.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title:
          const Text('올페이 메인', style: TextStyle(fontWeight: FontWeight.w700)),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none, color: Colors.black),
        ),
      ],
    );

    final banner = Container(
      height: 86,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          colors: [Color(0xFF3A8AFD), Color(0xFF61B6FF)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Expanded(
            child: Text(
              '월세 카드결제\n최저 수수료 혜택 받기 >',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
              maxLines: 2,
            ),
          ),
          Icon(Icons.credit_card, color: Colors.white, size: 28),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 260.ms)
        .moveY(begin: 8, end: 0, duration: 260.ms);

    final bottomNav = NavigationBar(
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: '메인'),
        NavigationDestination(icon: Icon(Icons.credit_card), label: '올페이'),
        NavigationDestination(icon: Icon(Icons.person), label: '마이'),
        NavigationDestination(icon: Icon(Icons.settings), label: '설정'),
      ],
      selectedIndex: _currentIndex,
      onDestinationSelected: (idx) {
        setState(() => _currentIndex = idx);
        if (idx == 0) context.go('/');
        if (idx == 1) context.go('/pay');
        if (idx == 2) context.go('/my');
        if (idx == 3) context.go('/settings');
      },
    );

    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: ListView(
          padding: AppSpace.page,
          children: [
            banner,
            AppSpace.sectionGap,
            const Text('올페이 주요 기능', style: AppText.h2),
            AppSpace.listGap,
            _FeatureCard(icon: Icons.home, title: '월세 카드결제', desc: '수수료 절감 혜택'),
            _FeatureCard(
                icon: Icons.insert_drive_file,
                title: '계약서 관리',
                desc: '계약서 업로드 및 검수'),
            _FeatureCard(
                icon: Icons.bar_chart, title: '결제 내역 리포트', desc: '월별 매출 리포트'),
          ],
        ),
      ),
      bottomNavigationBar: bottomNav,
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;
  const _FeatureCard(
      {required this.icon, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppRadius.card),
        boxShadow: [appShadow()],
      ),
      child: Row(
        children: [
          Icon(icon, size: 32, color: AppColors.seedBlue),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppText.h2),
              Text(desc, style: AppText.sub),
            ],
          ),
        ],
      ),
    );
  }
}
