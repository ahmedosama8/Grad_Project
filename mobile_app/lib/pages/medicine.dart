// import 'package:flutter/material.dart';
// // import 'package:my_app/medicine.dart';


// class Medicine {
//   String name;
//   String description;
//   String image;
//   double price;

//   Medicine(
//       {required this.name, required this.description,required this.price, required this.image});
// }


// class MedicineListPage extends StatefulWidget {
//   @override
//   _MedicineListPageState createState() => _MedicineListPageState();
// }

// class _MedicineListPageState extends State<MedicineListPage> {
//   List<Medicine> medicines = [
//     Medicine(
//       name: 'Aspirin',
//       description: 'Pain Reliever',
//       price: 1.99,
//       image:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSee8p2aOaw6v2jOcikkSQaRTsCsP9IqYBtoA&usqp=CAU',
//     ),
//     Medicine(
//       name: 'Ibuprofen',
//       description: 'Pain Reliever/Fever Reducer',
//       price: 2.99,
//       image:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSee8p2aOaw6v2jOcikkSQaRTsCsP9IqYBtoA&usqp=CAU',
//     ),
//     Medicine(
//       name: 'Acetaminophen',
//       description: 'Pain Reliever/Fever Reducer',
//       price: 3.99,
//       image:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSee8p2aOaw6v2jOcikkSQaRTsCsP9IqYBtoA&usqp=CAU',
//     ),
//     Medicine(
//       name: 'Benadryl',
//       description: 'Allergy Relief',
//       price: 4.99,
//       image:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSee8p2aOaw6v2jOcikkSQaRTsCsP9IqYBtoA&usqp=CAU',
//     ),
//     Medicine(
//       name: 'Claritin',
//       description: 'Allergy Relief',
//       price: 5.99,
//       image:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSee8p2aOaw6v2jOcikkSQaRTsCsP9IqYBtoA&usqp=CAU',
//     ),
//     Medicine(
//       name: 'Zyrtec',
//       description: 'Allergy Relief',
//       price: 6.99,
//       image:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSee8p2aOaw6v2jOcikkSQaRTsCsP9IqYBtoA&usqp=CAU',
//     ),
//   ];

//   List<Medicine> filteredMedicines = [];

//   @override
//   void initState() {
//     super.initState();
//     filteredMedicines = medicines;
//   }

//   void addToCart(Medicine medicine) {
//     setState(() {
//       cart.add(medicine);
//     });
//   }

//   List<Medicine> cart = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Medicines'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.shopping_cart),
//             onPressed: () async {
//               final clearCart = await Navigator.pushNamed(
//                 context,
//                 '/checkout',
//               );
//               if (clearCart == true) {
//                 setState(() {
//                   cart.clear();
//                 });
//               }
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           TextField(
//             decoration: InputDecoration(
//               hintText: 'Search Medicines',
//               prefixIcon: Icon(Icons.search),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             onChanged: (query) {
//               setState(() {
//                 filteredMedicines = medicines.where((medicine) =>
//                     medicine.name.toLowerCase().contains(query.toLowerCase())).toList();
//           });
//         },
//       ),
//       Expanded(
//         child: ListView.builder(
//           itemCount: filteredMedicines.length,
//           itemBuilder: (BuildContext context, int index) {
//             final medicine = filteredMedicines[index];
//             return ListTile(
//               leading: CircleAvatar(
//                     backgroundImage: NetworkImage(medicine.image),
//                   ),
//               title: Text(medicine.name),
//               subtitle: Text(medicine.description),
//               trailing: IconButton(
//                 icon: Icon(Icons.add_shopping_cart),
//                 onPressed: () {
//                   addToCart(medicine);
//                 },
//               ),
//             );
//           },
//         ),
//       ),
//     ],
//   ),
// );
// }
// }


/////////////////////////////////////////////////////////////////////////////////// home 
          // Container(
          //   padding: EdgeInsets.only(left: 20),
          //   height: 100,
          //   child: ListView(
          //     scrollDirection: Axis.horizontal,
          //     children: [
          //                       SizedBox(
          //         width: 200,
          //         height: 200,
          //         child: ElevatedButton(
          //           style: ElevatedButton.styleFrom(
          //             elevation: 0,
          //               backgroundColor: Color.fromARGB(228, 255, 255, 255),
          //               ),
          //           onPressed: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => MedicineListPage()),
          //             );
          //           },
          //           child: Column(
          //             children: [
          //               SizedBox(height: 5),
          //               Expanded(
          //                 child: Center(
          //                   child: Image(
          //                     image: AssetImage('assets/loggo.png'),),
          //                   ),
          //               ),
          //               SizedBox(height: 10),
          //               Text(
          //                 'Our Pharmacy',
          //                 style: TextStyle(
          //                     fontWeight: FontWeight.bold,
          //                     fontSize: 13,
          //                     color: Colors.black),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //       SizedBox(
          //         width: 20,
          //       ),
          //       SizedBox(
          //         width: 200,
          //         height: 200,
          //         child: ElevatedButton(
          //           style: ElevatedButton.styleFrom(
          //             elevation: 0,
          //               backgroundColor: Color.fromARGB(228, 255, 255, 255),
          //               ),
          //           onPressed: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) =>  Pharmacy()),
          //             );
          //           },
          //           child: Column(
          //             children: [
          //               SizedBox(height: 5),
          //               Center(
          //                 child: Image(
          //                   image: NetworkImage('https://elezabypharmacy.com/themes/Elezaby/images/logo_ar3.png',
          //                   scale: 1),
          //                 ),
          //               ),
          //               SizedBox(height: 10),
          //               // Text(
          //               //   'El Ezaby',
          //               //   style: TextStyle(
          //               //       fontWeight: FontWeight.bold,
          //               //       fontSize: 13,
          //               //       color: Colors.black),
          //               // ),
          //             ],
          //           ),
          //         ),
          //       ),
          //       SizedBox(
          //         width: 20,
          //       ),
          //       SizedBox(
          //         width: 110,
          //         height: 100,
          //         child: ElevatedButton(
          //           style: ElevatedButton.styleFrom(
          //               backgroundColor: Color.fromARGB(228, 255, 255, 255),
          //               elevation: 0
          //               ),
          //           onPressed: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => const BarCode()),
          //             );
          //           },
          //           child: Column(
          //             children: [
          //               SizedBox(height: 20),
          //                Image(
          //                 image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2B1qwmkRG3BxXkkw7P1_gTRffVlGciT3ePg&usqp=CAU',
          //                 scale: 4),
          //               ),
          //               SizedBox(height: 10),
          //               // Text(
          //               //   'Rad-Scans',
          //               //   style: TextStyle(
          //               //       fontWeight: FontWeight.bold,
          //               //       fontSize: 13,
          //               //       color: Colors.black),
          //               // ),
          //             ],
          //           ),
          //         ),
          //       ),
          //       SizedBox(
          //         width: 20,
          //       ),
          //       SizedBox(
          //         width: 110,
          //         height: 100,
          //         child: ElevatedButton(
          //           style: ElevatedButton.styleFrom(
          //               backgroundColor: Color.fromARGB(228, 255, 255, 255),
          //               elevation: 0,),
          //           onPressed: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => const Pharmacy()),
          //             );
          //           },
          //           child: Column(
          //             children: [
          //               SizedBox(height: 20),
          //               Image(
          //                 image: NetworkImage('http://rofayda.org/wp-content/uploads/2015/05/index-1.jpg',
          //                 scale: 4 ),
          //               ),
                      
          //               SizedBox(height: 10),
          //               // Text(
          //               //   'Doctors Visit',
          //               //   style: TextStyle(
          //               //       fontWeight: FontWeight.bold,
          //               //       fontSize: 12,
          //               //       color: Colors.black),
          //               // ),
          //             ],
          //           ),
          //         ),
          //       ),
                
          //       SizedBox(
          //         width: 20,
          //       ),
          //       SizedBox(
          //         width: 110,
          //         height: 100,
          //         child: ElevatedButton(
          //           style: ElevatedButton.styleFrom(
          //               backgroundColor: Color.fromARGB(228, 255, 255, 255),
          //               elevation: 0),
          //           onPressed: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => const Pharmacy()),
          //             );
          //           },
          //           child: Column(
          //             children: [
          //               SizedBox(height: 20),
          //               Image(
          //                 image: NetworkImage('https://luxmedicard-storage.s3.amazonaws.com/files/public/LOGO_FOUDA_PHARMACY-2.png',
          //                 scale:4 ),
          //               ),
          //               SizedBox(height: 10),
          //               // Text(
          //               //   'Doctors Visit',
          //               //   style: TextStyle(
          //               //       fontWeight: FontWeight.bold,
          //               //       fontSize: 12,
          //               //       color: Colors.black),
          //               // ),
          //             ],
          //           ),
          //         ),
          //       ),
          //        SizedBox(
          //         width: 20,
          //       ),
          //       SizedBox(
          //         width: 110,
          //         height: 100,
          //         child: ElevatedButton(
          //           style: ElevatedButton.styleFrom(
          //               backgroundColor: Color.fromARGB(228, 255, 255, 255),
          //               elevation: 0),
          //           onPressed: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => const Pharmacy()),
          //             );
          //           },
          //           child: Column(
          //             children: [
          //               SizedBox(height: 20),
          //               Image(
          //                 image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ37z-m3txhQNhCbzLx0a7ekxn6XTfl9zKcig&usqp=CAU',
          //                 scale:4 ),
          //               ),
          //               SizedBox(height: 10),
          //               // Text(
          //               //   'Doctors Visit',
          //               //   style: TextStyle(
          //               //       fontWeight: FontWeight.bold,
          //               //       fontSize: 12,
          //               //       color: Colors.black),
          //               // ),
          //             ],
          //           ),
          //         ),
          //       ),
          //                        SizedBox(
          //         width: 20,
          //       ),
          //       SizedBox(
          //         width: 110,
          //         height: 100,
          //         child: ElevatedButton(
          //           style: ElevatedButton.styleFrom(
          //               backgroundColor: Color.fromARGB(228, 255, 255, 255),
          //               elevation: 0),
          //           onPressed: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => const Pharmacy()),
          //             );
          //           },
          //           child: Column(
          //             children: [
          //               SizedBox(height: 20),
          //               Image(
          //                 image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5HjSvdRxnMsDOFUUZUIyZh4-KAt_J40NNGA&usqp=CAU',
          //                 scale:4 ),
          //               ),
          //               SizedBox(height: 10),
          //               // Text(
          //               //   'Doctors Visit',
          //               //   style: TextStyle(
          //               //       fontWeight: FontWeight.bold,
          //               //       fontSize: 12,
          //               //       color: Colors.black),
          //               // ),
          //             ],
          //           ),
          //         ),
          //       )
                
          //     ],
          //   ),
          // ),
          ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
          
          
  // List<LabsDataModel> labs =[
  //   LabsDataModel(urlImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAi-sf9GkxgOv6_0kTx0FC6ATbTgNRqLPFBw&usqp=CAU', name: 'Alfa Lab', urlWeb: 'urlWeb', phone: 'phone'),
  //   LabsDataModel(urlImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJp43zftj2Rh5vbGQeCBuT5Qe9sLb9BxHx0A&usqp=CAU', name: 'Al-Mokhtabar', urlWeb: 'urlWeb', phone: 'phone'),
  //   LabsDataModel(urlImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcLNcRrqgXV9X-ZtHd8kb4WxAe_NECCVwVww&usqp=CAU', name: 'Cairo Scan', urlWeb: 'urlWeb', phone: 'phone'),
  //   LabsDataModel(urlImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAi-sf9GkxgOv6_0kTx0FC6ATbTgNRqLPFBw&usqp=CAU', name: 'Alfa Scan', urlWeb: 'urlWeb', phone: 'phone'),
  //   LabsDataModel(urlImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1dNIjOt_6An16uMqW-dZ5nQbTctV2XW14jg&usqp=CAU', name: 'Al-Borg', urlWeb: 'urlWeb', phone: 'phone'),
  //   LabsDataModel(urlImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYC6guz8gX_0mgWxxqgraIHbafE4PPW0_wUw&usqp=CAU', name: 'Dokki Scan', urlWeb: 'urlWeb', phone: 'phone'),
  //   LabsDataModel(urlImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkWOFRgGI2gQ0bM--PbVcrlUMEl0_kAJO33A&usqp=CAU', name: 'El-Ahram Scan', urlWeb: 'urlWeb', phone: 'phone')
  // ];

  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            // Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       Icon(Icons.web_outlined,
          //       size: 36,
          //       color: primary,),
          //       SizedBox(width: 8,),
          //       SelectableText(item.urlWeb,style:GoogleFonts.robotoCondensed(
          //                 fontSize: 20,
          //                 fontWeight: FontWeight.bold
          //               ),
          //               ),
          
          //       SizedBox(width: 8,),        
          //       ElevatedButton(
          //         onPressed: () async {
          //         final url =item.urlWeb;
          //         final Uri uri= Uri(scheme: 'https',host: url);
          //         if (!await launchUrl(uri, mode:
          //         LaunchMode.externalApplication)) {
          //           throw "Can not launch url";
          //         }
          //       }
          //       ,
          //       style: ElevatedButton.styleFrom(
          //         backgroundColor: primary,
          //       ),
          //        child: Text('Go'),
                  
          //       ),
          //     ],
          //   ),
          // ),
            
            // Padding(
            //   padding: const EdgeInsets.all(10.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [              
            //     Icon(Icons.call,
            //     size: 36,
            //     color: primary,),
            //     SizedBox(width: 8,),
            //     SelectableText(item.phone,style:GoogleFonts.robotoCondensed(
            //               fontSize: 20,
            //               fontWeight: FontWeight.bold
            //     ),
            //     ),
            
            //     SizedBox(width: 8,),   
            
            //       ElevatedButton(onPressed: () async {
            //       final phoneNum =item.phone;
            //       final Uri uri= Uri(scheme: 'tel',path: phoneNum);
            //       if (!await launchUrl(uri, mode:
            //       LaunchMode.externalApplication)) {
            //         throw "Can not launch url";
            //       }
            //           }, 
            //           style: ElevatedButton.styleFrom(
            //       backgroundColor: primary,
            //           ), 
            //           child: Text('Call')),
            //     ],
            //   ),
            // )
