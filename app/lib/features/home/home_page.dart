
// home_page.dart — 토스 느낌의 메인 레이아웃(뜻: 미니멀/카드/빠른작업/최근내역)
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../theme/app_theme.dart';                 // (뜻: 색/공통 스타일)
import 'widgets/balance_card.dart';
import 'widgets/quick_actions.dart';
import 'widgets/recent_item.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _tabIndex = 0; // (뜻: 하단 네비 탭 인덱스)

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Theme( // (뜻: 하위 위젯에 공통 테마 적용)
      data: buildAppTheme(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('안녕하세요 👋', style: TextStyle(color: cs.onSurfaceVariant, fontSize: 12)),
              const SizedBox(height: 2),
              Text('홍길동 님', style: const TextStyle(fontWeight: FontWeight.w700)),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {}, // (뜻: 알림센터 예정)
              icon: const Icon(Icons.notifications_none),
            ),
            const SizedBox(width: 4),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 잔액 카드
                const BalanceCard(
                  balance: 250000,                             // (뜻: 목업 잔액)
                  nextDue: DateTime(2025, 9, 1),
                  nextAmount: 1000000,
                ),
                const SizedBox(height: 16),
                // 빠른 작업
                QuickActions(
                  onPayRent: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('월세 결제(모의): 다음 단계에서 API 연결')),
                    );
                  },
                  onAddCard: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('카드 연결(모의): PG 선택 후 어댑터 교체')),
                    );
                  },
                  onUploadProof: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('증빙 업로드(모의): S3 Presigned URL 예정')),
                    );
                  },
                ),
                const SizedBox(height: 20),

                // 최근 내역 헤더
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('최근 내역', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: cs.onSurface)),
                    TextButton(onPressed: () {}, child: const Text('전체 보기')),
                  ],
                ),
                const SizedBox(height: 4),

                // 최근 내역 리스트 (목업)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: Column(
                      children: const [
                        RecentItem(title: '2025-08 월세', subtitle: '결제 성공', amount: 1000000, positive: false),
                        Divider(height: 8),
                        RecentItem(title: '카드 등록', subtitle: '빌링키 발급', amount: 0, positive: true),
                        Divider(height: 8),
                        RecentItem(title: '2025-07 월세', subtitle: '결제 성공', amount: 1000000, positive: false),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // 하단 네비게이션(뜻: 홈/지갑/내 정보)
        bottomNavigationBar: NavigationBar(
          selectedIndex: _tabIndex,
          onDestinationSelected: (i) => setState(() => _tabIndex = i),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: '홈'),
            NavigationDestination(icon: Icon(Icons.account_balance_wallet_outlined), selectedIcon: Icon(Icons.account_balance_wallet), label: '지갑'),
            NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: '내 정보'),
          ],
        ),
      ),
    );
  }
}

/*
// home_page.dart — 첫 화면(UI 테스트용)
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../state/providers.dart';
import '../../services/payments/payment_gateway.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gateway = ref.watch(paymentGatewayProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('월세 카드결제 — MVP')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('It works 🚀', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () async {
                // (뜻: 보통 외부 브라우저/웹뷰로 이동 → 완료 후 confirm)
                final url = await gateway.startAddCardSession(userId: 'demo-user');
                // 지금은 바로 confirm 호출(모의)
                final method = await gateway.confirmAddCard(sessionId: 'mock-session');
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('카드 연결됨: ${method.display}\n세션 URL: $url')),
                );
              },
              child: const Text('카드 연결(모의)'),
            ),
            const SizedBox(height: 8),
            FilledButton.tonal(
              onPressed: () async {
                final result = await gateway.payInvoice(
                  invoiceId: 'inv-2025-08',
                  methodToken: 'tok_mock_4242',
                  amount: 100000,                         // (뜻: 금액, 원 단위)
                  idempotencyKey: DateTime.now().millisecondsSinceEpoch.toString(),
                );
                if (!context.mounted) return;
                final msg = switch (result.status) {
                  PaymentStatus.succeeded => '결제 성공! 영수증: ${result.receiptUrl}',
                  PaymentStatus.failed => '결제 실패: ${result.message ?? '사유 미상'}',
                  PaymentStatus.pending => '결제 대기',
                };
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
              },
              child: const Text('결제(모의)'),
            ),
          ],
        ),
      ),
    );
  }
}
*/