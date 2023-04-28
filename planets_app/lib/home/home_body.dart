import 'package:flutter/material.dart';
import 'package:planets_app/common/planet_summary.dart';
import 'package:planets_app/common/planets.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: const Color(0xFF736ab7),
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          shrinkWrap: false,
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => PlanetSummary(planets[index]),
                childCount: planets.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
