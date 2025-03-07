import 'package:flutter/material.dart';
import 'package:moneymind/styles/text_styles.dart';

class CategoryDetailBottomSheet extends StatelessWidget {
  final String categoryLabel;
  final List<Map<String, dynamic>> expenses;

  const CategoryDetailBottomSheet(
      {super.key, required this.categoryLabel, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Gastos de la categoría: ',
                style: TextStyle(
                    fontSize: 24, color: Colors.black, fontFamily: 'Poppins'),
                children: [
                  TextSpan(
                    text: categoryLabel,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: expenses.length,
                itemBuilder: (context, index) {
                  final expense = expenses[index];
                  return ListTile(
                    leading: Icon(expense['icon']),
                    title: Text(expense['title'],
                        style: AppTextStyles.textimpDetail),
                    subtitle: Text(
                      'Fecha: ${expense['date']}',
                      style: AppTextStyles.loginIssue,
                    ),
                    trailing: Text(
                      '\$${expense['amount'].toStringAsFixed(2)}',
                      style: AppTextStyles.textminDetail,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
