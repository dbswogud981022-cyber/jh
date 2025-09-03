import 'package:flutter/material.dart';
import 'package:app/design/tokens.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final txs = [
      {'title': '월세 결제', 'desc': '우리카드 ****-1234', 'amount': -850000},
      {'title': '혜택 지급', 'desc': '수수료 캐시백', 'amount': 15000},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('거래 내역')),
      body: ListView(
        padding: AppSpace.page,
        children: txs.map((it) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(AppRadius.card),
              boxShadow: [appShadow()],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(it['title'] as String,
                      style: AppText.h2.copyWith(color: AppColors.textPrimary)),
                  if (it['desc'] != null)
                    Text(it['desc'] as String, style: AppText.sub),
                ]),
                Text('${it['amount']}원',
                    style: AppText.h2.copyWith(color: AppColors.textSecondary)),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
