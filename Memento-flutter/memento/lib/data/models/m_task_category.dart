import 'dart:ui';

class TaskCategory {
  final int id;
  final String name;
  final Color color;

  const TaskCategory({this.id = -1, required this.name, required this.color});
}

extension SerializableTaskCategory on TaskCategory {
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "color": color.value.toRadixString(16),
    };
  }

  static TaskCategory fromMap(Map<String, dynamic> map) {
    return TaskCategory(
      id: map["id"],
      name: map["name"],
      color: Color(int.parse(map["color"], radix: 16)),
    );
  }
}
