import 'package:flutter/material.dart';
import 'package:moneymind/presentations/screens/welcome_screen.dart';
import 'package:moneymind/presentations/screens/login_screen.dart'; // Asegúrate de crear esta pantalla
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi App',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.green),
      home: const SplashScreen(), // Uso de SplashScreen público
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() =>
      SplashScreenState(); // Referencia a SplashScreenState público
}

class SplashScreenState extends State<SplashScreen> {
  // Clase renombrada para ser pública
  @override
  void initState() {
    super.initState();
    _checkIfFirstTime();
  }

  // Verifica si es la primera vez que el usuario abre la app
  Future<void> _checkIfFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (mounted) {
      // Verifica si el widget sigue montado
      if (isFirstTime) {
        // Si es la primera vez, muestra la pantalla de bienvenida
        prefs.setBool('isFirstTime', false);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const WelcomeScreen()),
        );
      } else {
        // Si ya no es la primera vez, muestra la pantalla de login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Indicador de carga
      ),
    );
  }
}
