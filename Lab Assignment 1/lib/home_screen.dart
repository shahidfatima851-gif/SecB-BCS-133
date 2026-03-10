import 'package:flutter/material.dart';
import 'user.dart';
import 'add_user.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<User> users = [];

  int idCounter = 1;

  void addUser(User user) {
    setState(() {
      users.add(user);
    });
  }

  void deleteUser(int index) {
    setState(() {
      users.removeAt(index);
    });
  }

  void updateUser(int index, User user) {
    setState(() {
      users[index] = user;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("User List")),

      body: ListView.builder(
        itemCount: users.length,

        itemBuilder: (context, index) {

          return Card(
            margin: EdgeInsets.all(10),

            child: ListTile(

              leading: CircleAvatar(
                child: Icon(Icons.person),
              ),

              title: Text(users[index].name),

              subtitle: Text(
                  "${users[index].email} | Age: ${users[index].age}"
              ),

              trailing: IconButton(
                icon: Icon(Icons.delete,color: Colors.red),

                onPressed: (){
                  deleteUser(index);
                },
              ),

              onTap: () async {

                final updatedUser = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AddUser(user: users[index]),
                  ),
                );

                if(updatedUser != null){
                  updateUser(index, updatedUser);
                }

              },
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(

        child: Icon(Icons.add),

        onPressed: () async {

          final newUser = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddUser(),
            ),
          );

          if(newUser != null){
            newUser.id = idCounter++;
            addUser(newUser);
          }

        },
      ),
    );
  }
}