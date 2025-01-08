import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreenPage extends StatelessWidget {
  const WelcomeScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              context.goNamed('login_page');
            },
            child: const Text('Login')),
      ),
    );
  }
}
