// import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_application_1/pages/homepage/home_page.dart';
// import 'package:flutter/widgets.dart';
import '../customer_signup_page.dart';


class CustomerSignInpage extends StatefulWidget {
  const CustomerSignInpage({super.key});

  @override
  State<CustomerSignInpage> createState() => _CustomerSignInpageState();
}

class _CustomerSignInpageState extends State<CustomerSignInpage> {

  //final AuthService _auth = AuthService();
  String email = '';
  String password = ''; 
  @override
  Widget build(BuildContext context) {
          return Scaffold(
      //backgroundColor: Color.fromARGB(169, 0, 0, 0),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/background2.jpg'
                  ),
                  fit: BoxFit.cover, // Cover the entire container
                ),
              ),
            ),
            Container(
              
              width: 400,
              height: 500,
              
              decoration: BoxDecoration(
                boxShadow: const[
                  BoxShadow(
                    color: Color.fromARGB(197, 1, 1, 1), // Shadow color
                    spreadRadius: 5, // How wide the shadow should be
                    blurRadius: 10, // How blurry the shadow should be
                    offset: Offset(0, 3),
                  )
                ],
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Column(
                  
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    const Padding(
                      padding: EdgeInsets.only(bottom: 100),
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 66, 189, 80),
                          fontSize: 40,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 80.0),
                      child: TextField(
                        onChanged: (val){
                          setState(() {
                            email = val;
                          });
                        },
                        style: const TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                          hintText: "E-MAIL",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(74, 0, 0, 0),
                          ),
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Color.fromARGB(74, 0, 0, 0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color.fromARGB(255, 66, 189, 80), width: 2.0), // Change the color of the line when the text field is focused
                          ),
                        ),
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 80.0),
                      child: TextField(
                        onChanged: (val){
                          setState(() {
                            password = val;
                          });
                        },
                        obscureText: true,
                        style: const TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                          hintText: "PASSWORD",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(74, 0, 0, 0),
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color.fromARGB(74, 0, 0, 0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color.fromARGB(255, 66, 189, 80), width: 2.0), // Change the color of the line when the text field is focused
                          ),
                        ),
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.only(right: 81, bottom: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children:[
                          Text(
                            'Forgot Password?'
                          ),
                        ] 
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(onPressed: () async {
                          
                          try{
                            await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
                            setState(() {
                              
                            });
                            

                          }
                          catch(e){
                            print('---------------------------------------------------------------------');
                            print(e.toString());
                            return Future.error(e);
                          }
                          
                          

                          
                        },
                          child: const Text(
                            "Login"
                          )
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const CustomerSignUpPage()), // Navigate to NewPage widget
                            );
                          },
                          child: const Text("Sign Up"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}