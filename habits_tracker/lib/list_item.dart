import 'package:flutter/material.dart';
import 'package:habits_tracker/list_content.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/details');
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 21.0),
        padding: const EdgeInsets.only(right: 25.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: id == 0 ? habits2[id]['color'] : Colors.transparent,
                    border: id == 0
                        ? const Border()
                        : Border.all(
                            color: Colors.grey.shade500,
                          ),
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      habits2[id]['objectif'],
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 19),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      habits2[id]['progress'],
                      style: TextStyle(color: Colors.grey[500], fontSize: 17),
                    ),
                    const SizedBox(height: 15),
                  ],
                )
              ],
            ),
            LinearProgressIndicator(
              value: 0.74,
              backgroundColor: const Color(0xff1c232d),
              valueColor: AlwaysStoppedAnimation(
                habits2[id]['color'],
              ),
            )
          ],
        ),
      ),
    );
  }
}
