import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moneymind/styles/text_styles.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisSize:
            MainAxisSize.min, // <-- Esto evita que la Column crezca demasiado
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
    );
  }
}
