// recent_item.dart — 최근 결제/청구/환불 등 한 줄 아이템(뜻: 리스트 셀)
import 'package:flutter/material.dart';

class RecentItem extends StatelessWidget {
  final String title;  // 예: '2025-08 월세'
  final String subtitle; // 예: '결제 성공'
  final int amount;    // 예: 1,000,000
  final bool positive; // 예: true면 +금액 스타일

  const RecentItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.amount,
    this.positive = false,
  });

  String _formatWon(int n) {
    final s = n.toString();
    final buf = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      final rev = s.length - 1 - i;
      buf.write(s[i]);
      if (rev % 3 == 0 && i != s.length - 1) buf.write(',');
    }
    return '${positive ? '+' : '-'}${buf.toString()}원';
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 18,
        backgroundColor: cs.primary.withOpacity(0.12),
        child: Icon(Icons.receipt_long, color: cs.primary, size: 18),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle, style: TextStyle(color: cs.onSurfaceVariant)),
      trailing: Text(
        _formatWon(amount),
        style: TextStyle(
          color: positive ? Colors.teal[700] : Colors.red[700],
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
