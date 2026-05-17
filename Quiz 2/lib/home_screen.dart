import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'add_screen.dart';
import 'edit_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List data = [];

  Future<void> fetchData() async {

    final response = await Supabase.instance.client
        .from('submissions')
        .select();

    setState(() {
      data = response;
    });
  }

  Future<void> deleteData(int id) async {

    await Supabase.instance.client
        .from('submissions')
        .delete()
        .eq('id', id);

    fetchData();
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Submission Form"),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),

        onPressed: () async {

          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddScreen(),
            ),
          );

          fetchData();
        },
      ),

      body: ListView.builder(
        itemCount: data.length,

        itemBuilder: (context, index){

          return Card(
            child: ListTile(

              title: Text(data[index]['full_name']),
              subtitle: Text(data[index]['email']),

              trailing: Row(
                mainAxisSize: MainAxisSize.min,

                children: [

                  IconButton(
                    icon: const Icon(Icons.edit),

                    onPressed: () async {

                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => EditScreen(
                            data: data[index],
                          ),
                        ),
                      );

                      fetchData();
                    },
                  ),

                  IconButton(
                    icon: const Icon(Icons.delete),

                    onPressed: (){
                      deleteData(data[index]['id']);
                    },
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}