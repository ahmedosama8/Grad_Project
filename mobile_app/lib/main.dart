import 'package:flutter/material.dart';
import 'package:flutter_login_template/flutter_login_template.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'pages/login.dart';
import 'pages/signup.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/signup',
      routes: {
        '/': (context) => Login(),
        '/signup': (context) => signup(),
      },
    ));
