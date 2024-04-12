import 'package:flutter/material.dart';

import '../components/food.dart';

class Shop extends ChangeNotifier{
  final List<Food> _foodMenu = [
    Food(
      name: 'Noodles',
      price: 'Rs 70',
      imagePath: 'assets/noodle.jpg',
      rating: '4.9',
    ),
    Food(
      name: 'Paneer Roll',
      price: 'Rs 110',
      imagePath: 'assets/pasta.jpg',
      rating: '3.8',
    ),
    Food(
      name: 'Red Sauce Pasta',
      price: 'Rs 110',
      imagePath: 'assets/pasta.jpg',
      rating: '4.2',
    )
  ];

  //customers cart
  List<Food> _cart = [];

  //getter method
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  //add to cart
  void addToCart(Food foodItem, int quantity){
    for(int i =0; i<quantity; i++){
      _cart.add(foodItem);
    }
    notifyListeners();
  }
  //remove from cart
  void removeFromCart(Food food){
    _cart.remove(food);
    notifyListeners();
  }
}