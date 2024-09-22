import 'package:memento/data/models/m_task_category.dart';

import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final TaskCategory category;
  const CategoryWidget({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.circular(4.0),
      ),
      width: 48,
      height: 36,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(category.name, style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
