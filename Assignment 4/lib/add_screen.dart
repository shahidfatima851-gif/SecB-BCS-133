import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  String gender = "Male";

  Future<void> insertData() async {

    await Supabase.instance.client
        .from('submissions')
        .insert({
      'full_name': nameController.text,
      'email': emailController.text,
      'phone': phoneController.text,
      'address': addressController.text,
      'gender': gender,
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Record"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Form(
          key: _formKey,

          child: Column(
            children: [

              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Full Name",
                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return "Enter Name";
                  }
                  return null;
                },
              ),

              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return "Enter Email";
                  }
                  return null;
                },
              ),

              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: "Phone",
                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return "Enter Phone";
                  }
                  return null;
                },
              ),

              TextFormField(
                controller: addressController,
                decoration: const InputDecoration(
                  labelText: "Address",
                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return "Enter Address";
                  }
                  return null;
                },
              ),

              DropdownButton<String>(
                value: gender,
                items: const [
                  DropdownMenuItem(
                    value: "Male",
                    child: Text("Male"),
                  ),
                  DropdownMenuItem(
                    value: "Female",
                    child: Text("Female"),
                  ),
                  DropdownMenuItem(
                    value: "Other",
                    child: Text("Other"),
                  ),
                ],
                onChanged: (value){
                  setState(() {
                    gender = value!;
                  });
                },
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: (){
                  if(_formKey.currentState!.validate()){
                    insertData();
                  }
                },
                child: const Text("Submit"),
              )

            ],
          ),
        ),
      ),
    );
  }
}