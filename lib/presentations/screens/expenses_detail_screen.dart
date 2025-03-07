import 'package:flutter/material.dart';
import 'package:moneymind/styles/text_styles.dart';

class ExpenseDetailsScreen extends StatefulWidget {
  @override
  _ExpenseDetailsScreenState createState() => _ExpenseDetailsScreenState();
}

class _ExpenseDetailsScreenState extends State<ExpenseDetailsScreen> {
  String selectedFilter = 'Todos';

  final List<Map<String, dynamic>> expenses = [
    {
      'date': '5 Mar',
      'category': 'Comida',
      'icon': '🍕',
      'amount': 25.00,
      'description': 'Cena en restaurante'
    },
    {
      'date': '6 Mar',
      'category': 'Transporte',
      'icon': '🚕',
      'amount': 12.50,
      'description': 'Taxi al trabajo'
    },
    {
      'date': '7 Mar',
      'category': 'Educación',
      'icon': '📚',
      'amount': 50.00,
      'description': 'Compra de libros'
    },
    {
      'date': '8 Mar',
      'category': 'Entretenimiento',
      'icon': '🎮',
      'amount': 30.00,
      'description': 'Suscripción a videojuegos'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalle de Gastos')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _buildSummaryCard(),
            SizedBox(height: 16),
            _buildFilterDropdown(),
            Expanded(child: _buildExpenseList()),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard() {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 3,
        color: Color(0xffFBFBF7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Resumen', style: AppTextStyles.subtitle),
              SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Total Gastado: ',
                      style: AppTextStyles.textimpDetail,
                    ),
                    TextSpan(
                      text:
                          '\$${expenses.fold(0.0, (sum, item) => sum + item['amount']).toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Montserrat',
                          color: Color(
                              0xff3498DB)), // Aquí se cambia el color a azul
                    ),
                  ],
                ),
              ),
              Text('Categoría con más gasto: Comida 🍕',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterDropdown() {
    return DropdownButton<String>(
      value: selectedFilter,
      iconSize: 20,
      iconEnabledColor: Colors.green,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        fontFamily: 'Poppins',
      ),
      dropdownColor: Color(0xffFBFBF7),
      items: ['Todos', 'Comida', 'Transporte', 'Educación', 'Entretenimiento']
          .map((category) =>
              DropdownMenuItem(value: category, child: Text(category)))
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedFilter = value!;
        });
      },
    );
  }

  Widget _buildExpenseList() {
    List<Map<String, dynamic>> filteredExpenses = selectedFilter == 'Todos'
        ? expenses
        : expenses.where((item) => item['category'] == selectedFilter).toList();

    return ListView.builder(
      itemCount: filteredExpenses.length,
      itemBuilder: (context, index) {
        final expense = filteredExpenses[index];
        return Card(
          color: Color(0xffFBFBF7),
          child: ListTile(
            leading: Text(expense['icon'], style: TextStyle(fontSize: 24)),
            title: Text(
              expense['description'],
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Colors.black,
                fontFamily: 'Montserrat',
              ),
            ), // Ahora muestra la descripción
            subtitle: Text(
              expense['date'],
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Color(0x99666666),
                fontFamily: 'Montserrat',
              ),
            ),
            trailing: Text('\$${expense['amount']}',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontFamily: 'Montserrat')),
          ),
        );
      },
    );
  }
}
