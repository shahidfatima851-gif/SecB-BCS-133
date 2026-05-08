import 'package:flutter/material.dart';
import '../db/db_helper.dart';
import '../model/game_model.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<Game> games = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    games = await DBHelper.instance.getGames();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Game History")),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: games.length,
        itemBuilder: (context, index) {
          final g = games[index];

          return Card(
            color: Colors.white10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: Icon(Icons.casino, color: Colors.deepPurpleAccent),
              title: Text("Guess: ${g.guess}"),
              subtitle: Text("${g.result}\n${g.time}"),
            ),
          );
        },
      ),
    );
  }
}