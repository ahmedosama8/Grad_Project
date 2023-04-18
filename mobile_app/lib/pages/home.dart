// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/labs_data_model.dart';
import 'package:mobile_app/labs_detail.dart';
import 'package:mobile_app/pages/welcome_page.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);


  static List <String> labName=['Alfa Lab','Al-Mokhtabar','Cairo Scan','Alfa Scan','Al-Borg','Dokki Scan','El-Ahram Scan'];
  static List url = ['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAi-sf9GkxgOv6_0kTx0FC6ATbTgNRqLPFBw&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJp43zftj2Rh5vbGQeCBuT5Qe9sLb9BxHx0A&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcLNcRrqgXV9X-ZtHd8kb4WxAe_NECCVwVww&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAi-sf9GkxgOv6_0kTx0FC6ATbTgNRqLPFBw&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1dNIjOt_6An16uMqW-dZ5nQbTctV2XW14jg&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYC6guz8gX_0mgWxxqgraIHbafE4PPW0_wUw&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkWOFRgGI2gQ0bM--PbVcrlUMEl0_kAJO33A&usqp=CAU'];

  final List <LabsDataModel> Labdata = List.generate(labName.length,
  (index) => LabsDataModel(labName[index], '${url[index]}', '${labName[index]} Description....'));

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
                      ))),
              Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 30, 20, 20),
                child: Text('Sea all',
                    style: GoogleFonts.robotoCondensed(
                      fontSize: 14,
                    )),
              )
            ],
          ),
          // ignore: sized_box_for_whitespace
          Container(
            height: 140,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      buildCard(),
                      SizedBox(width: 12,),
                      buildCard(),
                      SizedBox(width: 12,),
                      buildCard(), 
                      SizedBox(width: 12,),
                      buildCard(),
                
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(25, 20, 20, 10),
                  child: Text('Pharmacies',
                      style: GoogleFonts.robotoCondensed(
                        fontSize: 18,
                      ))),
            
            ],
          ),
          
          Container(
            padding: EdgeInsets.only(left: 20),
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  width: 150,
                  height: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(228, 255, 255, 255),
                        shadowColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: Colors.greenAccent))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Profile()),
                      );
                    },
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        Image(
                          image: NetworkImage('https://cms.suse.net/sites/default/files/logo_images/El-Ezaby_logo-resized.png',
                          scale: 8),
                        ),
                        SizedBox(height: 10),
                        // Text(
                        //   'El Ezaby',
                        //   style: TextStyle(
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 13,
                        //       color: Colors.black),
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 110,
                  height: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(228, 255, 255, 255),
                        shadowColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: Colors.greenAccent))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BarCode()),
                      );
                    },
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                         Image(
                          image: NetworkImage('https://m.edarabia.com/wp-content/uploads/2020/04/misr-pharmacies-giza-egypt-300x300.jpg',
                          scale: 5),
                        ),
                        SizedBox(height: 10),
                        // Text(
                        //   'Rad-Scans',
                        //   style: TextStyle(
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 13,
                        //       color: Colors.black),
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 110,
                  height: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(228, 255, 255, 255),
                        shadowColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: Colors.greenAccent))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Pharmacy()),
                      );
                    },
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Image(
                          image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUo3eMtavzWPwydUS4lbehJZUoASyFwcBpVW7h6cRMTMkGkWYwnub29R4EIe0vqodGV6Y&usqp=CAU',
                          scale: 4 ),
                        ),
                      
                        SizedBox(height: 10),
                        // Text(
                        //   'Doctors Visit',
                        //   style: TextStyle(
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 12,
                        //       color: Colors.black),
                        // ),
                      ],
                    ),
                  ),
                ),
                
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 110,
                  height: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(228, 255, 255, 255),
                        shadowColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: Colors.greenAccent))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Pharmacy()),
                      );
                    },
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Image(
                          image: NetworkImage('https://luxmedicard-storage.s3.amazonaws.com/files/public/LOGO_FOUDA_PHARMACY-2.png',
                          scale:4 ),
                        ),
                        SizedBox(height: 10),
                        // Text(
                        //   'Doctors Visit',
                        //   style: TextStyle(
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 12,
                        //       color: Colors.black),
                        // ),
                      ],
                    ),
                  ),
                ),
                 SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 110,
                  height: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(228, 255, 255, 255),
                        shadowColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: Colors.greenAccent))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Pharmacy()),
                      );
                    },
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Image(
                          image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ37z-m3txhQNhCbzLx0a7ekxn6XTfl9zKcig&usqp=CAU',
                          scale:4 ),
                        ),
                        SizedBox(height: 10),
                        // Text(
                        //   'Doctors Visit',
                        //   style: TextStyle(
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 12,
                        //       color: Colors.black),
                        // ),
                      ],
                    ),
                  ),
                ),
                                 SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 110,
                  height: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(228, 255, 255, 255),
                        shadowColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: Colors.greenAccent))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Pharmacy()),
                      );
                    },
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Image(
                          image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5HjSvdRxnMsDOFUUZUIyZh4-KAt_J40NNGA&usqp=CAU',
                          scale:4 ),
                        ),
                        SizedBox(height: 10),
                        // Text(
                        //   'Doctors Visit',
                        //   style: TextStyle(
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 12,
                        //       color: Colors.black),
                        // ),
                      ],
                    ),
                  ),
                )
                
              ],
            ),
          ),
          
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(25, 18, 20, 20),
                  child: Text('Labs & Centers',
                      style: GoogleFonts.robotoCondensed(
                        fontSize: 18,
                      ))),
              Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 18, 20, 20),
                child: Text('Sea all',
                    style: GoogleFonts.robotoCondensed(
                      fontSize: 14,
                    )),
              )
            ],
          ),

          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: Labdata.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title:Text(Labdata[index].name),
                    leading: SizedBox(width: 50,height: 50,
                    child: Image.network(Labdata[index].imageUrl),),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LabDetail(labsDataModel: Labdata[index])));
                    },
          
                  ),
                );
              },),
          )
          // ignore: sized_box_for_whitespace
          // Container(
          //   height: 110,
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Column(
          //       children: [
          //         Expanded(
          //           child: ListView(
          //             scrollDirection: Axis.horizontal,
          //             children: [
          //               buildCard(),
          //               SizedBox(width: 12,),
          //               buildCard(),
          //               SizedBox(width: 12,),
          //               buildCard(), 
          //               SizedBox(width: 12,),
          //               buildCard(),
                  
                        
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      )),
    );
  }
}

Widget buildCard() => Container(
  width: 200,
  height: 200,
  color: Colors.green,
); 