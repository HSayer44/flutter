import 'package:flutter/material.dart';
import 'package:youtube_app/downloader.dart';
import 'package:youtube_app/getSharedData.dart';

class LinkPage extends StatefulWidget {
  const LinkPage({super.key});

  @override
  State<LinkPage> createState() => _LinkPageState();
}

class _LinkPageState extends State<LinkPage> {
  TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            //text field
            TextFormField(
              controller: _textController,
              decoration:
                  const InputDecoration(labelText: "Youtube video link..."),
            ),

            //download button
            GestureDetector(
              onTap: () {
                if (_textController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please add a link"),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else {
                  //download the video
                  Download().downloadVideo(
                      _textController.text.trim(), "Youtube Downloader");
                }
              },
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                  color: Colors.red,
                ),
                child: const Text(
                  "Download Video",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
