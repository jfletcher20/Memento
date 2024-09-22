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
        subtitle: Text(formattedDate, style: dateStyle),
        leading: CategoryWidget(category: task.category),
      ),
    );
  }

  TextStyle? get dateStyle {
    return task.dueDate.isBefore(DateTime.now()) && !task.completed
        ? const TextStyle(color: Colors.red)
        : null;
  }

  // format in form: "hh:mm dd.mm.yyyy."
  String get formattedDate {
    return "${task.dueDate.hour}:${task.dueDate.minute} "
        "${task.dueDate.day}.${task.dueDate.month}.${task.dueDate.year}.";
  }
}
