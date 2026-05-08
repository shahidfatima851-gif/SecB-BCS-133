import 'package:flutter/material.dart';
import '../db/db_helper.dart';
import '../model/game_model.dart';

class ResultScreen extends StatelessWidget {
  final int guess;
  final String result;

  ResultScreen({required this.guess, required this.result});

  void saveResult() {
    final game = Game(
      guess: guess,
      result: result,
      time: DateTime.now().toString(),
    );

    DBHelper.instance.insertGame(game);
  }

  @override
  Widget build(BuildContext context) {
    saveResult();

    Color color =
    result == "Correct" ? Colors.green :
    result == "Too High" ? Colors.red :
    Colors.orange;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
          ),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                Icon(
                  result == "Correct"
                      ? Icons.emoji_events
                      : Icons.warning,
                  size: 80,
                  color: color,
                ),

                SizedBox(height: 20),

                Text(
                  result,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  "Your guess: $guess",
                  style: TextStyle(color: Colors.white70),
                ),

                SizedBox(height: 25),

                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Play Again"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}