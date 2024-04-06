// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pages/customer_signin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';




class CustomerSignUpPage extends StatefulWidget {
  const CustomerSignUpPage({super.key});

  @override
  State<CustomerSignUpPage> createState() => _CustomerSignUpPageState();
}

class _CustomerSignUpPageState extends State<CustomerSignUpPage> {

  

  String email = '';
  String password = '';
  String confirmPassword = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
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
                    
                    const Text(
                      "Sign up",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 66, 189, 80),
                        fontSize: 40,
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

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 80.0),
                      child: TextField(
                        onChanged: (val){
                          setState(() {
                            confirmPassword = val;
                          });
                        },
                        obscureText: true,
                        style: const TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                          hintText: "CONFIRM PASSWORD",
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
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () async {
                            // if(password == confirmPassword){
                              await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
                              
                              Navigator.pop(context);
                              //Navigator.pop(context);
                              

                            // }
                          },
                          child: const Text("Sign Up"),
                        ),

                      ],
                    )
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