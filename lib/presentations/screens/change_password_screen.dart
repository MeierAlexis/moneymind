import 'package:flutter/material.dart';
import 'package:moneymind/presentations/screens/login_screen.dart';
import 'package:moneymind/presentations/widgets/custom_arrow_back.dart';
import 'package:moneymind/presentations/widgets/custom_button.dart';
import 'package:moneymind/presentations/widgets/custom_input_field.dart';
import 'package:moneymind/styles/text_styles.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          const Positioned(top: 40, left: 10, child: CustomArrowBack()),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('lib/assets/images/Logo.webp', height: 40),
                    const SizedBox(height: 20),
                    const Text(
                      'Cambiar contraseña',
                      style: AppTextStyles.sectionTitle,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Tu nueva contraseña debe ser distinta a la anterior y debe contener al menos una mayúscula, una minúscula, un número y un carácter especial.',
                      style: AppTextStyles.textDetail,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    CustomInputField(
                      label: 'Nueva Contraseña',
                      hint: 'Nueva Contraseña',
                      isPassword: true,
                      controller: passwordController,
                    ),
                    CustomInputField(
                      label: 'Confirmar Contraseña',
                      hint: 'Confirmar Contraseña',
                      isPassword: true,
                      controller: confirmPasswordController,
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      text: 'Guardar',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
