import 'package:flutter/material.dart';
import 'package:moneymind/presentations/screens/forgot_password_code_verification_screen.dart';
import 'package:moneymind/presentations/widgets/custom_arrow_back.dart';
import 'package:moneymind/presentations/widgets/custom_button.dart';
import 'package:moneymind/presentations/widgets/custom_input_field.dart';
import 'package:moneymind/styles/text_styles.dart';

void _handleResendCode() {
  print('Resend code');
}

void _handleCodeSubmit(String code) {
  print('Código ingresado: $code');
}

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'lib/assets/images/BackgroundAuth.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(top: 40, left: 10, child: CustomArrowBack()),
          Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/assets/images/Logo.webp',
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(height: 20),
                  const Text('Recuperar contraseña',
                      style: AppTextStyles.sectionTitle),
                  const SizedBox(height: 20),
                  const Text(
                      'Ingresa tu correo electrónica y te enviaremos un enlace para restablecer tu contraseña.',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.textDetail),
                  const SizedBox(height: 20),
                  CustomInputField(
                      label: 'Email',
                      hint: 'Email',
                      controller: TextEditingController()),
                  const SizedBox(height: 20),
                  CustomButton(
                      text: 'Enviar',
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 12.0),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ForgotPasswordCodeVerification(
                                        onResend: _handleResendCode,
                                        onSubmit: _handleCodeSubmit)));
                      })
                ],
              )))
        ],
      ),
    );
  }
}
