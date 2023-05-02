import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;
import 'package:meditation_app/widgets/constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
          BottomNavItem(
            svgScre: "assets/icons/calendar.svg",
            title: "Today",
          ),
          BottomNavItem(
              svgScre: "assets/icons/gym.svg",
              title: "All Exercises",
              isActive: true),
          BottomNavItem(
            svgScre: "assets/icons/Settings.svg",
            title: "Setting",
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String svgScre;
  final String title;
  final VoidCallback? press;
  final bool isActive;

  const BottomNavItem(
      {super.key,
      required this.svgScre,
      required this.title,
      this.press,
      this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SvgPicture.asset(svgScre,
              // ignore: deprecated_member_use
              color: isActive ? kActiveIconColor : kTextColor),
          Text(
            title,
            style: TextStyle(color: isActive ? kActiveIconColor : kTextColor),
          )
        ],
      ),
    );
  }
}
