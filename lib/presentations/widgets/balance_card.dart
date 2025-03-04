import 'package:flutter/material.dart';
import 'package:moneymind/styles/text_styles.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(128, 128, 128, 0.3), // ✅ Mejor sombreado
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
          const Text(
            '+\$5,000.00',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xff2ECC71),
              fontFamily: 'Montserrat',
            ),
          ),
          const SizedBox(height: 16), // 🔹 Espaciado más uniforme

          // INGRESOS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.circle, size: 10, color: Color(0xff2ECC71)),
                  SizedBox(width: 6), // 🔹 Espaciado más preciso
                  Text(
                    'Ingresos',
                    style: AppTextStyles.textminDetail,
                  ),
                ],
              ),
              const Text(
                '\$3,500.00',
                style: TextStyle(
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
                  SizedBox(width: 6), // 🔹 Espaciado más preciso
                  Text(
                    'Gastos',
                    style: AppTextStyles.textminDetail,
                  ),
                ],
              ),
              const Text(
                '\$5,400.00',
                style: TextStyle(
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
