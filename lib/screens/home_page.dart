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
  List foodMenu = [
    Food(
        name: 'Noodles',
        price: 'Rs 70',
        imagePath: 'assets/ph.jpg',
        rating: '4.9'),
    Food(
        name: 'Paneer Roll',
        price: 'Rs 110',
        imagePath: 'assets/ph.jpg',
        rating: '3.8'),
    Food(
        name: 'Red Sauce Pasta',
        price: 'Rs 110',
        imagePath: 'assets/ph.jpg',
        rating: '4.2')
  ];


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
          color: Colors.green,
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
  backgroundColor: Colors.green,
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
                    color: Colors.grey,
                    fontSize: 18),
              )),
          const SizedBox(height: 25),
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: foodMenu.length,
                  itemBuilder: (context, index) => FoodTile(
                        food: foodMenu[index],
                      )))
        ],
      ),
    );
  }
}