import 'package:flutter/material.dart';
import 'package:app/services/auth_service.dart';
import 'package:app/widgets/contract_uploader.dart';

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
      setState(() {}); // refresh after login
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _requireLogin());
  }

  @override
  Widget build(BuildContext context) {
    final user = AuthService.I.current;
    return Scaffold(
      appBar: AppBar(title: const Text('OO페이')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(user == null ? '로그인이 필요합니다' : '환영합니다, ${user.displayName} 님',
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          const SizedBox(height: 16),
          const Text('1) 내 월세 정보 입력\n2) 계약서 첨부\n3) 카드 결제 진행',
              style: TextStyle(color: Colors.black54)),
          const SizedBox(height: 16),
          ContractUploader(onPicked: (file) {
            setState(() => _contractName = file.name);
          }),
          if (_contractName != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text('첨부됨: $_contractName'),
            ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: user == null
                  ? null
                  : () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('모의 결제 플로우 시작(서버 연결 예정)')),
                      );
                    },
              child: const Text('집업페이 시작하기'),
            ),
          ),
        ],
      ),
    );
  }
}
