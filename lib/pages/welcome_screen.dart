import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreenPage extends StatelessWidget {
  const WelcomeScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Selamat datang di Aplikasi SAKTI'),
            const Text('Satu Akses Kalimantan Timur'),
            ElevatedButton(
                onPressed: () {
                  context.goNamed('login_page');
                },
                child: const Text('Mulai')
            )
          ],
        ),
      ),
    );
  }
}
