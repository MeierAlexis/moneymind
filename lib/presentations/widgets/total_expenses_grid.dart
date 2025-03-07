import 'package:flutter/material.dart';
import 'package:moneymind/styles/text_styles.dart';

class TotalExpensesGrid extends StatelessWidget {
  final List<Map<String, dynamic>> expenses = [
    {'category': 'Hogar', 'amount': 200, 'emoji': '🏡'},
    {'category': 'Educación', 'amount': 1200, 'emoji': '📚'},
    {'category': 'Auto', 'amount': 600.31, 'emoji': '🚗'},
    {'category': 'Juegos', 'amount': 500, 'emoji': '🎮'},
    {'category': 'Tecnología', 'amount': 1300, 'emoji': '💻'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,

      // Limitar la altura para 2 filas
      child: GridView.builder(
        scrollDirection: Axis.horizontal, // Desplazamiento horizontal
        shrinkWrap: true,
        itemCount: expenses.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 elementos por fila
          childAspectRatio: 0.7, // Relación de aspecto para el tamaño del grid
        ),
        itemBuilder: (context, index) {
          final expense = expenses[index];
          return Card(
            color: Color(0xffFBFBF7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(expense['category'],
                          style: AppTextStyles.textDetail),
                      Text(
                        (expense['emoji']),
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    '\$${expense['amount']}',
                    style: AppTextStyles.bigTextImportant,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
