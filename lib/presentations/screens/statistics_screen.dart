import 'package:flutter/material.dart';
import 'package:moneymind/presentations/widgets/pie_chart_card.dart';
import 'package:moneymind/presentations/widgets/total_expenses_grid.dart';
import 'package:moneymind/styles/text_styles.dart';

class StatisticsScreen extends StatefulWidget {
  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  // Datos por defecto (por ejemplo, para 'Semana')
  Map<String, double> chartData = {
    'Hogar': 40,
    'Auto': 20,
    'Viaje': 15,
    'Comida': 15,
    'Educación': 10,
  };

  // Función para actualizar los datos cuando se cambia la selección
  void updateChartData(Map<String, double> newData) {
    setState(() {
      chartData = newData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Gastos', style: AppTextStyles.sectionTitle),
            SizedBox(height: 20),
            PieChartCard(chartData: chartData), // Pasando los datos aquí
            SizedBox(height: 10),
            Text(
              'Gastos Totales',
              style: AppTextStyles.subtitle,
            ),
            SizedBox(height: 10),
            TotalExpensesGrid(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
