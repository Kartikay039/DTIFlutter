import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/components/food.dart';
import 'package:provider/provider.dart';
import '../models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  //remove from cart

  void removeFromCart(Food food, BuildContext context){
    final shop = context.read<Shop>();

    shop.removeFromCart(food);
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 78, 217, 83),
        appBar: AppBar(
          title: const Text(
            "My cart",
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 78, 217, 83),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index){
                //get food from cart
                  final Food food = value.cart[index];
                //get food name
                  final String foodName = food.name;
                //get food price
                  final String foodPrice = food.price;
                //return list tittle
                        
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Container(
                      
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        title: Text(foodName),
                        subtitle: Text(foodPrice),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => removeFromCart(food, context),
                        ),
                      ),
                    ),
                  );
                }
              ),
            ),
          ], 
        ),
      ),
    );
  }
}