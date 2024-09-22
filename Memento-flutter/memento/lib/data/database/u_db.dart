import 'package:flutter/material.dart';
import 'package:memento/data/models/m_task.dart';
import 'package:memento/data/models/m_task_category.dart';
import 'package:sqflite/sqflite.dart';

abstract class DB {
  static late Database db;
  static String dbName = "memento.db";
  static Future<void> init() async {
    db = await openDatabase([await getDatabasesPath(), dbName].join(""), version: 1,
        onCreate: (Database db, int version) async {
      String taskCategoriesTable = "CREATE TABLE task_categories ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "name TEXT NOT NULL,"
          "color TEXT NOT NULL"
          ")";
      String tasksTable = "CREATE TABLE tasks ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "category_id INTEGER NOT NULL,"
          "name TEXT NOT NULL,"
          "dueDate TEXT NOT NULL,"
          "completed INTEGER NOT NULL"
          ")";
      await db.execute(taskCategoriesTable);
      await db.execute(tasksTable);
      db.insert("task_categories", {"name": "RAMPU", "color": Colors.blue.value.toRadixString(16)});
      db.insert("task_categories", {"name": "RPP", "color": Colors.orange.value.toRadixString(16)});
      db.insert("task_categories", {"name": "RWA", "color": Colors.red.value.toRadixString(16)});
    });
  }

  static Future<int> addTask(Task task) {
    return db.insert("tasks", {
      "category_id": task.category.id,
      "name": task.name,
      "dueDate": task.dueDate.toIso8601String(),
      "completed": task.completed ? 1 : 0
    });
  }

  static Future<int> updateTask(Task task) {
    return db.update(
      "tasks",
      {
        "category_id": task.category.id,
        "name": task.name,
        "dueDate": task.dueDate.toIso8601String(),
        "completed": task.completed ? 1 : 0
      },
      where: "id = ?",
      whereArgs: [task.id],
    );
  }

  static Future<int> deleteTask(Task task) {
    return db.delete("tasks", where: "id = ?", whereArgs: [task.id]);
  }

  static Future<({List<Task> tasks, List<TaskCategory> categories})> getData() async {
    List<Map<String, dynamic>> tasks = await db.query("tasks");
    List<Map<String, dynamic>> categories = await db.query("task_categories");
    List<TaskCategory> taskCategories =
        categories.map((category) => SerializableTaskCategory.fromMap(category)).toList();
    List<Task> taskList = tasks.map((task) {
      TaskCategory category =
          taskCategories.firstWhere((category) => category.id == task["category_id"]);
      return SerializableTask.fromMap(task, category);
    }).toList();
    return (tasks: taskList, categories: taskCategories);
  }
}
