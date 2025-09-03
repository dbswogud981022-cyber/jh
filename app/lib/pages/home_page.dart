// 하단바를 메인/OO페이/마이/설정으로 교체
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../design/tokens.dart';
import '../services/mock_data.dart';

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
      title: const Text('메인', style: TextStyle(fontWeight: FontWeight.w700)),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none, color: Colors.black)),
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
            child: Text('최저 수수료 혜택 받기 >',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
                maxLines: 2),
          ),
          Icon(Icons.card_giftcard, color: Colors.white, size: 28),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 260.ms)
        .moveY(begin: 8, end: 0, duration: 260.ms);

    final benefits = SizedBox(
      height: 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, i) {
          final list = MockData.benefits();
          final b = list[i % list.length];
          return Container(
            width: 220,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.08),
                    blurRadius: 20,
                    spreadRadius: -10)
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(b.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 16)),
                const SizedBox(height: 6),
                Text(b.subtitle, style: const TextStyle(color: Colors.black54)),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(b.vendor,
                        style: const TextStyle(color: Colors.black54)),
                    const Icon(Icons.download_outlined),
                  ],
                ),
              ],
            ),
          )
              .animate()
              .fadeIn(duration: 200.ms)
              .moveY(begin: 6, end: 0, duration: 200.ms);
        },
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemCount: 6,
      ),
    );

    final bottomNav = NavigationBar(
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: '메인'),
        NavigationDestination(icon: Icon(Icons.credit_card), label: 'OO페이'),
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
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          children: [
            banner,
            const SizedBox(height: 16),
            const Text('생활 혜택',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 12),
            benefits,
          ],
        ),
      ),
      bottomNavigationBar: bottomNav,
    );
  }
}
