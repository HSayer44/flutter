import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditation_app/widgets/botton_nav_bar.dart';
import 'package:meditation_app/widgets/constants.dart';
import 'package:meditation_app/widgets/search_bar.dart';
import 'package:meditation_app/widgets/seassion_card.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: const BoxDecoration(
              color: kBlueLightColor,
              image: DecorationImage(
                image: AssetImage("assets/images/meditation_bg.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Text(
                      "Meditation",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: size.height * 0.05),
                    const Text(
                      "3-10 MIN Course",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: size.width * 0.6,
                      child: const Text(
                          "Live happier and healthier by learning the fundamentals of meditation and mindfulness"),
                    ),
                    SizedBox(
                      width: size.width * 0.5,
                      child: const SearchBar(),
                    ),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: <Widget>[
                        SeassionCard(
                          seassionNum: 1,
                          press: () {},
                          isDone: true,
                        ),
                        SeassionCard(seassionNum: 2, press: () {}),
                        SeassionCard(seassionNum: 3, press: () {}),
                        SeassionCard(seassionNum: 4, press: () {}),
                        SeassionCard(seassionNum: 5, press: () {}),
                        SeassionCard(seassionNum: 6, press: () {}),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Meditation",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      padding: const EdgeInsets.all(10),
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 17),
                            blurRadius: 23,
                            spreadRadius: -13,
                            color: kShadowColor,
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset(
                              "assets/icons/Meditation_women_small.svg"),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Basic 2",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                const Text("Start your practice")
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: SvgPicture.asset("assets/icons/Lock.svg"),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
