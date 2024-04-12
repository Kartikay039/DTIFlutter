import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/food.dart';
import 'package:flutter_application_1/components/food_tile.dart';
import 'package:flutter_application_1/models/shop.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  

  final  TextEditingController _searchController = TextEditingController();
  //responsible for managing the text field where the user enters the search query.


  List<Food> filteredFoodMenu = [];

  @override
  void initState() {
    final shop = context.read<Shop>();
  final foodMenu = shop.foodMenu;
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
    final shop = context.read<Shop>();
  final foodMenu = shop.foodMenu;
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


      appBar: AppBar(
        
        backgroundColor:  const Color.fromARGB(255, 78, 217, 83),
        
        elevation: 0,
        title: const Text(
          
          'Bennett Bites',
          // style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(height: 25),
          
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),

            //search bar
            
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(40)
                ),
                hintText: "Search...",
              ),
            ),
          ),


          const SizedBox(height: 25),

          //menue text
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: Text(
              "Food Menu",
              style: TextStyle(
                  
                  color: Color.fromARGB(255, 5, 5, 5),
                  fontSize: 18),
            ),
          ),


          const SizedBox(height: 12),

          //food items 

          Expanded(
            child: Center(
              
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                // itemCount: foodMenu.length,
                itemCount: filteredFoodMenu.length,
                itemBuilder: (context, index) => FoodTile(
                  food: filteredFoodMenu[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
} 