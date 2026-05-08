import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double bmi;

  ResultScreen({required this.bmi});

  String getCategory() {
    if (bmi < 18.5) return "Underweight";
    else if (bmi < 24.9) return "Normal";
    else if (bmi < 29.9) return "Overweight";
    else return "Obese";
  }

  Color getColor() {
    if (bmi < 18.5) return Colors.orange;
    else if (bmi < 24.9) return Colors.green;
    else if (bmi < 29.9) return Colors.deepOrange;
    else return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4facfe),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: 10)
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Text(
                "Your BMI",
                style: TextStyle(fontSize: 22),
              ),

              SizedBox(height: 10),

              Text(
                bmi.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 15),

              Text(
                getCategory(),
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: getColor(),
                ),
              ),

              SizedBox(height: 25),

              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
                child: Text("Recalculate"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}