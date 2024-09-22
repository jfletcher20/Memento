import 'package:memento/data/database/u_db.dart';
import 'package:memento/data/models/m_task_category.dart';
import 'package:memento/data/models/m_task.dart';

import 'package:flutter/material.dart';

class DatabaseManager with ChangeNotifier {
  static final DatabaseManager instance = DatabaseManager._init();
  factory DatabaseManager() {
    return instance;
  }

  DatabaseManager._init();
  Future<void> loadData() async {
    _categories.clear();
    _tasks.clear();
    await DB.getData().then((data) {
      _categories.addAll(data.categories);
      _tasks.addAll(data.tasks);
    });
    registerChanges();
  }

  static void registerChanges() => instance.notifyListeners();

  static List<Task> _tasks = [];
  static final List<TaskCategory> _categories = [];

  static List<Task> get tasks => _tasks..sort((a, b) => a.dueDate.compareTo(b.dueDate));
  static List<TaskCategory> get categories => _categories;

  static void addTask(Task task) async {
    int id = await DB.addTask(task);
    _tasks.add(task.copyWith(id: id));
    registerChanges();
  }

  static void updateTask(Task task) {
    DB.updateTask(task);
    _tasks = _tasks.map((t) => t.id == task.id ? task : t).toList();
    registerChanges();
  }

  static void completeTask(Task task) {
    DB.updateTask(task.copyWith(completed: true));
    _tasks = _tasks.map((t) => t.id == task.id ? task.copyWith(completed: true) : t).toList();
    registerChanges();
  }

  static void deleteTask(Task task) {
    DB.deleteTask(task);
    _tasks.removeWhere((t) => t.id == task.id);
    registerChanges();
  }
}
