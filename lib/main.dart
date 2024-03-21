import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/auth_page.dart'; 
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

// Types of wigits 
//1. state less wigits
//2. state full wigits


//Types of designs
//1. material design
//2. cupertino design

class MyApp extends StatelessWidget{

  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home: AuthPage(),
    );
  }
}

