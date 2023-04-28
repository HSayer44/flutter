import 'package:flutter/material.dart';
import 'package:habits_tracker/circular_progress.dart';

import 'curve_path.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff131b26),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 35.0,
              ),
              Row(
                children: <Widget>[
                  const Expanded(
                    child: Text(
                      "Learn 5 new words",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 31,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey.shade700,
                      ),
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.edit,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                "5 from 7 this Week",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 21,
                ),
              ),
              const SizedBox(height: 11.0),
              const LinearProgressIndicator(
                value: .71,
                backgroundColor: Color(0xff1c232d),
                valueColor: AlwaysStoppedAnimation(
                  Color(0xff701bff),
                ),
              ),
              const SizedBox(height: 35.0),
              Text(
                "Strength",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 21,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: const <Widget>[
                  Expanded(
                    child: Text(
                      "75%",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 31),
                    ),
                  ),
                  CircularProgress()
                ],
              ),
              const SizedBox(height: 35),
              Container(
                color: Colors.grey[500],
                height: 1.0,
              ),
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  3,
                  (f) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          f == 0
                              ? "Repeat"
                              : f == 1
                                  ? "Streak"
                                  : "Best",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(height: 9),
                        Text(
                          f == 0
                              ? "Every Day"
                              : f == 1
                                  ? "8 Days"
                                  : "11 Days",
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
              Flexible(
                flex: 2,
                child: Transform.rotate(
                  angle: 3.14,
                  child: CustomPaint(
                    painter: CurvePath(),
                    child: const MyBezierCurve(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
