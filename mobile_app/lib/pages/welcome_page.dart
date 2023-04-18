// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/navBar.dart';
import 'package:mobile_app/pages/login.dart';
import 'package:mobile_app/pages/my_medical_records.dart';
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
        body: PersistentTabView(
          context,
          screens: screens(),
          items: navBarsItems(),
          navBarStyle: NavBarStyle.style3,
        ),
      ),
    );
  }

  List<Widget> screens() {
    return [HomePage(), My_Medical_Records(), HomePage(), HomePage(), HomePage()];
  }
}



class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 30, 20, 5),
                  child: Text('Welcome Back, Dosh!',
                   style: GoogleFonts.robotoCondensed(
                                fontSize: 28,
                   )
                            )
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 30, 20, 5),
                  child: Icon(Icons.notifications_sharp),
                )
              ],
            ),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 30, 20, 20),
                  child: Text('Recent',
                   style: GoogleFonts.robotoCondensed(
                                fontSize: 18,
                   )
                            )
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 30, 20, 20),
                  child: Text('Sea all',
                   style: GoogleFonts.robotoCondensed(
                                fontSize: 14,
                   )
                   ),
                )
              ],
            ),  
          ],
        )
        ),
    ); 
  }
}