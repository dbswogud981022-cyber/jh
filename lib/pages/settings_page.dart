import 'package:flutter/material.dart';
import '../design/tokens.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('설정', style: TextStyle(fontWeight: FontWeight.w700)),
      ),
      body: ListView(
        padding: AppSpace.page,
        children: const [
          _Tile(title: '생체인증(지문/Face ID)', subtitle: '다음 결제 시 인증'),
          _Tile(title: '알림', subtitle: '결제일 하루 전, 결제 결과 안내'),
          _Tile(title: '접근성', subtitle: '글자 크기/대비 모드'),
        ],
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  final String title;
  final String subtitle;
  const _Tile({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
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
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
              const SizedBox(height: 4),
              Text(subtitle, style: AppText.sub),
            ]),
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
