import 'package:flutter/material.dart';
import 'user.dart';

class AddUser extends StatefulWidget {

  final User? user;

  AddUser({this.user});

  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController age = TextEditingController();

  @override
  void initState() {
    super.initState();

    if(widget.user != null){
      name.text = widget.user!.name;
      email.text = widget.user!.email;
      age.text = widget.user!.age.toString();
    }
  }

  void saveUser(){

    final user = User(
      id: widget.user?.id ?? 0,
      name: name.text,
      email: email.text,
      age: int.parse(age.text),
    );

    Navigator.pop(context,user);
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(

      appBar: AppBar(
        title: Text(widget.user == null ? "Add User" : "Update User"),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),

        child: Column(
          children: [

            TextField(
              controller: name,
              decoration: InputDecoration(labelText: "Name"),
            ),

            TextField(
              controller: email,
              decoration: InputDecoration(labelText: "Email"),
            ),

            TextField(
              controller: age,
              decoration: InputDecoration(labelText: "Age"),
              keyboardType: TextInputType.number,
            ),

            SizedBox(height:20),

            ElevatedButton(
              onPressed: saveUser,
              child: Text(widget.user == null ? "Add" : "Update"),
            )

          ],
        ),
      ),
    );
  }
}