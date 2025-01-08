import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreenPage extends StatelessWidget {
  const WelcomeScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Image.asset('assets/welcome-screen/background.jpg',),
          Container(color: Color(0xBB113273), ),

          // Main Content
          Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(58), topRight: Radius.circular(58)),
                        color: Colors.white
                    ),
                    height: 500,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 10,),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/welcome-screen/building.png',),

                        const SizedBox(height: 32,),
                        const Text(
                            'Selamat datang di Aplikasi SAKTI',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                        ),

                        const SizedBox(height: 24,),
                        const Text(
                            'Satu Akses Kalimantan Timur',
                            style: TextStyle(fontSize: 18),
                        ),

                        const SizedBox(height: 24,),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFFFD701),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 100),
                            ),
                            onPressed: () {
                              context.goNamed('login_page');
                            },
                            child: const Text(
                              'Mulai',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF373639), fontSize: 18),
                            )
                        ),

                        const SizedBox(height: 64,)
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      )
    );
  }
}
