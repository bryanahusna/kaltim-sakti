import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff02517c),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(48, 152, 48, 0),
              child: Image.asset('assets/splash/logo.png', fit: BoxFit.fitWidth,),
            ),

            // Nomor Telp/WhatsApp
            const SizedBox(height: 48,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Text(
                      'Nomor Telp/WhatsApp',
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(height: 8, ),
                TextFormField(
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 16,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Color(0xff384DFE),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          padding: EdgeInsets.symmetric(vertical: 20),
                        ),
                        onPressed: () {
                          context.goNamed('main_page');
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 18),
                        )
                    )
                  ],
                )
              ],
            ),

            // Divider
            const SizedBox(height: 16,),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    color: Color(0xFFB0B0B0),
                  ),
                ),
                const SizedBox(width: 32,),
                Text(
                    'atau',
                  style: TextStyle(color: Color(0xFFEFEFEF)),
                ),
                const SizedBox(width: 32,),
                Expanded(
                  child: Container(
                    height: 1,
                    color: Color(0xFFB0B0B0),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16,),

            // Login with Facebook & Google
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: Color(0xFF1877F2),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        padding: EdgeInsets.symmetric(vertical: 20),
                      ),
                      onPressed: () {
                        context.goNamed('main_page');
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 28,
                            child: Image.asset('assets/logo-third-party/Facebook Logo.png', fit: BoxFit.fitHeight,),
                          ),
                          SizedBox(width: 12,),
                          Text(
                            'Continue with Facebook',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: Color(0xFFFFFFFF),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        padding: EdgeInsets.symmetric(vertical: 20),
                      ),
                      onPressed: () {
                        context.goNamed('main_page');
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 28,
                            child: Image.asset('assets/logo-third-party/Google Logo.png', fit: BoxFit.fitHeight,),
                          ),
                          SizedBox(width: 12,),
                          Text(
                            'Continue with Google',
                            style: TextStyle(fontSize: 18, color: Color(0x90000000)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),

            // Versi
            const SizedBox(height: 96,),
            Center(
              child: Text(
                'versi 1.0',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      )
    );
  }
}