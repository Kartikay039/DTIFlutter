import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/components/food.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';

class FoodTile extends StatefulWidget {
  final Food food;
  const FoodTile({
    super.key,
    required this.food,
  });

  @override
  State<FoodTile> createState() => _FoodTileState();
}

class _FoodTileState extends State<FoodTile> {
  //quantity
  int quantityCont = 0;

  //decreament quantity
  void decrementQuantity(){
    if(quantityCont>0){
      setState((){
        quantityCont--;
      });
    }
    
  }

  //increament quantity
  void incrementQuantity(){
    setState((){
      quantityCont++;
    });
  }

  //add to cart
  void addToCart(){
    if(quantityCont>0){
      //get access to shop
      final shop = context.read<Shop>();

      //add to cart
      shop.addToCart(widget.food, quantityCont);

      //let the user know it was scussfull

    }
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
      // margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.all(75.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           
          Image.asset(
            widget.food.imagePath,
            height: 140,
          ),
          Text(
            widget.food.name,
            style: const TextStyle(fontSize: 20),
          ),
          SizedBox(
            width: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\r${widget.food.price}'),
                //price

                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Text(widget.food.rating),
                  ],
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 10),

          //add to cart
           
          Row(
            children: [

              //remove button 
              Padding(
                padding: EdgeInsets.only(right: 6),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(89, 111, 255, 0),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.remove,),
                    onPressed: decrementQuantity,
                  ),
                ),
              ),

              //number of items
              Text(
                quantityCont.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              //add button
              Padding(
                padding: EdgeInsets.only(left: 6),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(89, 111, 255, 0),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.add,),
                    onPressed: incrementQuantity,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),
          
          TextButton(
            onPressed: addToCart,
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