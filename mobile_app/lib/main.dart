import 'package:flutter/material.dart';
import 'package:flutter_login_template/flutter_login_template.dart';
import 'package:mobile_app/pages/homepage.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'pages/login.dart';
import 'pages/signup.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/home',
      routes: {
        '/login': (context) => Login(),
        '/signup': (context) => signup(),
        '/home': (context) => homepage(),
      },
    ));
