import 'package:flutter/material.dart';

abstract class ThemeManager {
  static ThemeData get themeData {
    return ThemeData.light(useMaterial3: true).copyWith(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.purple,
        accentColor: Colors.orange,
        brightness: Brightness.light,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(fontSize: 24),
        centerTitle: true,
      ),
    );
  }
}
