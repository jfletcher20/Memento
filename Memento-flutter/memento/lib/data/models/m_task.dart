import 'package:memento/data/models/m_task_category.dart';

class Task {
  final String name;
  final DateTime dueDate;
  final TaskCategory category;
  final bool completed;

  const Task({
    required this.name,
    required this.dueDate,
    required this.category,
    this.completed = false,
  });

  Task copyWith({
    String? name,
    DateTime? dueDate,
    TaskCategory? category,
    bool? completed,
  }) {
    return Task(
      name: name ?? this.name,
      dueDate: dueDate ?? this.dueDate,
      category: category ?? this.category,
      completed: completed ?? this.completed,
    );
  }
}
