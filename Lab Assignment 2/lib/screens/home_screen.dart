import 'dart:math';
import 'package:flutter/material.dart';
import 'result_screen.dart';
import 'history_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController controller = TextEditingController();
  int randomNumber = Random().nextInt(100) + 1;

  void checkGuess() {
    if (controller.text.isEmpty) {
      showError("Enter a number");
      return;
    }

    int? guess = int.tryParse(controller.text);

    if (guess == null) {
      showError("Invalid number");
      return;
    }

    String result;

    if (guess == randomNumber) {
      result = "Correct";
    } else if (guess > randomNumber) {
      result = "Too High";
    } else {
      result = "Too Low";
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ResultScreen(guess: guess, result: result),
      ),
    );
  }

  void showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F172A), Color(0xFF312E81)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Icon(Icons.casino, size: 80, color: Colors.deepPurpleAccent),

                  SizedBox(height: 15),

                  Text(
                    "Guess The Number",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Enter a number between 1 - 100",
                    style: TextStyle(color: Colors.white60),
                  ),

                  SizedBox(height: 25),

                  TextField(
                    controller: controller,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white10,
                      hintText: "Your guess...",
                      hintStyle: TextStyle(color: Colors.white38),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: checkGuess,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent,
                      ),
                      child: Text("Submit"),
                    ),
                  ),

                  SizedBox(height: 10),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => HistoryScreen()),
                      );
                    },
                    child: Text("View History"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}