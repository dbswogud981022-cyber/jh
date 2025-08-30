// 메인 = "월세 신용카드" 중심. 지갑 카드 삭제, 월세 카드 결제 플로우.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../design/tokens.dart';
import '../services/mock_data.dart';
import '../models/models.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  String _dateStr(DateTime d) =>
      "${d.year}.${d.month.toString().padLeft(2, '0')}.${d.day.toString().padLeft(2, '0')}";

  String _won(int v) =>
      v.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => "${m[1]},") +
      "원";

  Future<void> _openOneTouchRent(RentPlan plan) async {
    HapticFeedback.lightImpact();

    int step = 0;
    DateTime selectedDate = plan.nextChargeDate;

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(AppRadius.sheetTop)),
      ),
      builder: (ctx) {
        return StatefulBuilder(builder: (ctx, setModal) {
          final steps = [
            (
              title: '결제 방식 선택',
              desc: '지금 결제하거나, 원하는 날짜로 예약할 수 있어요.',
              icon: Icons.credit_card
            ),
            (
              title: '결제일 선택',
              desc: '원하는 날짜를 고르세요.',
              icon: Icons.event_outlined
            ),
            (
              title: '확인',
              desc: '아래 금액과 수수료를 확인하고 진행하세요.',
              icon: Icons.check_circle_outline
            ),
          ];
          final isLast = step == steps.length - 1;

          Widget dateChips() {
            final today = DateTime.now();
            final opts = <DateTime>[
              DateTime(today.year, today.month, today.day),
              DateTime(today.year, today.month, today.day + 1),
              plan.nextChargeDate,
            ];
            return Wrap(
              spacing: 8,
              runSpacing: 8,
              children: opts.map((d) {
                final sel = _dateStr(d) == _dateStr(selectedDate);
                return ChoiceChip(
                  label: Text(_dateStr(d),
                      style: TextStyle(
                        color: sel ? Colors.white : Colors.black87,
                        fontWeight: FontWeight.w600,
                      )),
                  selected: sel,
                  selectedColor: AppColors.seedBlue,
                  onSelected: (_) => setModal(() => selectedDate = d),
                  backgroundColor: Colors.black.withOpacity(.06),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.chip)),
                );
              }).toList(),
            );
          }

          return Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 16,
              bottom: 20 + MediaQuery.of(ctx).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 42,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.12),
                    borderRadius: BorderRadius.circular(99),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(steps.length, (i) {
                    final active = i <= step;
                    return Container(
                      width: 28,
                      height: 6,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: active
                            ? AppColors.seedBlue
                            : Colors.black.withOpacity(.1),
                        borderRadius: BorderRadius.circular(99),
                      ),
                    ).animate().fadeIn(duration: 180.ms);
                  }),
                ),
                const SizedBox(height: 16),
                Icon(steps[step].icon, size: 56, color: AppColors.seedBlue)
                    .animate()
                    .fadeIn(duration: 200.ms)
                    .moveY(begin: 8, end: 0, duration: 200.ms),
                const SizedBox(height: 8),
                Text(steps[step].title,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700))
                    .animate()
                    .fadeIn(duration: 180.ms),
                const SizedBox(height: 4),
                Text(steps[step].desc,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.black54))
                    .animate()
                    .fadeIn(duration: 180.ms),
                const SizedBox(height: 16),
                if (step == 0) ...[
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        HapticFeedback.selectionClick();
                        setModal(() => step = 2);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.seedBlue,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 56),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(AppRadius.button)),
                      ),
                      child: const Text('지금 결제',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        HapticFeedback.selectionClick();
                        setModal(() => step = 1);
                      },
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 56),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(AppRadius.button)),
                      ),
                      child: const Text('결제 예약',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
                if (step == 1) ...[
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('결제일', style: AppText.h2)),
                  const SizedBox(height: 10),
                  dateChips(),
                  const SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        HapticFeedback.selectionClick();
                        setModal(() => step = 2);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.seedBlue,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 56),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(AppRadius.button)),
                      ),
                      child: const Text('다음',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
                if (step == 2) ...[
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(AppRadius.card),
                      boxShadow: [appShadow()],
                    ),
                    child: Column(
                      children: [
                        _kv('결제일', _dateStr(selectedDate)),
                        _kv('카드', plan.maskedCard),
                        const Divider(height: 20),
                        _kv('월세', _won(plan.monthlyRent)),
                        _kv('수수료 (${plan.feeRate.toStringAsFixed(1)}%)',
                            _won(plan.feeAmount())),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('총 결제 금액',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700)),
                            Text(_won(plan.totalAmount()),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w800)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        HapticFeedback.heavyImpact();
                        Navigator.of(ctx).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  '결제 ${_dateStr(selectedDate)}로 접수되었습니다.')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.seedBlue,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 56),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(AppRadius.button)),
                      ),
                      child: const Text('결제 요청',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ],
            ),
          );
        });
      },
    );
  }

  Widget _kv(String k, String v) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(k, style: const TextStyle(color: Colors.black54)),
          Text(v, style: const TextStyle(fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final plan = MockData.rentPlan();

    final appBar = AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text('월세카드', style: TextStyle(fontWeight: FontWeight.w700)),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none, color: Colors.black)),
      ],
    );

    final rentCard = Container(
      padding: AppSpace.cardPad,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppRadius.card),
        boxShadow: [appShadow()],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('우리집 월세',
              style: TextStyle(fontSize: 16, color: Colors.grey)),
          const SizedBox(height: 6),
          Text(_won(plan.monthlyRent),
              style:
                  const TextStyle(fontSize: 28, fontWeight: FontWeight.w700)),
          const SizedBox(height: 10),
          Row(
            children: [
              _badge(text: '다음 결제일 ${_dateStr(plan.nextChargeDate)}'),
              const SizedBox(width: 8),
              _badge(text: '수수료 ${plan.feeRate.toStringAsFixed(1)}%'),
            ],
          ),
          const SizedBox(height: 12),
          Text('결제 카드: ${plan.maskedCard}', style: AppText.sub),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 240.ms)
        .moveY(begin: 8, end: 0, duration: 240.ms);

    final mainCTA = SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => _openOneTouchRent(plan),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.seedBlue,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.button)),
        ),
        child: const Text('원터치 월세결제',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
      ),
    ).animate().fadeIn(duration: 220.ms);

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
            child: Text('월세 카드 결제 수수료 할인 혜택 받기 >',
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
              color: AppColors.card,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [appShadow()],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(b.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 16)),
                const SizedBox(height: 6),
                Text(b.subtitle, style: AppText.sub),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(b.vendor, style: AppText.sub),
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
        NavigationDestination(icon: Icon(Icons.list_alt), label: '내역'),
        NavigationDestination(icon: Icon(Icons.settings), label: '설정'),
      ],
      selectedIndex: _currentIndex,
      onDestinationSelected: (idx) {
        setState(() => _currentIndex = idx);
        if (idx == 0) context.go('/');
        if (idx == 1) context.go('/activity');
        if (idx == 2) context.go('/settings');
      },
    );

    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: ListView(
          padding: AppSpace.page,
          children: [
            rentCard,
            const SizedBox(height: 16),
            mainCTA,
            const SizedBox(height: 16),
            banner,
            AppSpace.sectionGap,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('생활 혜택',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                Text('전체보기 >',
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 12),
            benefits,
          ],
        ),
      ),
      bottomNavigationBar: bottomNav,
    );
  }

  Widget _badge({required String text}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.06),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}
