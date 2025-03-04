import 'package:flutter/material.dart';
import 'package:moneymind/presentations/screens/forgot_password_screen.dart';
import 'package:moneymind/presentations/screens/home_screen.dart';
import 'package:moneymind/presentations/screens/register_screen.dart';
import 'package:moneymind/presentations/widgets/custom_arrow_back.dart';
import 'package:moneymind/presentations/widgets/custom_button.dart';
import 'package:moneymind/presentations/widgets/custom_input_field.dart';
import 'package:moneymind/presentations/widgets/custom_text_link.dart';
import 'package:moneymind/styles/text_styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.asset(
              'lib/assets/images/BackgroundAuth.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(top: 40, left: 10, child: CustomArrowBack()),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // 🔹 Logo y título
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'lib/assets/images/Logo.webp',
                          width: 50,
                          height: 50,
                        ),
                        const SizedBox(height: 20),
                        const Text('Inicio Sesión',
                            style: AppTextStyles.sectionTitle),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // 🔹 Formulario de inicio de sesión
                    Column(
                      children: [
                        CustomInputField(
                            label: 'Email',
                            hint: 'Email o Usuario',
                            controller: TextEditingController()),
                        const SizedBox(height: 10),
                        CustomInputField(
                            label: 'Contraseña',
                            hint: 'Contraseña',
                            controller: TextEditingController(),
                            isPassword: true),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: CustomTextLink(
                              text: '¿Olvidaste tu contraseña?',
                              style: AppTextStyles.loginIssue,
                              onTap: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgotPasswordScreen()))
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                          text: 'Iniciar Sesión',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          },
                          fontSize: 18.0,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 80.0),
                        ),
                        const SizedBox(height: 15),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '¿No tienes una cuenta? ',
                                style: AppTextStyles.loginIssue,
                              ),
                              WidgetSpan(
                                child: CustomTextLink(
                                  text: 'Registrate',
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterScreen(),
                                        ));
                                  },
                                  style: AppTextStyles.loginIssueAction,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),

                    // 🔹 Separador visual
                    const SizedBox(height: 40.0),

                    // 🔹 Métodos alternativos de inicio de sesión
                    Column(
                      children: [
                        CustomButton(
                          text: 'Continuar con Google',
                          onPressed: () {},
                          backgroundColor: Colors.white,
                          textColor: const Color(0xaa000000),
                          imagePath: 'lib/assets/images/GoogleLogo.png',
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 50.0),
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                          text: 'Continuar con Meta',
                          imagePath: 'lib/assets/images/MetaLogo.png',
                          onPressed: () {},
                          backgroundColor: const Color(0xff0064E0),
                          textColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 50.0),
                        ),
                      ],
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
