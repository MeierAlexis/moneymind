import 'package:flutter/material.dart';
import 'package:moneymind/presentations/widgets/balance_card.dart';
import 'package:moneymind/presentations/widgets/category_list.dart';
import 'package:moneymind/presentations/widgets/top_expenses.dart';
import 'package:moneymind/styles/text_styles.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
                const Text('Hola,', style: AppTextStyles.homeWelcome),
                const Text('Alexis Meier!',
                    style: AppTextStyles.homeWelcomeName),
                SizedBox(height: 20),
                BalanceCard(income: 3000.0, expense: 2000.0),
                SizedBox(height: 30),
                CategoryList(),
                SizedBox(height: 30),
                TopExpenses(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
