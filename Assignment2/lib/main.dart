import 'package:flutter/material.dart';

void main() {
  runApp(ProfileCardApp());
}

class ProfileCardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileCard(),
    );
  }
}

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)),
          child: Container(
            width: 320,
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                      "assets/picture.jpg"),
                ),
                SizedBox(height: 15),
                Text(
                  "Fatima Shahid",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  "BS Computer Science Student",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600]),
                ),
                Divider(height: 30, thickness: 1),
                ListTile(
                  leading: Icon(Icons.email, color: Colors.blue),
                  title: Text("fatima@email.com"),
                ),
                ListTile(
                  leading: Icon(Icons.phone, color: Colors.green),
                  title: Text("+92 300 1234567"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}