import 'package:flutter/material.dart';
import 'package:moneymind/presentations/widgets/custom_arrow_back.dart';
import 'package:moneymind/presentations/widgets/custom_button.dart';
import 'package:moneymind/presentations/widgets/custom_input_field.dart';
import 'package:moneymind/presentations/widgets/custom_text_link.dart';
import 'package:moneymind/styles/text_styles.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            'lib/assets/images/BackgroundAuth.jpg',
            fit: BoxFit.cover,
          )),
          Positioned(top: 40, left: 10, child: CustomArrowBack()),
          Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image(
                image: AssetImage('lib/assets/images/Logo.webp'),
                width: 50,
                height: 50,
              ),
              SizedBox(height: 20),
              Text('Registro', style: AppTextStyles.sectionTitle),
              SizedBox(height: 20),
              CustomInputField(
                  label: 'Nombre',
                  hint: 'Nombre',
                  icon: Icon(Icons.star, color: Colors.grey.shade500),
                  controller: TextEditingController()),
              CustomInputField(
                  label: 'Email',
                  hint: 'Email',
                  controller: TextEditingController()),
              CustomInputField(
                  label: 'Nombre de usuario',
                  hint: 'Nombre de usuario',
                  icon: Icon(Icons.person, color: Colors.grey.shade500),
                  controller: TextEditingController()),
              CustomInputField(
                  label: 'Contraseña',
                  hint: 'Contraseña',
                  controller: TextEditingController(),
                  isPassword: true),
              CustomInputField(
                  label: 'Confirmar Contraseña',
                  hint: 'Confirmar Contraseña',
                  controller: TextEditingController(),
                  isPassword: true),
              SizedBox(height: 20),
              CustomButton(
                text: 'Registrarme',
                onPressed: () {},
                padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 15.0),
                fontSize: 18,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '¿Ya tienes una cuenta? ',
                    style: AppTextStyles.loginIssue,
                  ),
                  CustomTextLink(
                    text: 'Iniciar Sesión',
                    onTap: () {
                      Navigator.pop(context);
                    },
                    style: AppTextStyles.loginIssueAction,
                  )
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
