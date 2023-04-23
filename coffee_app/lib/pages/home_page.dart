import 'package:coffee_app/util/coffe_tile.dart';
import 'package:coffee_app/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //list of coffee type
  final List coffeeType = [
    ['Cappuccino', true],
    ['Latte', false],
    ['Black', false],
    ['White', false],
    ['Shoko', false],
    ['Tee', false]
  ];

  //user tapped on coffee type
  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu_book_rounded),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 25.0),
            child: Icon((Icons.person)),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_rounded), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        ],
      ),
      body: Column(
        children: [
          //find the best coffe for u
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text("Find the best Coffee for you",
                style: GoogleFonts.bebasNeue(fontSize: 56)),
          ),
          //search bar
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Find your drink..',
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade600,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),

          //Coffe types
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeType.length,
              itemBuilder: (context, index) {
                return CoffeType(
                  coffeeType: coffeeType[index][0],
                  isSelected: coffeeType[index][1],
                  onTap: () {
                    coffeeTypeSelected(index);
                  },
                );
              },
            ),
          ),

          //horizontal list
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CoffeeTile(
                  coffeName: 'Lattee',
                  coffePrice: '4.20',
                  coffeeImagePath: 'lib/images/cappucino.jpg',
                ),
                CoffeeTile(
                  coffeName: 'Espresso',
                  coffePrice: '3.80',
                  coffeeImagePath: 'lib/images/cappucino.jpg',
                ),
                CoffeeTile(
                  coffeName: 'Milk',
                  coffePrice: '4.60',
                  coffeeImagePath: 'lib/images/cappucino.jpg',
                ),
                CoffeeTile(
                  coffeName: 'Tee',
                  coffePrice: '2.80',
                  coffeeImagePath: 'lib/images/tee.jpg',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
