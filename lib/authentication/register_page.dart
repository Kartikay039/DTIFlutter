import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter_application_1/components/button.dart";
import "package:flutter_application_1/components/my_textfeild.dart";
import "package:flutter_application_1/components/square_tile.dart";


class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {

  //creating controllers(data) for text feilds
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  //sigup function
  void signUserUp() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context){
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    );

    //trying to create user
    try{

      if(password.text == confirmPassword.text){
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text);
        Navigator.pop(context);
      }
      else{

        //pop the loading circle
        Navigator.pop(context);

        // show error message password don't match
        showErrorMessage("Password don't match!");
      }
      
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
    return Scaffold(// i was not able to figure out how can i change background color of my AdaptivePageScaffold so i use scaffold
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          children: [
        
            
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 10, bottom: 40),
              child: Image.asset(
                // width: 100,
                height: 200,
                'assets/app_logo3.png',
              ),
            ), 
            
        
            Text(
              'Let\'s create an account for you!',
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

            //confirm password textfeild
            MyTextFeild(
              controller: confirmPassword,
              hintText: 'Confirm Password',
              obscureText: true,
            ),
            
            const SizedBox(height: 25),
        
            // sign up button
            MyButton(
              onTap: signUserUp,
              txt: 'Sign Up',
            ),
        
            const SizedBox(height: 30),
        
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
        
            const SizedBox(height: 30),
        
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
        
            const SizedBox(height: 20),
        
            // Alredy have an account? Login now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Alredy have an account?',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    'Login now',
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