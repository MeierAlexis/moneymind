import 'package:flutter/material.dart';
import 'package:moneymind/styles/text_styles.dart';

class BalanceCard extends StatelessWidget {
  final double income;
  final double expense;

  const BalanceCard({
    super.key,
    required this.income,
    required this.expense,
  });

  @override
  Widget build(BuildContext context) {
    final double balance = income - expense; // ✅ Cálculo dinámico del balance
    final bool isPositive = balance >= 0;

    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(128, 128, 128, 0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Balance Mensual', style: AppTextStyles.textDetail),
          const SizedBox(height: 8),

          // ✅ Balance dinámico con color y signo adecuados
          Text(
            '${isPositive ? "+" : ""}\$${balance.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: isPositive ? const Color(0xff2ECC71) : Colors.red,
              fontFamily: 'Montserrat',
            ),
          ),

          const SizedBox(height: 16),

          // INGRESOS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.circle, size: 10, color: Color(0xff2ECC71)),
                  SizedBox(width: 6),
                  Text('Ingresos', style: AppTextStyles.textminDetail),
                ],
              ),
              Text(
                '\$${income.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // GASTOS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.circle, size: 10, color: Color(0xff3498DB)),
                  SizedBox(width: 6),
                  Text('Gastos', style: AppTextStyles.textminDetail),
                ],
              ),
              Text(
                '\$${expense.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
