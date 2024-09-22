import 'package:memento/presentation/widgets/w_task_card.dart';
import 'package:memento/data/models/m_task.dart';
import 'package:memento/data/u_database.dart';

import 'package:flutter/material.dart';

class PendingTasksScreen extends StatefulWidget {
  const PendingTasksScreen({super.key});

  @override
  State<PendingTasksScreen> createState() => _PendingTasksScreenState();
}

class _PendingTasksScreenState extends State<PendingTasksScreen> {
  List<Task> get tasks => DatabaseManager.tasks.where((task) => !task.completed).toList();

  void refresh() => setState(() {});

  @override
  void initState() {
    super.initState();
    DatabaseManager.instance.addListener(refresh);
  }

  @override
  void dispose() {
    DatabaseManager.instance.removeListener(refresh);
    super.dispose();
  }

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
      itemBuilder: (context, index) => TaskCardWidget(
        task: tasks[index],
        tappable: true,
      ),
    );
  }
}
