import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kaltim_sakti/pages/login_page.dart';
import 'package:kaltim_sakti/pages/main_page.dart';
import 'package:kaltim_sakti/pages/welcome_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final GoRouter router = GoRouter(routes: [
    GoRoute(
        path: '/welcome_screen',
        name: 'welcome_screen',
        builder: (context, state) {
          return const WelcomeScreenPage();
        }),
    GoRoute(
        path: '/login_page',
        name: 'login_page',
        builder: (context, state) {
          return const LoginPage();
        }),
    GoRoute(
        path: '/',
        name: 'main_page',
        builder: (context, state) {
          return const MainPage();
        })
  ], initialLocation: '/welcome_screen', debugLogDiagnostics: false);

  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
    );
  }
}
