import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/customer_signin_page.dart';
import 'package:flutter_application_1/pages/homepage/home_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            
            return const HomePage();
          }
          else if(snapshot.connectionState == ConnectionState.waiting){
            return const CircularProgressIndicator();
          }
          else{
            return const CustomerSignInpage();
          }

        }
          
        ),
    );
  }
}