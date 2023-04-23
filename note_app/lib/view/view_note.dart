// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:note_app/view/update_note.dart';

class ViewNote extends StatefulWidget {
  ViewNote({super.key, this.title, this.body, this.id});

  String? title;
  String? body;
  String? id;

  @override
  State<ViewNote> createState() => _ViewNoteState();
}

class _ViewNoteState extends State<ViewNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View note'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              widget.title!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
            const SizedBox(height: 10),
            Text(widget.body!)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => UpdateNotePage(
                        title: widget.title,
                        body: widget.body,
                        id: widget.id,
                      )),
            );
          },
          label: Row(
            children: const [
              Icon(Icons.edit),
              Text("Edit Note"),
            ],
          )),
    );
  }
}
