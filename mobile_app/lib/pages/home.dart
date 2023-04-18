// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';


// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: SafeArea(
//           child: Scaffold(
//             appBar: AppBar(
//               title: Text(
//                 'Self Care',
//               ),
//               elevation: 0.0,
//               centerTitle: true,
//               backgroundColor: Color(0XFF66CA98),
//             ),
//             backgroundColor: Color(0XFFF4F6F5),
//             body: Column(
//               children: [
//                 Container(
//                   height: 400,
//                   width: double.infinity,
//                   decoration: const BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage('assets/background.png'),
//                         fit: BoxFit.cover),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text('Manage your health and happy future' , style: TextStyle(
//                   fontWeight: FontWeight.w600,
//                   fontSize: 25.0,
//                   color: Colors.black
//                 ),
//                 textAlign: TextAlign.center,
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                      Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 25),
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.pushNamed(context, 'login');
//                       },
//                       child: Container(
//                         padding: EdgeInsets.all(16),
//                         decoration: BoxDecoration(
//                           color: Color(0XFF66CA98),
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Center(child: Text('GET STARTED',
//                         style: GoogleFonts.robotoCondensed(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18
//                         ), 
//                         )),
//                       ),
//                     ),
//                   ),
//                   ],
//                 )
        
//               ],
//             ),
//           ),
//         ));
//   }
// }