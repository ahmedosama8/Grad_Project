// ignore_for_file: prefer_const_literals_to_create_immutables, unused_field
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/colors.dart';
import 'package:mobile_app/pages/home.dart';
import 'package:mobile_app/pages/welcome_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  void openSignUpScreen() {
    Navigator.of(context).pushReplacementNamed('signup');
  }

  void loginButton() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        'home',
        (Route<dynamic> route) => false,
      );
      print(_userNameController.text);
      print(_passwordController.text);
    }
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // image
                  Image.asset(
                    'assets/loggo.png',
                    height: 100,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // title
                  Text(
                    'SIGN IN',
                    style: GoogleFonts.robotoCondensed(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  ),

                  // subtitle
                  Text(
                    'Welocme back! Nice to see you again',
                    style: GoogleFonts.robotoCondensed(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),


                  // userName Text field
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: primary),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: _userNameController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Username',
                              icon: Icon(Icons.person_pin_rounded)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please write your username ';
                            } else if (value.length < 4) {
                              return "Too short write your username";
                            }
                            return null;
                          },
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
                          border: Border.all(color: primary),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password ';
                            }
                            return null;
                          },
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            icon: Icon(Icons.lock),
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
                      onTap: loginButton,
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Color(0XFF66CA98),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                            child: Text(
                          'Sign in',
                          style: GoogleFonts.robotoCondensed(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
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
                              fontWeight: FontWeight.bold)),
                      GestureDetector(
                        onTap: openSignUpScreen,
                        child: Text(
                          ' Sign up now',
                          style: GoogleFonts.robotoCondensed(
                              color: Color(0XFF66CA98),
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
