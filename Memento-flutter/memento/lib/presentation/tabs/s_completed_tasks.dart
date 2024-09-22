import 'package:flutter/material.dart';

class CompletedTasksScreen extends StatefulWidget {
  const CompletedTasksScreen({super.key});

  @override
  State<CompletedTasksScreen> createState() => _CompletedTasksScreenState();
}

class _CompletedTasksScreenState extends State<CompletedTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("No tasks have been completed.", style: Theme.of(context).textTheme.titleLarge),
    );
  }
}
