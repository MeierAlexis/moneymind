import 'package:flutter/material.dart';
import 'package:moneymind/presentations/widgets/category_detail_bottom_sheet.dart';
import 'package:moneymind/styles/text_styles.dart';

void _showCategoryDetail(BuildContext context, String categoryLabel,
    List<Map<String, dynamic>> expenses) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => CategoryDetailBottomSheet(
        categoryLabel: categoryLabel, expenses: expenses),
  );
}

class CategoryList extends StatelessWidget {
  CategoryList({super.key});

  final List<Map<String, dynamic>> categories = const [
    {
      'emoji': {'android': '🏠', 'ios': '🏡'},
      'label': 'Hogar'
    },
    {
      'emoji': {'android': '🚗', 'ios': '🚙'},
      'label': 'Auto'
    },
    {
      'emoji': {'android': '🎓', 'ios': '📚'},
      'label': 'Educación'
    },
    {
      'emoji': {'android': '🎮', 'ios': '🕹️'},
      'label': 'Juegos'
    },
    {
      'emoji': {'android': '🍔', 'ios': '🍏'},
      'label': 'Comida'
    },
    {
      'emoji': {'android': '💻', 'ios': '🖥️'},
      'label': 'Tecnología'
    }
  ];

  // Ejemplo de gastos para cada categoría
  final Map<String, List<Map<String, dynamic>>> expensesByCategory = {
    'Hogar': [
      {
        'title': 'Supermercado',
        'amount': 12000.50,
        'date': '05 Mar 2025',
        'icon': Icons.shopping_cart
      },
      {
        'title': 'Alquiler',
        'amount': 25000.00,
        'date': '01 Mar 2025',
        'icon': Icons.house
      },
    ],
    'Auto': [
      {
        'title': 'Gasolina',
        'amount': 8500.75,
        'date': '04 Mar 2025',
        'icon': Icons.local_gas_station
      },
    ],
    'Educación': [
      {
        'title': 'Libros',
        'amount': 3000.00,
        'date': '01 Mar 2025',
        'icon': Icons.book
      },
    ],
    'Juegos': [
      {
        'title': 'Compra de videojuego',
        'amount': 5000.00,
        'date': '28 Feb 2025',
        'icon': Icons.videogame_asset
      },
    ],
    'Comida': [
      {
        'title': 'Cena con amigos',
        'amount': 9500.00,
        'date': '03 Mar 2025',
        'icon': Icons.restaurant
      },
    ],
    'Tecnología': [
      {
        'title': 'Compra de laptop',
        'amount': 15000.00,
        'date': '27 Feb 2025',
        'icon': Icons.computer
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Categorías',
          style: AppTextStyles.sectionTitle,
        ),
        const SizedBox(height: 12),
        SizedBox(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories
                  .map((category) => _buildCategoryItem(context, category))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryItem(
      BuildContext context, Map<String, dynamic> category) {
    final bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    final String emoji =
        isIOS ? category['emoji']['ios'] : category['emoji']['android'];

    return GestureDetector(
      onTap: () {
        // Pasa los gastos de la categoría seleccionada
        final categoryLabel = category['label'];
        final expenses = expensesByCategory[categoryLabel] ?? [];
        _showCategoryDetail(context, categoryLabel, expenses);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 2),
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                    blurRadius: 3,
                    spreadRadius: 0.5,
                  )
                ],
              ),
              child: Text(
                emoji,
                style: const TextStyle(fontSize: 32),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              category['label'],
              style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w800,
                fontSize: 12,
                fontFamily: 'Montserrat',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
