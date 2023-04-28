// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/colors.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  void signUpButton() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pushNamed('emrsignup');
    }
  }

  void openSignInScreen() {
    Navigator.of(context).pushReplacementNamed('login');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneNumberController.dispose();
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
                    'SIGN UP',
                    style: GoogleFonts.robotoCondensed(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  // subtitle
                  Text(
                    'Welocme! Here you can sign up',
                    style: GoogleFonts.robotoCondensed(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  //full name field
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
                          controller: _nameController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Full Name',
                              icon: Icon(Icons.person_2_outlined)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please write your full name ';
                            } else if (value.length < 4) {
                              return "Too short write your full name";
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
                  // Email Text field
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
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Email',
                                icon: Icon(Icons.email)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email address';
                              } else if (!value.contains('@') ||
                                  !value.contains('.')) {
                                return 'Please enter valid email address';
                              }
                              return null;
                            }),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //phone number field
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
                          controller: _phoneNumberController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Phone No',
                              icon: Icon(Icons.phone_iphone_outlined)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please write your number';
                            } else if (value.length != 11) {
                              return "Write a true number";
                            } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                              return 'Phone number must contain only digits';
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
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              icon: Icon(Icons.lock)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password ';
                            } else if (value.length < 6) {
                              return "Your password must be 6 characters or more ";
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
                  //confirm password text field
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
                          controller: _confirmPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Confirm Password',
                              icon: Icon(Icons.lock)),
                          validator: (value) {
                           if (value == null || value.isEmpty) {
                             return 'Please Confirm your password ';
                           }
                           else if (value.length <6){
                            return "Your password must be 6 characters or more";
                           }
                           else if (value != _passwordController.text){
                            return 'Password missmatch';
                           }
                           return null; 
                          },
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
                      onTap: signUpButton,
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Color(0XFF66CA98),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                            child: Text(
                          'Continue',
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
                      Text('Already a member? ',
                          style: GoogleFonts.robotoCondensed(
                              fontWeight: FontWeight.bold)),
                      GestureDetector(
                        onTap: openSignInScreen,
                        child: Text(
                          ' Sign in here',
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
