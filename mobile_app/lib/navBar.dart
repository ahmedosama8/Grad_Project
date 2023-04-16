import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

List<PersistentBottomNavBarItem> navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.home),
      title: ("Home"),
      activeColorPrimary: Color(0XFF66CA98),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.receipt_long),
      title: ("Records"),
      activeColorPrimary: Color(0XFF66CA98),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.barcode_viewfinder),
      title: ("My QR"),
      activeColorPrimary: Color(0XFF66CA98),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.bell),
      title: ("Notification"),
      activeColorPrimary: Color(0XFF66CA98),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.person),
      title: ("Profile"),
      activeColorPrimary: Color(0XFF66CA98),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
  ];
}
