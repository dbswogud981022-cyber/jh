import 'package:flutter/material.dart';

enum TxType { income, expense }

class Wallet {
  final int balance;
  const Wallet({required this.balance});
}

class TransactionItem {
  final String id;
  final DateTime time;
  final String title;
  final String? desc;
  final int amount;
  final TxType type;
  final IconData icon;
  const TransactionItem({
    required this.id,
    required this.time,
    required this.title,
    this.desc,
    required this.amount,
    required this.type,
    required this.icon,
  });
}

class RentPlan {
  final int monthlyRent;
  final double feeRate;
  final String maskedCard;
  final DateTime nextChargeDate;
  const RentPlan({
    required this.monthlyRent,
    required this.feeRate,
    required this.maskedCard,
    required this.nextChargeDate,
  });

  int feeAmount() => (monthlyRent * (feeRate / 100)).round();
  int totalAmount() => monthlyRent + feeAmount();
}
