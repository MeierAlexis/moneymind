import 'package:flutter/material.dart';
import 'package:moneymind/presentations/screens/login_screen.dart';
import 'package:moneymind/styles/text_styles.dart';

import '../widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFCFBF4),
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.asset(
              'lib/assets/images/BackgroundAuth.jpg',
              fit: BoxFit.cover, // Cubre toda la pantalla
            ),
          ),
          // Contenido principal
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'lib/assets/images/Logo.webp',
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(height: 20),
                    const Text.rich(
                      TextSpan(
                        text: '¿Dónde está mi ',
                        style: AppTextStyles.title,
                        children: [
                          TextSpan(
                            text: 'dinero?',
                            style: TextStyle(
                              color: Color(0XFF2ECC71),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Image.asset(
                  'lib/assets/images/money-stress.gif',
                  width: 300,
                  height: 300,
                ),
                const SizedBox(height: 60),
                CustomButton(
                  text: 'Comenzar',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  fontSize: 20.0,
                  padding: const EdgeInsets.fromLTRB(85, 12, 85, 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
