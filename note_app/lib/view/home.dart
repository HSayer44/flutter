import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_app/service/auth_service.dart';
import 'package:note_app/service/db_service.dart';
import 'package:note_app/view/view_note.dart';

import 'auth_view.dart';
import 'create_note.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CollectionReference dbCollection =
      FirebaseFirestore.instance.collection('Notes');
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note App'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('About'),
                    content: const Text('@AlSayer.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.info_outline)),
          IconButton(
              onPressed: () {
                AuthClass().logout().then((value) {
                  if (value == 'Sign out') {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const GoogleAuthPage()),
                        (route) => false);
                  }
                });
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: dbCollection
            .doc(user!.uid)
            .collection('MyNotes')
            .orderBy('time', descending: true)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text("No notes added yet!"),
              );
            } else {
              return ListView(
                reverse: false,
                children: [
                  ...snapshot.data!.docs.map((data) {
                    String title = data.get('title');
                    final time = data.get('time');
                    String body = data.get('body');
                    String id = data.id;
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ViewNote(
                                    title: title,
                                    body: body,
                                    id: id,
                                  )),
                        );
                      },
                      title: Text(title),
                      subtitle: Text('$time'),
                      trailing: IconButton(
                          onPressed: () {
                            DbHelper().delete(id: id).then((value) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(content: Text(value)));
                            });
                          },
                          icon: const Icon(Icons.delete)),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            FirebaseAuth.instance.currentUser!.photoURL!),
                      ),
                    );
                  }),
                  const SizedBox(height: 88),
                ],
              );
            }
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error fetching data'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CreateNotePage()),
            );
          },
          label: Row(
            children: const [
              Icon(Icons.add),
              Text("Add Note"),
            ],
          )),
    );
  }
}
