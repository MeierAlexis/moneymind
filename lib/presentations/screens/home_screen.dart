import 'package:flutter/material.dart';
import 'package:moneymind/presentations/screens/home_content.dart';
import 'package:moneymind/presentations/screens/statistics_screen.dart';
import 'package:moneymind/presentations/widgets/custom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Lista de pantallas según el índice seleccionado
  final List<Widget> _screens = [
    HomeContent(), // Pantalla principal (contenido de HomeScreen)
    StatisticsScreen(),
    ChatScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Muestra la pantalla seleccionada
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Acción del botón "+"
        },
        shape: CircleBorder(),
        backgroundColor: Color(0xFF2ECC71),
        elevation: 5,
        child: Icon(
          Icons.add,
          size: 25,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Chat', style: TextStyle(fontSize: 24)));
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Configuración', style: TextStyle(fontSize: 24)));
  }
}
