import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:moneymind/presentations/screens/expenses_detail_screen.dart';

class PieChartCard extends StatefulWidget {
  final Map<String, double> chartData;

  PieChartCard({required this.chartData});

  @override
  _PieChartCardState createState() => _PieChartCardState();
}

class _PieChartCardState extends State<PieChartCard> {
  late Map<String, double> chartData;

  @override
  void initState() {
    super.initState();
    chartData = widget.chartData;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Color(0xffFBFBF7),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                  height: 180, width: 180, child: _buildPieChart(chartData)),
              SizedBox(
                height: 100,
                width: 130,
                child: _buildLegend(chartData),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          TimeFilterButtons(
            onChanged: (Map<String, double> newData) {
              setState(() {
                chartData = newData;
              });
            },
          ),
          SizedBox(
            height: 10,
          ),
          DetailButton(
              onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ExpenseDetailsScreen()))
                  }),
        ]),
      ),
    );
  }

  Widget _buildPieChart(Map<String, double> chartData) {
    return PieChart(
      PieChartData(
          sections: chartData.entries.map((entry) {
            return PieChartSectionData(
              color: _getColorForCategory(entry.key),
              value: entry.value,
              title: '',
            );
          }).toList(),
          centerSpaceRadius: 50,
          sectionsSpace: 0),
    );
  }

  Widget _buildLegend(Map<String, double> chartData) {
    return Column(
      children: chartData.entries.map((entry) {
        return _legendItem(
            entry.key, _getColorForCategory(entry.key), entry.value);
      }).toList(),
    );
  }

  Color _getColorForCategory(String category) {
    switch (category) {
      case 'Hogar':
        return Colors.red;
      case 'Auto':
        return Colors.blue;
      case 'Viaje':
        return Colors.orange;
      case 'Comida':
        return Colors.green;
      case 'Educación':
        return Colors.yellow;
      default:
        return Colors.grey;
    }
  }

  Widget _legendItem(String text, Color color, double percentage) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
        Text(
          '${percentage.toStringAsFixed(0)}%',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}

class TimeFilterButtons extends StatefulWidget {
  final ValueChanged<Map<String, double>> onChanged;

  const TimeFilterButtons({required this.onChanged});

  @override
  _TimeFilterButtonsState createState() => _TimeFilterButtonsState();
}

class _TimeFilterButtonsState extends State<TimeFilterButtons> {
  int selectedIndex = 0; // 0: Semana, 1: Mes, 2: Año

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: ['Semana', 'Mes', 'Año'].asMap().entries.map((entry) {
        int idx = entry.key;
        String label = entry.value;
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: ChoiceChip(
              selectedShadowColor: Colors.transparent,
              label: Center(child: Text(label)),
              selected: selectedIndex == idx,
              labelStyle: TextStyle(
                color: selectedIndex == idx ? Color(0xff3498DB) : Colors.black,
                fontFamily: 'Poppins',
              ),
              showCheckmark: false,
              backgroundColor: Color(0xffFBFBF7),
              selectedColor: Color(0x333498DB),
              onSelected: (bool selected) {
                setState(() {
                  selectedIndex = idx;
                });
                widget.onChanged(getChartData()); // Enviar datos actualizados
              },
            ),
          ),
        );
      }).toList(),
    );
  }

  // Obtén los datos dependiendo de la selección
  Map<String, double> getChartData() {
    switch (selectedIndex) {
      case 0: // Semana
        return {
          'Hogar': 40,
          'Auto': 20,
          'Viaje': 15,
          'Comida': 15,
          'Educación': 10,
        };
      case 1: // Mes
        return {
          'Hogar': 38,
          'Auto': 27,
          'Viaje': 18,
        };
      case 2: // Año
        return {
          'Hogar': 30,
          'Auto': 25,
          'Viaje': 20,
          'Comida': 15,
          'Educación': 10,
        };
      default:
        return {};
    }
  }
}

class DetailButton extends StatelessWidget {
  final VoidCallback onPressed;

  const DetailButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0x222ECC71),
              shadowColor: Colors.transparent,
              // Sin sombra
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Color(0xFF2ECC71)), // Borde verde
              ),
            ),
            child: Text(
              'Ver detalle completo',
              style: TextStyle(
                  color: Color(0xFF2ECC71),
                  fontFamily: 'Poppins'), // Texto verde
            ),
          )),
    );
  }
}
