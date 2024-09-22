import 'package:flutter/material.dart';
import 'package:memento/data/d_theme_data.dart';
import 'package:memento/presentation/home_page.dart';

void main() {
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
