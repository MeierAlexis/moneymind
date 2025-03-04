import 'package:flutter/material.dart';

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back), // Icono de flecha hacia atrás
      onPressed: () {
        Navigator.pop(context); // Acción para volver atrás en la navegación
      },
    );
  }
}
