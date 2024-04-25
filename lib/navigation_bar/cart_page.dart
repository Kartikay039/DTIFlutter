import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/food.dart';
import 'package:flutter_application_1/main.dart';
import 'package:provider/provider.dart';
import '../models/shop.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // Remove from cart
  void removeFromCart(Food food, BuildContext context) {
    final shop = context.read<Shop>();
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.watch<Shop>();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 244, 243),
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
            child: shop.cart.isEmpty
                ? Center(
                    child: Text('Your cart is empty.'),
                  )
                : ListView.builder(
                    itemCount: shop.cart.length,
                    itemBuilder: (context, index) {
                      final Food food = shop.cart[index];
                      final String foodName = food.name;
                      final String foodPrice = food.price;

                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
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
                    },
                  ),
          ),
          if (shop.cart.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color.fromARGB(255, 78, 217, 83), // Button color
                  padding: const EdgeInsets.symmetric(
                      vertical: 15), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  // Clear the cart
                  shop.clearCart();

                  // Show order placed dialog
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Success'),
                        content: const Text('Order placed successfully!'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Dismiss the dialog
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );

                  // Schedule notification
                  Future.delayed(const Duration(seconds: 10), () {
                    const AndroidNotificationDetails
                        androidPlatformChannelSpecifics =
                        AndroidNotificationDetails(
                      'your_channel_id', // Replace with your channel ID
                      'Bennett Bites', // Replace with your channel name
                      importance: Importance.high,
                      priority: Priority.high,
                    );

                    const NotificationDetails platformChannelSpecifics =
                        NotificationDetails(
                            android: androidPlatformChannelSpecifics);

                    flutterLocalNotificationsPlugin.show(
                      0,
                      'Order Ready',
                      'Your order is ready for pickup!',
                      platformChannelSpecifics,
                    );
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    'Checkout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}