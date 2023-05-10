// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:mobile_app/api/user.dart';
import 'package:mobile_app/colors.dart';
import 'package:mobile_app/pages/app_screen.dart';
import 'package:mobile_app/pages/doctor_report.dart';
import 'package:mobile_app/pages/doctor_visit.dart';
import 'package:mobile_app/pages/emergency_info.dart';
import 'package:mobile_app/pages/home.dart';
import 'package:mobile_app/pages/pharmacy.dart';
import 'package:mobile_app/pages/rad_report.dart';
import 'package:mobile_app/pages/welcome_page.dart';
import 'package:mobile_app/pages/rad_scans.dart';
import 'package:provider/provider.dart';
import 'pages/login.dart';
import 'pages/signup.dart';
import 'pages/my_medical_records.dart';
import 'pages/lab_results.dart';
import 'package:flutter/services.dart';
import 'dart:core';
import 'api/logintest.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

   runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserIdProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: 'signup',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: primary,
        ),

        //home: const WelcomePage(), 
        //initialRoute: '/auth',

        routes: {
          '/': (context) => const AppScreen(),
          'login': (context) =>  Login(),
          'signup': (context) => SignUp(),
          'home': (context) => WelcomePage(),
          //'emrsignup': (context) => EmergencyInfoPage(),
          'my_medical_records': (context) => My_Medical_Records(),
          'lab_results': (context) => const lab_results(),
          'rad_scans': (context) => const rad_scans(),
          'doctor_visit': (context) => const doctor_visit(),
          'pharmacy': (context) => MedicineListPage(),
        });
  }
}
