// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/navBar.dart';
import 'package:mobile_app/pages/barcode.dart';
import 'package:mobile_app/pages/home.dart';
import 'package:mobile_app/pages/my_medical_records.dart';
import 'package:mobile_app/pages/pharmacy.dart';
import 'package:mobile_app/pages/profile.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;
    controller = PersistentTabController(initialIndex: 0);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PersistentTabView(
        context,
        screens:screens(),
        items: navBarsItems(),
        controller: controller,
        confineInSafeArea: true,
        
        //backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
        NavBarStyle.style15,

    
    
      ),
    );
  }

  List<Widget> screens() {
    return [
      HomePage(),
      My_Medical_Records(),
      BarCode(),
      MedicineListPage(),
      PatientProfilePage()
    ];
  }
}

