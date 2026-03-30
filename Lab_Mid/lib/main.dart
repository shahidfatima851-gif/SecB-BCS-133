import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: HomeScreen(),
    );
  }
}

// MODEL (Task structure)
class Task {
  String title;
  bool isDone;

  Task({required this.title, this.isDone = false});
}

// HOME SCREEN
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];

  // ADD TASK
  void addTask(String title) {
    setState(() {
      tasks.add(Task(title: title));
    });
  }

  // DELETE TASK
  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  // TOGGLE COMPLETE
  void toggleTask(int index) {
    setState(() {
      tasks[index].isDone = !tasks[index].isDone;
    });
  }

  // INPUT DIALOG
  void showAddDialog() {
    String newTask = "";

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add Task"),
          content: TextField(
            onChanged: (value) {
              newTask = value;
            },
            decoration: InputDecoration(hintText: "Enter task"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                addTask(newTask);
                Navigator.pop(context);
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  // UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task Manager")),

      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              tasks[index].title,
              style: TextStyle(
                decoration: tasks[index].isDone
                    ? TextDecoration.lineThrough
                    : null,
              ),
            ),

            leading: Checkbox(
              value: tasks[index].isDone,
              onChanged: (value) {
                toggleTask(index);
              },
            ),

            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                deleteTask(index);
              },
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: showAddDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}