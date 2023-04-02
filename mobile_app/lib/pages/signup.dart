// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  
  
  Future signUp() async {
    if (passwordConfirmed()) {
       await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim());
    Navigator.of(context).pushNamed('/');
    }
    print('tapped');   
  }

  bool passwordConfirmed(){
    if (_passwordController.text.trim()== _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }


  }



  void openSignInScreen(){
   Navigator.of(context).pushReplacementNamed('login'); 
  }

 @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  } 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              // image 
                Image.asset('assets/loggo.png',
                height: 120,),
                SizedBox(
                  height: 20,
                ),
                // title 
                Text('SIGN UP',
                style: GoogleFonts.robotoCondensed(
                  fontSize: 40,
                  fontWeight: FontWeight.bold
                ),),
                // subtitle
                Text('Welocme! Here you can sign up',
                style: GoogleFonts.robotoCondensed(
                  fontSize: 18,
                ),),
                SizedBox(
                  height: 50,
                ),
                // Email Text field 
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email'

           
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // password text field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          icon: Icon(Icons.lock)
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //confirm password text field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Confirm Password',
                          icon: Icon(Icons.lock)
                        ),
                      ),
                    ),
                  ),
                ),
                
                
                SizedBox(
                  height: 15,
                ),
                // sign in button 
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: signUp,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0XFF66CA98),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(child: Text('Sign up',
                      style: GoogleFonts.robotoCondensed(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ), 
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                
                // sign up text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already a member? ',
                    style: GoogleFonts.robotoCondensed(
                      fontWeight: FontWeight.bold
                    )),
                    GestureDetector(
                      onTap: openSignInScreen,
                      child: Text(' Sign in here',
                      style: GoogleFonts.robotoCondensed(
                        color: Color(0XFF66CA98),
                        fontWeight: FontWeight.bold
                      ),),
                    )
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