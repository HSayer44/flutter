import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'list_content.dart';
import 'list_item.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff131b26),
        body: Container(
          padding: const EdgeInsets.only(top: 25.0, left: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: RichText(
                      softWrap: true,
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Most Popular",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          TextSpan(
                            text: " Habits",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(9.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff6f1bff),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xff6f1bff),
                                offset: Offset(0, 3),
                                blurRadius: 5.0),
                          ],
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 25.0),
                ],
              ),
              const SizedBox(height: 35.0),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: habits.length,
                  itemBuilder: (ctx, id) {
                    return Container(
                      width: 150,
                      margin: const EdgeInsets.only(
                          right: 15.0, top: 9.0, bottom: 9.0),
                      padding: const EdgeInsets.all(13.0),
                      decoration: BoxDecoration(
                        color: habits[id]['color'],
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: habits[id]['color'],
                            blurRadius: 5.0,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            habits[id]['title'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 27,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            habits[id]['fulltext'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 35.0),
              Container(
                height: 90,
                decoration: const BoxDecoration(
                  color: Color(0xff1b232e),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
                padding: const EdgeInsets.all(15),
                child: ListView.builder(
                  itemCount: 7,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, f) {
                    DateTime date = DateTime.now().add(Duration(days: f));
                    return FittedBox(
                      child: Container(
                        width: 90,
                        height: 90,
                        margin: const EdgeInsets.only(right: 15.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: date.day == DateTime.now().day
                              ? const Color(0xff727be8)
                              : const Color(0xff131b26),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "${date.day}",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: date.day == DateTime.now().day
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: date.day == DateTime.now().day
                                    ? Colors.white
                                    : Colors.grey[500],
                              ),
                            ),
                            Text(
                              DateFormat('EE').format(date),
                              style: TextStyle(
                                  color: date.day == DateTime.now().day
                                      ? Colors.white
                                      : Colors.grey[700],
                                  fontWeight: date.day == DateTime.now().day
                                      ? FontWeight.bold
                                      : FontWeight.normal),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 35.0),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Your Habits",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      ),
                    ),
                    TextSpan(
                      text: " 5",
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 21,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: habits2.length,
                itemBuilder: (ctx, id) {
                  return ListItem(id: id);
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
