// 거래 내역(날짜별 그룹) — 토스 감성 카드
import 'package:flutter/material.dart';
import '../design/tokens.dart';
import '../models/models.dart';
import '../services/mock_data.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  Map<String, List<TransactionItem>> _groupByDate(List<TransactionItem> items) {
    final map = <String, List<TransactionItem>>{};
    for (final it in items) {
      final key =
          "${it.time.year}-${it.time.month.toString().padLeft(2, '0')}-${it.time.day.toString().padLeft(2, '0')}";
      map.putIfAbsent(key, () => []).add(it);
    }
    final sorted = Map.fromEntries(
        map.entries.toList()..sort((a, b) => b.key.compareTo(a.key)));
    return sorted;
  }

  String _fmtAmount(int v) {
    final sign = v > 0 ? '+' : '';
    final won = v.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},');
    return '$sign$won원';
  }

  @override
  Widget build(BuildContext context) {
    final items = MockData.transactions();
    final grouped = _groupByDate(items);

    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('내역', style: TextStyle(fontWeight: FontWeight.w700)),
      ),
      body: ListView(
        padding: AppSpace.page,
        children: [
          for (final entry in grouped.entries) ...[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(entry.key,
                  style: AppText.h2.copyWith(color: AppColors.textSecondary)),
            ),
            ...entry.value.map((it) {
              final color = it.amount >= 0 ? Colors.blue : Colors.black87;
              return Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(AppRadius.card),
                  boxShadow: [appShadow()],
                ),
                child: Row(
                  children: [
                    Icon(it.icon, size: 28, color: Colors.black87),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(it.title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16)),
                          if (it.desc != null) ...[
                            const SizedBox(height: 4),
                            Text(it.desc!, style: AppText.sub),
                          ]
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(_fmtAmount(it.amount),
                        style: TextStyle(
                            fontWeight: FontWeight.w700, color: color)),
                  ],
                ),
              );
            }),
            AppSpace.listGap,
          ],
          AppSpace.sectionGap,
        ],
      ),
    );
  }
}
