// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/navBar.dart';
import 'package:mobile_app/pages/home.dart';
import 'package:mobile_app/pages/login.dart';
import 'package:mobile_app/pages/my_medical_records.dart';
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
          items: navBarsItems(),
          navBarStyle: NavBarStyle.style3,
        ),
      ),
    );
  }

  List<Widget> screens() {
    return [TestPage(), My_Medical_Records(), Login(), SignUp(), Dosh()];
  }
}

class TestPage extends StatelessWidget {
  TestPage({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('hello you are signed in', style: TextStyle(fontSize: 22)),
            Text(user!.email!, style: TextStyle(fontSize: 22)),
            MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              color: Color(0XFF66CA98),
              child: Text('sign out'),
            )
          ],
        ),
      ),
    );
  }
}

class Dosh extends StatelessWidget {
  const Dosh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Dosh'),
    );
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
