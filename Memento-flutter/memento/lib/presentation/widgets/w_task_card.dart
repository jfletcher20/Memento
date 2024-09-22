import 'package:memento/presentation/dialogs/di_task_options.dart';
import 'package:memento/presentation/widgets/w_category.dart';
import 'package:memento/data/models/m_task.dart';

import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  final Task task;
  final bool tappable;
  const TaskCardWidget({required this.task, this.tappable = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: tappable ? () => onTap(context) : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
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

  void onTap(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => TaskOptionsBottomSheet(task: task),
    );
  }
}

// format in form: "hh:mm dd.MM.yyyy."
extension CroatianDateFormat on DateTime {
  String get formattedDate => "$hour:$minute $day.$month.$year.";
}
