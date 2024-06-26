import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter_application_1/components/button.dart";
import "package:flutter_application_1/components/my_textfeild.dart";
import "package:flutter_application_1/components/square_tile.dart";

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //creating controllers(data) for text feilds
  final email = TextEditingController();
  final password = TextEditingController();

  //sigin function
  void signUserIn() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context){
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    );

    //trying to log in user
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text);
      //pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e){

      //pop the loading circle
      Navigator.pop(context);

      //show error message
      showErrorMessage(e.code);
    }

    
  }

  //error message to user
  void showErrorMessage(String message){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          children: [
        
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 10, bottom: 50),
              child: Image.asset(
                
                // width: 100,
                height: 200,
                'assets/app_logo3.png',
                
              ),
            ),    
            
            Text(
              'Welcome back!',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              ),
            ),
            
            const SizedBox(height: 20,),
        
            //email textfeild
            MyTextFeild(
              controller: email,
              hintText: 'Email',
              obscureText: false,
            ),
            
            const SizedBox(height: 10,),
        
            //password textfeild
            MyTextFeild(
              controller: password,
              hintText: 'Password',
              obscureText: true,
            ),
        
            const SizedBox(height: 10,),
        
            //forgot password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
        
            const SizedBox(height: 25),
        
            // sign in button
            MyButton(
              onTap: signUserIn,
              txt: 'Sign In',
            ),
        
            const SizedBox(height: 40),
        
            // or continue with
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Or continue with',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
        
            const SizedBox(height: 40),
        
            // google + apple sign in buttons
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // google button
                SquareTile(imagePath: 'assets/google_logo.png'),
        
                SizedBox(width: 25),
                  
                // apple button
                SquareTile(imagePath: 'assets/apple_logo.png')
              ],
            ),
        
            const SizedBox(height: 40),
        
            // not a member? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member?',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    'Register now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),    
    );
  }

  
}