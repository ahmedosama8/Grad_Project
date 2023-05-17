// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/colors.dart';
import 'package:mobile_app/labs_data_model.dart';
import 'package:mobile_app/pages/book_appointment.dart';
import 'package:mobile_app/pages/labList.dart';
import 'package:mobile_app/pages/labs_detail.dart';
import 'package:mobile_app/pages/login.dart';
import 'package:mobile_app/pages/pharm_details.dart';
import 'package:mobile_app/pages/view_appointment.dart';
import 'package:mobile_app/pharm_data_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:mobile_app/api/user.dart';
import 'package:restart_app/restart_app.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  static List<String> labName = [
    'Alfa Lab',
    'Al-Mokhtabar',
    'Cairo Scan',
    'Alfa Scan',
    'Al-Borg',
    'Nile Scan',
    'El-Ahram Scan'
  ];
  static List pic = [
    'alfalab.png',
    'almokhtabar.png',
    'cairoScan.png',
    'alfascan.png',
    'alborg.png',
    'NileScan.png',
    'alahramScan.png'
  ];

  static List labWeb = [
    'www.alfalaboratory.com',
    'www.almokhtabar.com',
    'www.cairoscan.com.eg',
    'www.alfascan.com.eg',
    'www.alborgscan.com',
    'www.nilescanandlabs.net',
    'www.ahramscan.com'
  ];
  static List labPhone = [
    '16191',
    '19014',
    '19144',
    '16171',
    '19911',
    '19656',
    '02 21 29 2000'
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<LabsDataModel> labData = List.generate(
      HomePage.labName.length,
      (index) => LabsDataModel(
          HomePage.labName[index],
          '${HomePage.pic[index]}',
          '${HomePage.labName[index]} Description....',
          '${HomePage.labWeb[index]}',
          '${HomePage.labPhone[index]}'));

  List<CardItem> items = [
    CardItem(
        urlImage: 'assets/elezaby.png',
        title: 'ElEzaby Pharmacy',
        urlWeb: 'elezabypharmacy.com',
        phone: '19600'),
    CardItem(
        urlImage: 'assets/masr.png',
        title: 'Masr Pharmacy',
        urlWeb: 'misr-online.com',
        phone: '19110'),
    CardItem(
        urlImage: 'assets/care.png',
        title: 'Care Pharmacy',
        urlWeb: 'care-pharmacies.com',
        phone: '19757'),
    CardItem(
        urlImage: 'assets/fouda.png',
        title: 'Fouda Pharmacy',
        urlWeb: 'fouda.com',
        phone: '19395'),
    CardItem(
        urlImage: 'assets/zekry.png',
        title: 'Zekry Pharmacy',
        urlWeb: 'zikrypharmacies.com',
        phone: '19029'),
    CardItem(
        urlImage: 'assets/seif.png',
        title: 'Seif Pharmacy',
        urlWeb: 'seif-online.com',
        phone: '19199'),
  ];

  @override
  Widget build(BuildContext context) {
    final userIdProvider = Provider.of<UserIdProvider>(context);
    final id = userIdProvider.id;
    final username = userIdProvider.username;
    final fullname = userIdProvider.fullname;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(25, 30, 20, 5),
                    child: Text('Welcome Back, $fullname!',
                        style: GoogleFonts.robotoCondensed(
                            fontSize: 20, fontWeight: FontWeight.bold))),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 30, 20, 5),
                  child: IconButton(
                    icon: Icon(Icons.logout),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true)
                          .pushReplacement(
                              MaterialPageRoute(builder: (context) => Login()));
                    },
                  ),
                )
              ],
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(25, 30, 20, 20),
                    child: Text('Appointments',
                        style: GoogleFonts.robotoCondensed(
                          fontSize: 16,
                        ))),
                Spacer(),
              ],
            ),
            // ignore: sized_box_for_whitespace
            SizedBox(
              height: 180,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white12,
                    elevation: 0,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 0, 20, 5),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: primary),
                                borderRadius: BorderRadius.circular(12)),
                            child: ListTile(
                              title: Text('Book an appointment'),
                              leading: SizedBox(
                                width: 50,
                                height: 50,
                                child: Icon(
                                  Icons.add_box_sharp,
                                  size: 30,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Bookappoint()),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 0, 20, 0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: primary),
                                borderRadius: BorderRadius.circular(12)),
                            child: ListTile(
                              title: Text('View my appointments'),
                              leading: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Icon(Icons.list)),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AppointmentDetailsPage()),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            //SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 20, 10),
                    child: Text('Pharmacies',
                        style: GoogleFonts.robotoCondensed(
                          fontSize: 16,
                        ))),
              ],
            ),
            SizedBox(
              height: 130,
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(25, 0, 20, 10),
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                separatorBuilder: (context, _) => SizedBox(
                  width: 10,
                ),
                itemBuilder: (context, index) => buildCard(item: items[index]),
              ),
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(25, 18, 20, 20),
                    child: Text('Labs & Centers',
                        style: GoogleFonts.robotoCondensed(
                          fontSize: 16,
                        ))),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 18, 20, 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LabList()),
                      );
                    },
                    child: Text('See all',
                        style: GoogleFonts.robotoCondensed(
                          fontSize: 14,
                        )),
                  ),
                )
              ],
            ),

            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: labData.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.greenAccent,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 0,
                    child: ListTile(
                      title: Text(labData[index].name),
                      leading: SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset('assets/${labData[index].imageUrl}'),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                LabDetail(labsDataModel: labData[index])));
                      },
                    ),
                  );
                },
              ),
            )
          ],
        )),
      ),
    );
  }

  Widget buildCard({required CardItem item}) => SizedBox(
        width: 120,
        child: Column(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Material(
                      child: Ink.image(
                    image: AssetImage(item.urlImage),
                    child: InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PharmPage(
                                      item: item,
                                    )))),
                  )),
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            //Text(item.title),
          ],
        ),
      );
}
