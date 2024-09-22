import 'package:flutter/material.dart';
import 'package:memento/presentation/tabs/s_completed_tasks.dart';
import 'package:memento/presentation/tabs/s_news_screen.dart';
import 'package:memento/presentation/tabs/s_pending_tasks.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar's style was adjusted in theme d_theme_data.dart
      appBar: AppBar(title: const Text("Memento")),
      body: TabBarView(
        controller: tabController,
        children: const [
          PendingTasksScreen(),
          CompletedTasksScreen(),
          NewsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.pending_actions), label: "Pending"),
          BottomNavigationBarItem(icon: Icon(Icons.check), label: "Completed"),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: "News"),
        ],
        showSelectedLabels: true,
        showUnselectedLabels: false,
        // setState will call the build function, which will rebuild the BottomNavigationBar
        // and display the selected tab change in the bottom navigation bar
        onTap: (index) => setState(() => tabController.animateTo(index)),
        currentIndex: tabController.index,
      ),
    );
  }
}
