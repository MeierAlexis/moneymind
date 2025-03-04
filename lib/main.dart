import 'package:flutter/material.dart';
import 'package:moneymind/presentations/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta la etiqueta "Debug"
      title: 'Mi App', // Agrega un título a la app
      theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors
              .green), //color de paleta, genera una paleta de color en base a uno

      home: const WelcomeScreen(),
    );
  }
}
