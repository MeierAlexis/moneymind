import 'package:flutter/material.dart';
import 'package:moneymind/styles/text_styles.dart';

class TopExpenses extends StatelessWidget {
  TopExpenses({super.key});

  final List<Map<String, dynamic>> expenses = [
    {
      'emoji': {'android': '🏠', 'ios': '🏡'},
      'title': 'Lavarropas Sam...',
      'category': 'Hogar',
      'amount': '-\$300',
      'date': '28/04'
    },
    {
      'emoji': {'android': '🚗', 'ios': '🚙'},
      'title': 'Parabrisas',
      'category': 'Auto',
      'amount': '-\$200',
      'date': '30/04' // ❌ Fecha corregida (31/04 no existe)
    },
    {
      'emoji': {'android': '🎮', 'ios': '🎮'},
      'title': 'Monopoly',
      'category': 'Juegos',
      'amount': '-\$80',
      'date': '30/04'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Top Gastos', style: AppTextStyles.sectionTitle),
        ...expenses.map((expense) => _buildExpenseItem(expense)),
      ],
    );
  }

  Widget _buildExpenseItem(Map<String, dynamic> expense) {
    String platformEmoji = expense['emoji']['android']; // Usa 'ios' si es iOS

    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(128, 128, 128, 0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ]),
        child: Center(
          // Agrega un Center para alinear el emoji
          child: Text(
            platformEmoji,
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
      title: Text(expense['title'], style: AppTextStyles.textimpDetail),
      subtitle: Text(expense['category'],
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0x99666666),
              fontFamily: 'Montserrat')),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(expense['amount'],
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff3498DB),
                  fontFamily: 'Montserrat')),
          Text(expense['date'],
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Color(0x99666666),
                fontFamily: 'Montserrat',
              )),
        ],
      ),
    );
  }
}
