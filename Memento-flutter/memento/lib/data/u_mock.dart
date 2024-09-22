import 'package:memento/data/models/m_task_category.dart';
import 'package:memento/data/models/m_task.dart';

import 'package:flutter/material.dart';

class Mock with ChangeNotifier {
  static final Mock instance = Mock._init();
  factory Mock() {
    return instance;
  }

  Mock._init();

  static void registerChanges() => instance.notifyListeners();

  static final List<Task> _tasks = [
    Task(
      name: "Write seminar",
      dueDate: DateTime.now().subtract(const Duration(days: 1)),
      category: categories[0],
    ),
    Task(
      name: "Prepare for lab exercises",
      dueDate: DateTime.now().add(const Duration(days: 2)),
      category: categories[1],
    ),
    Task(
      name: "Set up environment",
      dueDate: DateTime.now().add(const Duration(days: 3)),
      category: categories[2],
    ),
    Task(
      name: "Gather a team",
      dueDate: DateTime.now().subtract(const Duration(days: 3)),
      category: categories[0],
      completed: true,
    ),
  ];

  static List<Task> get tasks => _tasks..sort((a, b) => a.dueDate.compareTo(b.dueDate));
  static void addTask(Task task) {
    _tasks.add(task);
    registerChanges();
  }

  static List<TaskCategory> get categories {
    return const [
      TaskCategory(name: "RAMPU", color: Colors.blue),
      TaskCategory(name: "RPP", color: Colors.orange),
      TaskCategory(name: "RWA", color: Colors.red),
    ];
  }
}
