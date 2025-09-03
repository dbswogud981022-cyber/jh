import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 실제로는 관리자 인증/권한 체크 필요
    return Scaffold(
      appBar: AppBar(title: const Text('관리자 대시보드')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          _Card(title: '회원 총관리', desc: '회원 상세 데이터, 가입/탈퇴 이력'),
          _Card(title: '결제 총내역', desc: '월별 매출, 카드사/수수료 리포트'),
          _Card(title: '주문/신청 관리', desc: '월세 결제 신청 승인/반려, 상태변경'),
          _Card(title: '계약서 검수', desc: '업로드 파일 열람/승인, OCR(추후)'),
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
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.06),
              blurRadius: 16,
              spreadRadius: -8)
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                Text(desc, style: const TextStyle(color: Colors.black54)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
