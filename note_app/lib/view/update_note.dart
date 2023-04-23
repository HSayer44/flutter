
// ignore_for_file: must_be_immutable, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:note_app/service/db_service.dart';
import 'package:note_app/view/home.dart';

class UpdateNotePage extends StatefulWidget {
  UpdateNotePage({super.key, this.id, this.title, this.body});
  String? title;
  String? body;
  String? id;

  @override
  State<UpdateNotePage> createState() => _UpdateNotePageState();
}

class _UpdateNotePageState extends State<UpdateNotePage> {
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      title.text = widget.title!;
      body.text = widget.body!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Note'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: key,
                child: Column(
                  children: [
                    TextFormField(
                      controller: title,
                      decoration: const InputDecoration(
                        label: Text("Note title"),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Title is empty";
                        }
                      },
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: body,
                      minLines: 1,
                      maxLines: 20,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "body is empty";
                        }
                      },
                      decoration: const InputDecoration(
                        label: Text("Note body"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (key.currentState!.validate()) {
              // print(title.text);
              DbHelper()
                  .update(
                      id: widget.id,
                      title: title.text.trim(),
                      body: body.text.trim())
                  .then((value) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(value)));
                
              });
             Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
                (Route<dynamic> route) => false,
              );
            }
          },
          label: Row(
            children: const [
              Icon(Icons.add),
              Text("Update Note"),
            ],
          )),
    );
  }
}
