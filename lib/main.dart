import 'package:flutter/material.dart';
// import 'package:food_app/customer_sign_up_page.dart';
import 'customer_signin_page.dart';
// import 'home.dart';

void main() {
  runApp(const MyApp()); //this only tell that plz run my app
}

class MyApp extends StatelessWidget {
  // this tells that my app is just a widgit because in flutter whole app made up of widges
  const MyApp({super.key});
//there are two types of widgets
//1. statelesswidget
//2. statefullwidget

  @override
  Widget build(BuildContext context) {
    // every widget has a build function
    return const MaterialApp(
      home: CustomerSignInpage(),
    );
  }
}
