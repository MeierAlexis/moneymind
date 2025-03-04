import 'package:flutter/material.dart';
import 'package:moneymind/presentations/widgets/balance_card.dart';
import 'package:moneymind/presentations/widgets/category_list.dart';
import 'package:moneymind/presentations/widgets/custom_nav_bar.dart';
import 'package:moneymind/presentations/widgets/top_expenses.dart';
import 'package:moneymind/styles/text_styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Imagen de fondo ocupando toda la pantalla
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/HomeScreenBackground.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// Contenido sobre la imagen de fondo
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text(
                      'Hola,',
                      style: AppTextStyles.homeWelcome,
                    ),
                    const Text('Alexis Meier!',
                        style: AppTextStyles.homeWelcomeName),
                    SizedBox(height: 20),
                    BalanceCard(),
                    SizedBox(height: 30),
                    CategoryList(),
                    SizedBox(height: 30),
                    TopExpenses(),
                  ],
                ),
              )),
        ],
      ),
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
