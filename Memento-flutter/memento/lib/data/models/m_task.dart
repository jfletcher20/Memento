import 'package:memento/data/models/m_task_category.dart';

class Task {
  final int id;
  final String name;
  final DateTime dueDate;
  final TaskCategory category;
  final bool completed;

  const Task({
    this.id = -1,
    required this.name,
    required this.dueDate,
    required this.category,
    this.completed = false,
  });

  Task copyWith({
    int? id,
    String? name,
    DateTime? dueDate,
    TaskCategory? category,
    bool? completed,
  }) {
    return Task(
      id: id ?? this.id,
      name: name ?? this.name,
      dueDate: dueDate ?? this.dueDate,
      category: category ?? this.category,
      completed: completed ?? this.completed,
    );
  }
}

extension SerializableTask on Task {
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "dueDate": dueDate.toIso8601String(),
      "category_id": category.id,
      "completed": completed ? 1 : 0,
    };
  }

  static Task fromMap(Map<String, dynamic> map, TaskCategory category) {
    return Task(
      id: map["id"],
      name: map["name"],
      dueDate: DateTime.parse(map["dueDate"]),
      category: category,
      completed: map["completed"] == 1,
    );
  }
}
