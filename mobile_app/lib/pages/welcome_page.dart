import 'package:flutter/material.dart';
import 'package:mobile_app/pages/home.dart';
import 'package:mobile_app/pages/login.dart';
import 'package:mobile_app/pages/signup.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter/cupertino.dart';





class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
      body: PersistentTabView(
        context,
        screens: screens(),
        items: navBarsItems() ,
        navBarStyle: NavBarStyle.style3,
        ),  



      
      
      
      ),
    );
  }

  List <Widget> screens(){
      return [
        TestPage(),
        HomePage(),
        Login(),
        signup(),
        Dosh()
      ];

  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: Color(0XFF66CA98),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.search),
        title: ("Search"),
        activeColorPrimary:Color(0XFF66CA98) ,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.chat_bubble),
        title: ("Chat"),
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
}

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Dosh'),    );
 }
}

class Dosh extends StatelessWidget {
  const Dosh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Dosh'),    );
 }
}

// class WelcomePage extends StatefulWidget {
//   const WelcomePage({super.key});

//   @override
//   State<WelcomePage> createState() => _WelcomePageState();
// }

// class _WelcomePageState extends State<WelcomePage> {

//   List pages=[
//     HomePage(),
//     Login(),
//     signup(),
    
//   ];

//   int currentPage=0;
//   void onTap (int index){
//     setState(() {
//       currentPage = index;
//     });



//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//     home: Scaffold(
//       backgroundColor: Colors.white,
//     bottomNavigationBar: BottomNavigationBar(

//       selectedItemColor: Color(0XFF66CA98),
//       items: const [
//         BottomNavigationBarItem(icon: Icon(Icons.home), label:('Home'),),
//         BottomNavigationBarItem(icon: Icon(Icons.home), label:('Home'),),
//         BottomNavigationBarItem(icon: Icon(Icons.home), label:('Home'),),
        
        
//       ],
//       elevation: 0,
//       onTap: onTap,
//       currentIndex: currentPage,
//     ),  
    




//     ),



//     );
//   }
// }
