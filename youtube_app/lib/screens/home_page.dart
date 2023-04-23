import 'package:flutter/material.dart';
import 'package:youtube_app/screens/browser_page.dart';
import 'package:youtube_app/screens/link_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        centerTitle: true,
        title: const Text("Youtube downloader"),
      ),

      body: pages[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        currentIndex: _currentIndex,
        items: items,
        onTap: (value){
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
  List<Widget> pages = [
    LinkPage(),
    BrowserPage()
  ];

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.paste), label: "link"),
    BottomNavigationBarItem(icon: Icon(Icons.youtube_searched_for_outlined), label: "Youtube"),
  ];
}
