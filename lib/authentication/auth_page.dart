import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter_application_1/authentication/login_or_register.dart";
import "package:flutter_application_1/navigation_bar/bottom_navigation_bar.dart";



class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return const MyHomePage();
          }
          else{
            return const LoginOrRegister();
          }
        }
      ),
    );
  }
}