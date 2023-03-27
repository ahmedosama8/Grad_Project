import 'package:flutter/material.dart';
import 'package:flutter_login_template/flutter_login_template.dart';
import 'package:mobile_app/pages/home.dart';
import 'package:mobile_app/pages/welcome_page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'pages/login.dart';
import 'pages/signup.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0XFF66CA98),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => Login(),
        '/signup': (context) => signup(),
        '/profile':(context) => WelcomePage(),
      },
    ));
