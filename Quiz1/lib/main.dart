import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const DiceApp());
}

class DiceApp extends StatelessWidget {
  const DiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DiceHome(),
    );
  }
}

class DiceHome extends StatefulWidget {
  const DiceHome({super.key});

  @override
  State<DiceHome> createState() => _DiceHomeState();
}

class _DiceHomeState extends State<DiceHome> {

  int diceNumber = 1;

  void rollDice() {
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text(
          "Simple Dice App",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "Tap the dice to roll!",
              style: GoogleFonts.poppins(
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 20),

            GestureDetector(
              onTap: rollDice,
              child: Image.asset(
                "assets/images/$diceNumber.png",
                width: 150,
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: rollDice,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(
                    horizontal: 30, vertical: 12),
              ),
              child: Text(
                "Roll Dice",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}