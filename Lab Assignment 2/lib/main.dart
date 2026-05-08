import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Guess Game",

      theme: ThemeData(
        brightness: Brightness.dark, // 🌙 aesthetic dark mode
        primarySwatch: Colors.deepPurple,

        scaffoldBackgroundColor: Color(0xFF0F172A),

        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF1E293B),
          elevation: 0,
          centerTitle: true,
        ),

        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: Colors.deepPurple,
          ),
        ),
      ),

      home: HomeScreen(),
    );
  }
}