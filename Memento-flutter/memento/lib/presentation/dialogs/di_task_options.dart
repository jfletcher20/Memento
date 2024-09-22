import 'package:flutter/material.dart';
import 'package:memento/data/models/m_task.dart';
import 'package:memento/data/u_database.dart';

class TaskOptionsBottomSheet extends StatelessWidget {
  final Task task;
  final bool withPop;
  const TaskOptionsBottomSheet({required this.task, this.withPop = true, super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                DatabaseManager.completeTask(task);
                if (withPop) Navigator.pop(context);
              },
              icon: const Icon(Icons.check),
              label: const Text("Complete"),
            ),
            ElevatedButton.icon(
              onPressed: () {
                DatabaseManager.deleteTask(task);
                if (withPop) Navigator.pop(context);
              },
              icon: const Icon(Icons.delete),
              label: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}
