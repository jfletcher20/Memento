import 'package:flutter/material.dart';

class PendingTasksScreen extends StatefulWidget {
  const PendingTasksScreen({super.key});

  @override
  State<PendingTasksScreen> createState() => _PendingTasksScreenState();
}

class _PendingTasksScreenState extends State<PendingTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("No pending tasks! 🎉", style: Theme.of(context).textTheme.titleLarge),
    );
  }
}
