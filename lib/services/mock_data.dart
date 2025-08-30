import 'package:flutter/material.dart';
import '../models/models.dart';

class MockData {
  static Wallet wallet() => const Wallet(balance: 1250000);

  static List<TransactionItem> transactions() {
    final now = DateTime.now();
    return [
      TransactionItem(
        id: 't1',
        time: now.subtract(const Duration(minutes: 30)),
        title: '편의점 결제',
        desc: 'GS25',
        amount: -5800,
        type: TxType.expense,
        icon: Icons.shopping_bag_outlined,
      ),
      TransactionItem(
        id: 't2',
        time: now.subtract(const Duration(hours: 2)),
        title: '송금 받음',
        desc: '이민수',
        amount: 50000,
        type: TxType.income,
        icon: Icons.call_received_outlined,
      ),
    ];
  }

  static RentPlan rentPlan() {
    final today = DateTime.now();
    final next = DateTime(today.year, today.month, today.day)
        .add(const Duration(days: 5));
    return RentPlan(
      monthlyRent: 850000,
      feeRate: 1.8,
      maskedCard: '우리카드 ****-1234',
      nextChargeDate: next,
    );
  }

  static List<BenefitItem> benefits() => const [
        BenefitItem(
            id: 'b1',
            title: '청소 비용 아끼기',
            subtitle: '15,000원 할인',
            vendor: '청소연구소'),
        BenefitItem(
            id: 'b2', title: '생활용품 할인', subtitle: '20% 할인', vendor: '생활공작소'),
        BenefitItem(
            id: 'b3', title: '전세사기 예방', subtitle: '안전 리포트', vendor: '안전연구소'),
      ];
}

class BenefitItem {
  final String id;
  final String title;
  final String subtitle;
  final String vendor;
  const BenefitItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.vendor,
  });
}
