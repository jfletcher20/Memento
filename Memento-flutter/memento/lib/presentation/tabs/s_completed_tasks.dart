import 'package:memento/presentation/widgets/w_task_card.dart';
import 'package:memento/data/models/m_task.dart';
import 'package:memento/data/u_mock.dart';

import 'package:flutter/material.dart';

class CompletedTasksScreen extends StatefulWidget {
  const CompletedTasksScreen({super.key});

  @override
  State<CompletedTasksScreen> createState() => _CompletedTasksScreenState();
}

class _CompletedTasksScreenState extends State<CompletedTasksScreen> {
  List<Task> get tasks => Mock.tasks.where((task) => task.completed).toList();
  @override
  Widget build(BuildContext context) {
    return tasks.isEmpty ? noTasks : tasksList;
  }

  Widget get noTasks {
    return Center(
      child: Text("No pending tasks! 🎉", style: Theme.of(context).textTheme.titleLarge),
    );
  }

  Widget get tasksList {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskCardWidget(task: tasks[index]);
      },
    );
  }
}
