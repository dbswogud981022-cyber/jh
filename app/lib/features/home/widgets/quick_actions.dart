// quick_actions.dart — 자주 쓰는 작업을 한 줄에 배치(뜻: UX 단축)
import 'package:flutter/material.dart';

class QuickActions extends StatelessWidget {
  final VoidCallback onPayRent;     // (뜻: 월세 결제 액션)
  final VoidCallback onAddCard;     // (뜻: 카드 연결)
  final VoidCallback onUploadProof; // (뜻: 증빙 업로드)

  const QuickActions({
    super.key,
    required this.onPayRent,
    required this.onAddCard,
    required this.onUploadProof,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _ActionChip(icon: Icons.payments, label: '월세 결제', color: cs.primary, onTap: onPayRent),
        _ActionChip(icon: Icons.add_card, label: '카드 연결', color: cs.tertiary, onTap: onAddCard),
        _ActionChip(icon: Icons.cloud_upload, label: '증빙 업로드', color: cs.secondary, onTap: onUploadProof),
      ],
    );
  }
}

class _ActionChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ActionChip({required this.icon, required this.label, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 108,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.12),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.25)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(height: 8),
            Text(label,
                style: TextStyle(
                  color: cs.onSurface.withOpacity(0.9),
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.2,
                )),
          ],
        ),
      ),
    );
  }
}
