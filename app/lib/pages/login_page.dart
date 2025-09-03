import 'package:flutter/material.dart';
import 'package:app/services/auth_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('로그인')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFEE500)),
              onPressed: () async {
                await AuthService.I.loginKakao();
                if (context.mounted) Navigator.pop(context);
              },
              child:
                  const Text('카카오로 로그인', style: TextStyle(color: Colors.black)),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () async {
                await AuthService.I.loginApple();
                if (context.mounted) Navigator.pop(context);
              },
              child: const Text('Apple로 로그인',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
