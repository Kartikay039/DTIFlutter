import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  const FoodTile({
    super.key,
    required this.food,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.only(right: 25),
      padding: const EdgeInsets.all(25),
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
                Text('\r' + food.price),
                //price

                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Text(food.rating),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10), //  space between ratings and button
          TextButton(
            onPressed: () {
              // Add to cart functionality
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 84, 237, 89)),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
            child: Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}