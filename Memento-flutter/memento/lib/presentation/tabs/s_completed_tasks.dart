import 'package:memento/presentation/widgets/w_task_card.dart';
import 'package:memento/data/models/m_task.dart';
import 'package:memento/data/u_database.dart';

import 'package:flutter/material.dart';

class CompletedTasksScreen extends StatefulWidget {
  const CompletedTasksScreen({super.key});

  @override
  State<CompletedTasksScreen> createState() => _CompletedTasksScreenState();
}

class _CompletedTasksScreenState extends State<CompletedTasksScreen> {
  List<Task> get tasks => DatabaseManager.tasks.where((task) => task.completed).toList();

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
      child: Text("No completed tasks.", style: Theme.of(context).textTheme.titleLarge),
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
