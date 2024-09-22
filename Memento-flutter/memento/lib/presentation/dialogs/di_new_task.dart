import 'package:memento/data/models/m_task_category.dart';
import 'package:memento/presentation/widgets/w_task_card.dart';
import 'package:memento/data/models/m_task.dart';
import 'package:memento/data/u_database.dart';

import 'package:flutter/material.dart';

class NewTaskDialog extends StatefulWidget {
  const NewTaskDialog({super.key});

  @override
  State<NewTaskDialog> createState() => _NewTaskDialogState();
}

class _NewTaskDialogState extends State<NewTaskDialog> {
  Task task = Task(
      name: "New task name", dueDate: DateTime.now(), category: DatabaseManager.categories.first);
  late TextEditingController taskNameController = TextEditingController(text: task.name);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Task creation"),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(labelText: "Task name"),
                controller: taskNameController,
              ),
            ),
            _categorySelector,
            _dateSelector,
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Close"),
        ),
        TextButton(
          onPressed: () {
            DatabaseManager.addTask(task.copyWith(name: taskNameController.text));
            Navigator.of(context).pop();
          },
          child: const Text("Create"),
        ),
      ],
    );
  }

  Widget get _categorySelector {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(color: task.category.color),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: DropdownButton<TaskCategory>(
        borderRadius: BorderRadius.circular(8.0),
        hint: const Text("Select category"),
        value: task.category,
        onChanged: (category) => setState(() => task = task.copyWith(category: category)),
        items: DatabaseManager.categories.map((category) {
          return DropdownMenuItem(
            value: category,
            child: Text(category.name, style: TextStyle(color: category.color)),
          );
        }).toList(),
      ),
    );
  }

  Widget get _dateSelector {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        icon: const Icon(Icons.calendar_today),
        label: Text(task.dueDate.formattedDate),
        onPressed: _selectDate,
      ),
    );
  }

  void _selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date != null && mounted) {
      final time = await showTimePicker(context: context, initialTime: TimeOfDay.now());
      if (time != null && mounted) {
        setState(() {
          task = task.copyWith(
            dueDate: DateTime(date.year, date.month, date.day, time.hour, time.minute),
          );
        });
      }
    }
  }
}
