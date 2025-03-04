import 'package:flutter/material.dart';
import 'package:moneymind/presentations/screens/change_password_screen.dart';
import 'package:moneymind/presentations/widgets/custom_arrow_back.dart';
import 'package:moneymind/presentations/widgets/custom_button.dart';
import 'package:moneymind/styles/text_styles.dart';

class ForgotPasswordCodeVerification extends StatefulWidget {
  final VoidCallback onResend;
  final Function(String) onSubmit;

  const ForgotPasswordCodeVerification({
    super.key,
    required this.onResend,
    required this.onSubmit,
  });

  @override
  State<ForgotPasswordCodeVerification> createState() =>
      _ForgotPasswordCodeVerificationState();
}

class _ForgotPasswordCodeVerificationState
    extends State<ForgotPasswordCodeVerification> {
  final TextEditingController _pinController = TextEditingController();
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
          Positioned(top: 40, left: 10, child: const CustomArrowBack()),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('lib/assets/images/Logo.webp',
                      width: 50, height: 50),
                  const SizedBox(height: 20),
                  const Text('Verificación de Código',
                      style: AppTextStyles.sectionTitle),
                  const SizedBox(height: 20),
                  const Text(
                    'Por favor, ingresa el código de 4 dígitos que te hemos enviado a tu correo electrónico',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.textDetail,
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    controller: _pinController,
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    decoration: InputDecoration(
                      labelText: 'Código PIN',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: CustomButton(
                      text: 'Enviar',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChangePasswordScreen()));
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
