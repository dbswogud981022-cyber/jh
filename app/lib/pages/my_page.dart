import 'package:flutter/material.dart';
import 'package:app/services/auth_service.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = AuthService.I.current;
    return Scaffold(
      appBar: AppBar(title: const Text('마이페이지')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            if (user != null)
              ListTile(
                leading: const CircleAvatar(child: Icon(Icons.person)),
                title: Text(user.displayName),
                subtitle: Text('provider: ${user.provider}'),
              ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () async {
                  await AuthService.I.logout();
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('로그아웃되었습니다.')),
                    );
                  }
                },
                child: const Text('로그아웃'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
