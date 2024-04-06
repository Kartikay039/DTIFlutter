import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/food.dart';
import 'package:flutter_application_1/components/food_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   List<Food> foodMenu = [
    Food(
      name: 'Noodles',
      price: 'Rs 70',
      imagePath: 'assets/ph.jpg',
      rating: '4.9',
    ),
    Food(
      name: 'Paneer Roll',
      price: 'Rs 110',
      imagePath: 'assets/ph.jpg',
      rating: '3.8',
    ),
    Food(
      name: 'Red Sauce Pasta',
      price: 'Rs 110',
      imagePath: 'assets/ph.jpg',
      rating: '4.2',
    )
  ];

  final  TextEditingController _searchController = TextEditingController();
  //responsible for managing the text field where the user enters the search query.


  List<Food> filteredFoodMenu = [];

  @override
  void initState() {
    super.initState();
    filteredFoodMenu = foodMenu;
    _searchController.addListener(_onSearchChanged);
  }
  //is called when the widget is inserted into the widget tree for the first time.

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
// This method is called when the widget is removed from the widget tree. It's used for cleanup. In this method:


  void _onSearchChanged() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredFoodMenu = foodMenu.where((food) {
        return food.name.toLowerCase().contains(query);
      }).toList();
    });
  }
//is called whenever the text in the search field changes. It filters the foodMenu based on the entered query and updates the filteredFoodMenu accordingly.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
 drawer: Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      const DrawerHeader(
        decoration: BoxDecoration(
          color:  const Color.fromARGB(255, 0, 255, 72),
        ),
        child: Text(
          'User',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
      ListTile(
        title: const Text('Profile'),
        onTap: () {
          // Handle menu item 1 tap
        },
      ),
      ListTile(
        title: const Text('Pick-up Requests'),
        onTap: () {
          // Handle menu item 2 tap
        },
      ),
      ListTile(
        title: const Text('Log Out'),
        onTap: () async {
          await FirebaseAuth.instance.signOut();
        },
      ),
      // Add more menu items as needed
    ],
  ),
),
appBar: AppBar(
  backgroundColor:  const Color.fromARGB(255, 0, 255, 72),
  elevation: 0,
  title: const Text(
    'Welcome',
    style: TextStyle(color: Colors.white),
  ),
),

      body: Column(
        children: [
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: TextField(
              controller: _searchController,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20)))),
          ),
          const SizedBox(height: 25),
          const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Text(
                "MENU",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 5, 5, 5),
                    fontSize: 18),
              )),
          const SizedBox(height: 25),
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                 // itemCount: foodMenu.length,
                  itemCount: filteredFoodMenu.length,
                  itemBuilder: (context, index) => FoodTile(
                        food: filteredFoodMenu[index],
                      )))
        ],
      ),
    );
  }
} 