// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/navBar.dart';
import 'package:mobile_app/pages/home.dart';
import 'package:mobile_app/pages/login.dart';
import 'package:mobile_app/pages/medicine.dart';
import 'package:mobile_app/pages/my_medical_records.dart';
import 'package:mobile_app/pages/pharmacy.dart';
import 'package:mobile_app/pages/signup.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: WillPopScope(
          onWillPop: () async {
          // disable back button by returning false
          return false;
        },
          child: PersistentTabView(
            context,
            screens: screens(),
            items: navBarsItems(),
            navBarStyle: NavBarStyle.style3,
          ),
        ),
      ),
    );
  }

  List<Widget> screens() {
    return [HomePage(), My_Medical_Records(), BarCode(), MedicineListPage(), Profile()];
  }
}





class BarCode extends StatelessWidget {
  const BarCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
class Pharmacy extends StatelessWidget {
  const Pharmacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}