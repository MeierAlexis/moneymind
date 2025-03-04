import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  static const Color backgroundColor = Colors.white;
  static const Color selectedColor = Color(0xFF2ECC71);
  static const Color unselectedColor = Color(0xFFAAAAAA);

  static const TextStyle selectedTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: selectedColor,
    fontFamily: 'Poppins',
  );

  static const TextStyle unselectedTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: unselectedColor,
    fontFamily: 'Poppins',
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12, // Sombra más suave
            blurRadius: 5, // Difuminado de la sombra
            spreadRadius: 1, // Extensión de la sombra
            offset: Offset(0, 0), // Dirección de la sombra (hacia arriba)
          ),
        ],
      ),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: backgroundColor,
        elevation: 0, // Evita sombra por defecto del BottomAppBar
        child: SizedBox(
          height: 60, // Evita overflow asegurando que tenga altura suficiente
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, 'Inicio', 0),
              _buildNavItem(Icons.bar_chart, 'Estadísticas', 1),
              const SizedBox(width: 50), // Espacio para el FloatingActionButton
              _buildNavItem(Icons.chat, 'Chat', 2),
              _buildNavItem(Icons.settings, 'Configuración', 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final bool isSelected = index == currentIndex;
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? selectedColor : unselectedColor),
          Text(label,
              style: isSelected ? selectedTextStyle : unselectedTextStyle),
        ],
      ),
    );
  }
}
