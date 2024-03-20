import 'package:flutter/material.dart';
import 'customer_signin_page.dart';

class CustomerSignUpPage extends StatelessWidget {
  const CustomerSignUpPage({super.key});
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
                    'assets/login_screen_background.jpg'
                  ),
                  fit: BoxFit.cover, // Cover the entire container
                ),
              ),
            ),
            Container(
              
              width: 400,
              height: 500,
              
              decoration: BoxDecoration(
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
                        color: Color.fromARGB(255, 50, 161, 63),
                        fontSize: 40,
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 80.0),
                      child: TextField(
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          hintText: "E-MAIL",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(74, 0, 0, 0),
                          ),
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Color.fromARGB(74, 0, 0, 0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 2.0), // Change the color of the line when the text field is focused
                          ),
                        ),
                      ),
                    ),
                    
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 80.0),
                      child: TextField(
                        obscureText: true,
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          hintText: "PASSWORD",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(74, 0, 0, 0),
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color.fromARGB(74, 0, 0, 0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 2.0), // Change the color of the line when the text field is focused
                          ),
                        ),
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 80.0),
                      child: TextField(
                        obscureText: true,
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          hintText: "CONFIRM PASSWORD",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(74, 0, 0, 0),
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color.fromARGB(74, 0, 0, 0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 2.0), // Change the color of the line when the text field is focused
                          ),
                        ),
                      ),
                    ),
                    
                    TextButton(
                      onPressed: () {
                        
                      },
                      child: const Text("Sign Up"),
                    ),

                    TextButton(onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CustomerSignInpage()), // Navigate to NewPage widget
                        );
                    },
                      
                      child: const Text(
                        "Login"
                      )
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
