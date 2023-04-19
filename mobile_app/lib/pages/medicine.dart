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