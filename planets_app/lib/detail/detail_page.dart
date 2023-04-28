import 'package:flutter/material.dart';
import 'package:planets_app/common/planet_summary.dart';
import 'package:planets_app/common/planets.dart';
import 'package:planets_app/common/separator.dart';

import '../common/text_style.dart';

class DetailPage extends StatelessWidget {
  final Planet planet;
  const DetailPage(this.planet, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: const Color(0xff736ab7),
        child: Stack(
          children: <Widget>[
            _getBackground(),
            _getGradient(),
            _getContent(),
            _getToolbar(context),
          ],
        ),
      ),
    );
  }

  Container _getBackground() {
    return Container(
      constraints: const BoxConstraints.expand(height: 295.0),
      child: Image.network(planet.picture, fit: BoxFit.cover, height: 300.0),
    );
  }

  Container _getGradient() {
    return Container(
      margin: const EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[Color(0x00736AB7), Color(0xFF736AB7)],
          stops: [0.0, 0.9],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  Container _getContent() {
    final overviewTitle = "Overview".toUpperCase();
    return Container(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
        children: <Widget>[
          PlanetSummary(
            planet,
            horizontal: false,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  overviewTitle,
                  style: Style.headerTextStyle,
                ),
                const Separator(),
                Text(planet.description, style: Style.commonTextStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _getToolbar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: const BackButton(color: Colors.white),
    );
  }
}
