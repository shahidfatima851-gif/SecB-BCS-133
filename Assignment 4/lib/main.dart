import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://phxckzhlzcnyzmbasxim.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBoeGNremhsemNueXptYmFzeGltIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzg1NzcxMTMsImV4cCI6MjA5NDE1MzExM30.hAVIWMILjiaaFWHdmVD2azfyc3mYOUXbYGlu4XMiOu4',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}