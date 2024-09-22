import 'package:memento/presentation/widgets/w_category.dart';
import 'package:memento/data/models/m_task.dart';

import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  final Task task;
  const TaskCardWidget({required this.task, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(task.name),
        subtitle: Text(task.dueDate.formattedDate, style: dateStyle),
        leading: CategoryWidget(category: task.category),
      ),
    );
  }

  TextStyle? get dateStyle {
    return task.dueDate.isBefore(DateTime.now()) && !task.completed
        ? const TextStyle(color: Colors.red)
        : null;
  }
}

// format in form: "hh:mm dd.MM.yyyy."
extension CroatianDateFormat on DateTime {
  String get formattedDate => "$hour:$minute $day.$month.$year.";
}
