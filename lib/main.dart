import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kaltim_sakti/pages/beranda_page/darurat_page.dart';
import 'package:kaltim_sakti/pages/beranda_page/info_kaltim_page.dart';
import 'package:kaltim_sakti/pages/beranda_page/lapor_gub_page.dart';
import 'package:kaltim_sakti/pages/beranda_page/urus_izin_page.dart';
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
        },
        routes: [
          GoRoute(
              path: '/darurat_page',
              name: 'darurat_page',
              builder: (context, state) {
                return const DaruratPage();
              }),
          GoRoute(
              path: '/urus_izin_page',
              name: 'urus_izin_page',
              builder: (context, state) {
                return const UrusIzinPage();
              }),
          GoRoute(
              path: '/info_kaltim_page',
              name: 'info_kaltim_page',
              builder: (context, state) {
                return const InfoKaltimPage();
              }),
          GoRoute(
              path: '/lapor_gub_page',
              name: 'lapor_gub_page',
              builder: (context, state) {
                return const LaporGubPage();
              }),
        ])
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
