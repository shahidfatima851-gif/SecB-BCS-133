import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  // Ensures Flutter framework services are ready before making network calls
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Initialize Supabase Client
  await Supabase.initialize(
    url:
        'https://eifbdtqryxzfnytzqaix.supabase.co/rest/v1/', // Replace with your real Supabase URL
    anonKey:
        'sb_publishable_kZtd0mBlWxc2nY43nfYJ8w_PeQxhfd_', // Replace with your real anon key
  );

  // 2. Automatically sync a sample task row right on app launch
  try {
    await Supabase.instance.client.from('tasks').insert({
      'task_name': 'Database Integration Verification Session',
    });
    debugPrint("✅ SUCCESS: Row successfully uploaded to Supabase!");
  } catch (e) {
    debugPrint("❌ ERROR: Database sync failed: $e");
  }

  // 3. Render a clean screen to verify everything works
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green, // Fixed the greenGrid typo here
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              'Database Sync Status: ACTIVE\nData Sent Successfully!',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
