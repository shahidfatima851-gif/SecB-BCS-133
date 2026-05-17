import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditScreen extends StatefulWidget {

  final Map data;

  const EditScreen({super.key, required this.data});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController addressController;

  late String gender;

  @override
  void initState() {
    super.initState();

    nameController =
        TextEditingController(text: widget.data['full_name']);

    emailController =
        TextEditingController(text: widget.data['email']);

    phoneController =
        TextEditingController(text: widget.data['phone']);

    addressController =
        TextEditingController(text: widget.data['address']);

    gender = widget.data['gender'];
  }

  Future<void> updateData() async {

    await Supabase.instance.client
        .from('submissions')
        .update({
      'full_name': nameController.text,
      'email': emailController.text,
      'phone': phoneController.text,
      'address': addressController.text,
      'gender': gender,
    })
        .eq('id', widget.data['id']);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Record"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            TextField(
              controller: nameController,
              decoration:
              const InputDecoration(labelText: "Name"),
            ),

            TextField(
              controller: emailController,
              decoration:
              const InputDecoration(labelText: "Email"),
            ),

            TextField(
              controller: phoneController,
              decoration:
              const InputDecoration(labelText: "Phone"),
            ),

            TextField(
              controller: addressController,
              decoration:
              const InputDecoration(labelText: "Address"),
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
                updateData();
              },
              child: const Text("Update"),
            )

          ],
        ),
      ),
    );
  }
}