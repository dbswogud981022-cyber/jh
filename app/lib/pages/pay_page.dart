import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../widgets/contract_uploader.dart';

class PayPage extends StatefulWidget {
  const PayPage({super.key});
  @override
  State<PayPage> createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  String? _contractName;

  Future<void> _requireLogin() async {
    if (AuthService.I.current == null && context.mounted) {
      await Navigator.pushNamed(context, '/login');
      setState(() {}); // refresh
    }
  }

  @override
  void initState() {
    super.initState();
    // 진입 시 로그인 요구
    WidgetsBinding.instance.addPostFrameCallback((_) => _requireLogin());
  }

  @override
  Widget build(BuildContext context) {
    final user = AuthService.I.current;
    return Scaffold(
lib/pages/activity_page.dart:48:63: Error: Member not found: 'textSecondary'.
                  style: AppText.h2.copyWith(color: AppColors.textSecondary)),
                                                              ^^^^^^^^^^^^^
lib/pages/activity_page.dart:42:18: Error: The getter 'AppSpace' isn't defined for the
class 'ActivityPage'.
 - 'ActivityPage' is from 'package:app/pages/activity_page.dart'
 ('lib/pages/activity_page.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field
named 'AppSpace'.
        padding: AppSpace.page,
                 ^^^^^^^^
lib/pages/activity_page.dart:48:26: Error: The getter 'AppText' isn't defined for the
class 'ActivityPage'.
 - 'ActivityPage' is from 'package:app/pages/activity_page.dart'
 ('lib/pages/activity_page.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field
named 'AppText'.
                  style: AppText.h2.copyWith(color: AppColors.textSecondary)),
                         ^^^^^^^
lib/pages/activity_page.dart:57:55: Error: The getter 'AppRadius' isn't defined for the
class 'ActivityPage'.
 - 'ActivityPage' is from 'package:app/pages/activity_page.dart'
 ('lib/pages/activity_page.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field
named 'AppRadius'.
                  borderRadius: BorderRadius.circular(AppRadius.card),
                                                      ^^^^^^^^^
lib/pages/activity_page.dart:73:51: Error: The getter 'AppText' isn't defined for the
class 'ActivityPage'.
 - 'ActivityPage' is from 'package:app/pages/activity_page.dart'
 ('lib/pages/activity_page.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field
named 'AppText'.
                            Text(it.desc!, style: AppText.sub),
                                                  ^^^^^^^
lib/pages/activity_page.dart:86:13: Error: The getter 'AppSpace' isn't defined for the
class 'ActivityPage'.
 - 'ActivityPage' is from 'package:app/pages/activity_page.dart'
 ('lib/pages/activity_page.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field
named 'AppSpace'.
            AppSpace.listGap,
            ^^^^^^^^
lib/pages/activity_page.dart:88:11: Error: The getter 'AppSpace' isn't defined for the
class 'ActivityPage'.
 - 'ActivityPage' is from 'package:app/pages/activity_page.dart'
 ('lib/pages/activity_page.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field
named 'AppSpace'.
          AppSpace.sectionGap,
          ^^^^^^^^lib/pages/activity_page.dart:48:63: Error: Member not found: 'textSecondary'.
                  style: AppText.h2.copyWith(color: AppColors.textSecondary)),
                                                              ^^^^^^^^^^^^^
lib/pages/activity_page.dart:42:18: Error: The getter 'AppSpace' isn't defined for the
class 'ActivityPage'.
 - 'ActivityPage' is from 'package:app/pages/activity_page.dart'
 ('lib/pages/activity_page.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field
named 'AppSpace'.
        padding: AppSpace.page,
                 ^^^^^^^^
lib/pages/activity_page.dart:48:26: Error: The getter 'AppText' isn't defined for the
class 'ActivityPage'.
 - 'ActivityPage' is from 'package:app/pages/activity_page.dart'
 ('lib/pages/activity_page.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field
named 'AppText'.
                  style: AppText.h2.copyWith(color: AppColors.textSecondary)),
                         ^^^^^^^
lib/pages/activity_page.dart:57:55: Error: The getter 'AppRadius' isn't defined for the
class 'ActivityPage'.
 - 'ActivityPage' is from 'package:app/pages/activity_page.dart'
 ('lib/pages/activity_page.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field
named 'AppRadius'.
                  borderRadius: BorderRadius.circular(AppRadius.card),
                                                      ^^^^^^^^^
lib/pages/activity_page.dart:73:51: Error: The getter 'AppText' isn't defined for the
class 'ActivityPage'.
 - 'ActivityPage' is from 'package:app/pages/activity_page.dart'
 ('lib/pages/activity_page.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field
named 'AppText'.
                            Text(it.desc!, style: AppText.sub),
                                                  ^^^^^^^
lib/pages/activity_page.dart:86:13: Error: The getter 'AppSpace' isn't defined for the
class 'ActivityPage'.
 - 'ActivityPage' is from 'package:app/pages/activity_page.dart'
 ('lib/pages/activity_page.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field
named 'AppSpace'.
            AppSpace.listGap,
            ^^^^^^^^
lib/pages/activity_page.dart:88:11: Error: The getter 'AppSpace' isn't defined for the
class 'ActivityPage'.
 - 'ActivityPage' is from 'package:app/pages/activity_page.dart'
 ('lib/pages/activity_page.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field
named 'AppSpace'.
          AppSpace.sectionGap,
          ^^^^^^^^lib/pages/activity_page.dart:48:63: Error: Member not found: 'textSecondary'.
                  style: AppText.h2.copyWith(color: AppColors.textSecondary)),
                                                              ^^^^^^^^^^^^^
lib/pages/activity_page.dart:42:18: Error: The getter 'AppSpace' isn't defined for the
class 'ActivityPage'.
 - 'ActivityPage' is from 'package:app/pages/activity_page.dart'
 ('lib/pages/activity_page.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field
named 'AppSpace'.
        padding: AppSpace.page,
                 ^^^^^^^^
lib/pages/activity_page.dart:48:26: Error: The getter 'AppText' isn't defined for the
class 'ActivityPage'.
 - 'ActivityPage' is from 'package:app/pages/activity_page.dart'
 ('lib/pages/activity_page.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field
named 'AppText'.
                  style: AppText.h2.copyWith(color: AppColors.textSecondary)),
                         ^^^^^^^
lib/pages/activity_page.dart:57:55: Error: The getter 'AppRadius' isn't defined for the
class 'ActivityPage'.
 - 'ActivityPage' is from 'package:app/pages/activity_page.dart'
 ('lib/pages/activity_page.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field
named 'AppRadius'.
                  borderRadius: BorderRadius.circular(AppRadius.card),
                                                      ^^^^^^^^^
lib/pages/activity_page.dart:73:51: Error: The getter 'AppText' isn't defined for the
class 'ActivityPage'.
 - 'ActivityPage' is from 'package:app/pages/activity_page.dart'
 ('lib/pages/activity_page.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field
named 'AppText'.
                            Text(it.desc!, style: AppText.sub),
                                                  ^^^^^^^
lib/pages/activity_page.dart:86:13: Error: The getter 'AppSpace' isn't defined for the
class 'ActivityPage'.
 - 'ActivityPage' is from 'package:app/pages/activity_page.dart'
 ('lib/pages/activity_page.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field
named 'AppSpace'.
            AppSpace.listGap,
            ^^^^^^^^
lib/pages/activity_page.dart:88:11: Error: The getter 'AppSpace' isn't defined for the
class 'ActivityPage'.
 - 'ActivityPage' is from 'package:app/pages/activity_page.dart'
 ('lib/pages/activity_page.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field
named 'AppSpace'.
          AppSpace.sectionGap,
          ^^^^^^^^      appBar: AppBar(title: const Text('OO페이')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(user == null ? '로그인이 필요합니다' : '환영합니다, ${user.displayName} 님',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          const SizedBox(height: 16),
          const Text('1) 내 월세 정보 입력\n2) 계약서 첨부\n3) 카드 결제 진행', style: TextStyle(color: Colors.black54)),
          const SizedBox(height: 16),
          ContractUploader(onPicked: (file) {
            setState(() => _contractName = file.name);
          }),
          if (_contractName != null) Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text('첨부됨: $_contractName'),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: user == null ? null : () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('모의 결제 플로우 시작(서버 연결 예정)')),
                );
              },
              child: const Text('집업페이 시작하기'),
            ),
          ),lib/pages/activity_page.dart:48:63: Error: Member not found: 'textSecondary'.
                  style: AppText.h2.copyWith(color: AppColors.textSecondary)),
                                                              ^^^^^^^^^^^^^
lib/pages/activity_page.dart:42:18: Error: The getter 'AppSpace' isn't defined for the
class 'ActivityPage'.
 - 'ActivityPage' is from 'package:app/pages/activity_page.dart'
 ('lib/pages/activity_page.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field
named 'AppSpace'.
        padding: AppSpace.page,
                 ^^^^^^^^
lib/pages/activity_page.dart:48:26: Error: The getter 'AppText' isn't defined for the
class 'ActivityPage'.
 - 'ActivityPage' is from 'package:app/pages/activity_page.dart'
 ('lib/pages/activity_page.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field
named 'AppText'.
                  style: AppText.h2.copyWith(color: AppColors.textSecondary)),
                         ^^^^^^^
lib/pages/activity_page.dart:57:55: Error: The getter 'AppRadius' isn't defined for the
class 'ActivityPage'.
 - 'ActivityPage' is from 'package:app/pages/activity_page.dart'
 ('lib/pages/activity_page.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field
named 'AppRadius'.
                  borderRadius: BorderRadius.circular(AppRadius.card),
                                                      ^^^^^^^^^
lib/pages/activity_page.dart:73:51: Error: The getter 'AppText' isn't defined for the
class 'ActivityPage'.
 - 'ActivityPage' is from 'package:app/pages/activity_page.dart'
 ('lib/pages/activity_page.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field
named 'AppText'.
                            Text(it.desc!, style: AppText.sub),
                                                  ^^^^^^^
lib/pages/activity_page.dart:86:13: Error: The getter 'AppSpace' isn't defined for the
class 'ActivityPage'.
 - 'ActivityPage' is from 'package:app/pages/activity_page.dart'
 ('lib/pages/activity_page.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field
named 'AppSpace'.
            AppSpace.listGap,
            ^^^^^^^^
lib/pages/activity_page.dart:88:11: Error: The getter 'AppSpace' isn't defined for the
class 'ActivityPage'.
 - 'ActivityPage' is from 'package:app/pages/activity_page.dart'
 ('lib/pages/activity_page.dart').
Try correcting the name to the name of an existing getter, or defining a getter or field
named 'AppSpace'.
          AppSpace.sectionGap,
          ^^^^^^^^
        ],
      ),
    );
  }
}
