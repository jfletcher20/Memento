import 'package:memento/data/database/u_db.dart';
import 'package:memento/data/u_database.dart';
import 'package:memento/presentation/home_page.dart';
import 'package:memento/data/d_theme_data.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DB.init();
  await DatabaseManager.instance.loadData();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.themeData,
      home: const Homepage(),
    );
  }
}
