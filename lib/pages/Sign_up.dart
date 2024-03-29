import 'package:chaloapp/help/ErrorAlert.dart';
import 'package:chaloapp/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:chaloapp/components/my_textfield.dart';
import 'package:chaloapp/components/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  // text editing controllers
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

  // sign user in method
  void signUserUp(BuildContext context) async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    // if password not match
    if (passwordController.text != confirmpasswordController.text) {
      displaymassageError("Error", "Password does not match !", context);
    }

    // Data sand to firebase to Registor the users
    else {
      // try block
      try {
        await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
      }
      // catch block
      on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          displaymassageError("Error", "User already Registered", context);
        }
      } catch (e) {
        displaymassageError("Error", e.toString(), context);
      }
    }
  }

  // google sign in '
  void googlesignin() {
    print(" i am in google page ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),

                const SizedBox(height: 10),

                // welcome back, you've been missed!
                Text(
                  'Welcome to Chalobus Service',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 20),

                // username textfield
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // Email textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // Password Textfield
                MyTextField(
                    controller: passwordController,
                    hintText: "Password",
                    obscureText: true),

                const SizedBox(
                  height: 10,
                ),

                // Confirm Password Textfield
                MyTextField(
                    controller: confirmpasswordController,
                    hintText: "Confirm Password",
                    obscureText: true),
                const SizedBox(height: 25),

                // sign in button
                GestureDetector(
                  onTap: (() {
                    signUserUp(context);

                    showDialog(
      context: context,
      builder: (context) => Center(
            child: AlertDialog(
              title: const Text("Registered",style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
              content: const Text("You are Registered Sucessfully"),
              actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: const Text('Back to login page'),
                  ),
                ],
            ),
          ));

                  }),
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "Registor Now",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    GestureDetector(
                        onTap: googlesignin,
                        child: const SquareTile(
                            imagePath: 'assets/images/google.png')),

                    const SizedBox(width: 25),

                    // apple button
                    GestureDetector(
                        onTap: () {
                          print(" I am in  page Apple");
                        },
                        child: const SquareTile(
                            imagePath: 'assets/images/apple.png'))
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have a account ? ',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      }),
                      child: const Text(
                        'Login here',
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
        ),
      ),
    );
  }
}
