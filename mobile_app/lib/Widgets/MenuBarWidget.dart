import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

Widget menubar(BuildContext context) {
  return SizedBox(
    height: 60,
    child: GNav(
        backgroundColor: Colors.white,
        rippleColor: Color.fromARGB(
            112, 101, 201, 94), // tab button ripple color when pressed
        hoverColor: Color.fromARGB(112, 101, 201, 94), // tab button hover color
        haptic: true, // haptic feedback
        curve: Curves.easeOutExpo, // tab animation curves
        duration: Duration(milliseconds: 900), // tab animation duration
        gap: 5, // the tab button gap between icon and text
        color: Colors.grey[800], // unselected icon color
        activeColor: Color.fromARGB(
            112, 101, 201, 94), //102-202-152 // selected icon and text color
        iconSize: 24, // tab button icon size
        padding: EdgeInsets.symmetric(
            horizontal: 20, vertical: 5), // navigation bar padding
        tabs: [
          GButton(
            icon: LineIcons.home,
            text: 'Home',
            onPressed: () {
              print('home');
            },
          ),
          GButton(
            icon: LineIcons.heart,
            text: 'Likes',
          ),
          GButton(
            icon: LineIcons.barcode,
            text: 'My QR',
          ),
          GButton(
            icon: LineIcons.user,
            text: 'Profile',
          ),
          GButton(
            icon: LineIcons.cog,
            text: 'settings',
          ),
        ]),
  );
}
