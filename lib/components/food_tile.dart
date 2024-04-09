import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  const FoodTile({
    super.key,
    required this.food,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.only(right: 25),
      padding: const EdgeInsets.all(75.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           
          Image.asset(
            food.imagePath,
            height: 140,
          ),
          Text(
            food.name,
            style: const TextStyle(fontSize: 20),
          ),
          SizedBox(
            width: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\r${food.price}'),
                //price

                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Text(food.rating),
                  ],
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 10), //  space between ratings and button
          TextButton(
            onPressed: () {
              // Add to cart functionality
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 84, 237, 89)),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
            child: const Text('Add to Cart'),
          ),
        ],
      ),
      ),
    );
  }
}