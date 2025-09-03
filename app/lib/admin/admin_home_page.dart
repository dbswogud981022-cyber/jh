import 'package:flutter/material.dart';
import 'package:app/design/tokens.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('관리자 대시보드')),
      body: ListView(
        padding: AppSpace.page,
        children: const [
          _Card(title: '회원 총관리', desc: '회원 데이터, 가입/탈퇴 이력'),
          _Card(title: '결제 총내역', desc: '월별 매출, 카드사/수수료 리포트'),
          _Card(title: '주문/신청 관리', desc: '결제 신청 승인/반려, 상태변경'),
          _Card(title: '계약서 검수', desc: '업로드 파일 검수/승인'),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final String title;
  final String desc;
  const _Card({required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.card),
        boxShadow: [appShadow()],
      ),
      child: Row(
        children: [
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: AppText.h2),
              const SizedBox(height: 4),
              Text(desc, style: AppText.sub),
            ]),
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
