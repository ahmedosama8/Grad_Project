// ignore_for_file: prefer_const_literals_to_create_immutables, unused_field
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  Future signIn() async {

    print('tapped');
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim());
  }

  void openSignUpScreen(){
   Navigator.of(context).pushReplacementNamed('signup'); 
  }

 @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
                Text('SIGN IN',
                style: GoogleFonts.robotoCondensed(
                  fontSize: 40,
                  fontWeight: FontWeight.bold
                ),),
                // subtitle
                Text('Welocme back! Nice to see you again',
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
                          hintText: 'Password'
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
                    onTap: signIn,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0XFF66CA98),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(child: Text('Sign in',
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
                    Text('Not yet a member? ',
                    style: GoogleFonts.robotoCondensed(
                      fontWeight: FontWeight.bold
                    )),
                    GestureDetector(
                      onTap: openSignUpScreen,
                      child: Text(' Sign up now',
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