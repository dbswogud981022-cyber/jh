// balance_card.dart — 잔액/다음 청구 안내 카드(뜻: 메인 강조 정보)
import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  final int balance;         // (뜻: 현재 잔액/포인트 등, 원 단위)
  final DateTime nextDue;    // (뜻: 다음 청구일)
  final int nextAmount;      // (뜻: 다음 청구 금액)

  const BalanceCard({
    super.key,
    required this.balance,
    required this.nextDue,
    required this.nextAmount,
  });

  String _formatWon(int n) {
    // (뜻: 100000 → 100,000원 형식; 간단 포맷)
    final s = n.toString();
    final buf = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      final rev = s.length - 1 - i;
      buf.write(s[i]);
      if (rev % 3 == 0 && i != s.length - 1) buf.write(',');
    }
    return '${buf.toString()}원';
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          colors: [cs.primary, cs.primary.withOpacity(0.75)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('내 잔액', style: TextStyle(color: cs.onPrimary.withOpacity(0.9))),
          const SizedBox(height: 8),
          Text(
            _formatWon(balance),
            style: TextStyle(
              color: cs.onPrimary,
              fontSize: 28,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.calendar_month, color: cs.onPrimary.withOpacity(0.9), size: 18),
              const SizedBox(width: 6),
              Text(
                '다음 청구 ${nextDue.month}/${nextDue.day} • ${_formatWon(nextAmount)}',
                style: TextStyle(color: cs.onPrimary.withOpacity(0.9)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
