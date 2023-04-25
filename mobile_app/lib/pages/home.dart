// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/labs_data_model.dart';
import 'package:mobile_app/pages/labs_detail.dart';
import 'package:mobile_app/pages/pharm_details.dart';
import 'package:mobile_app/pages/pharmacy.dart';
import 'package:mobile_app/pages/welcome_page.dart';
import 'package:mobile_app/pharm_data_model.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);


  static List <String> labName = ['Alfa Lab','Al-Mokhtabar','Cairo Scan','Alfa Scan','Al-Borg','Dokki Scan','El-Ahram Scan'];
  static List url = ['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAi-sf9GkxgOv6_0kTx0FC6ATbTgNRqLPFBw&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJp43zftj2Rh5vbGQeCBuT5Qe9sLb9BxHx0A&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcLNcRrqgXV9X-ZtHd8kb4WxAe_NECCVwVww&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAi-sf9GkxgOv6_0kTx0FC6ATbTgNRqLPFBw&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1dNIjOt_6An16uMqW-dZ5nQbTctV2XW14jg&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYC6guz8gX_0mgWxxqgraIHbafE4PPW0_wUw&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkWOFRgGI2gQ0bM--PbVcrlUMEl0_kAJO33A&usqp=CAU'];

  static List labWeb = ['www.alfalaboratory.com','www.almokhtabar.com','www.cairoscan.com.eg','www.alfascan.com.eg','www.alborgscan.com','aaa','www.ahramscan.com'];
  static List labPhone = ['16191','19014','19144','16171','19911','6','02 21 29 2000'];


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List <LabsDataModel> Labdata = List.generate(HomePage.labName.length,
  (index) => LabsDataModel(HomePage.labName[index], '${HomePage.url[index]}', '${HomePage.labName[index]} Description....','${HomePage.labWeb[index]}','${HomePage.labPhone[index]}'));

  List<CardItem> items =[
    
    CardItem(urlImage: 'https://elezabypharmacy.com/themes/Elezaby/images/logo_ar3.png'
    , title: 'ElEzaby Pharmacy',urlWeb:'elezabypharmacy.com' ,phone:'19600'),
    CardItem(urlImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2B1qwmkRG3BxXkkw7P1_gTRffVlGciT3ePg&usqp=CAU'
    , title: 'Masr Pharmacy',urlWeb:'misr-online.com' ,phone:'19110'),
    CardItem(urlImage: 'http://rofayda.org/wp-content/uploads/2015/05/index-1.jpg'
    , title: 'Roshdy Pharmacy',urlWeb:'' ,phone:''),
    CardItem(urlImage: 'https://luxmedicard-storage.s3.amazonaws.com/files/public/LOGO_FOUDA_PHARMACY-2.png'
    , title: 'Fouda Pharmacy',urlWeb:'fouda.com' ,phone:'19395'),
    CardItem(urlImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ37z-m3txhQNhCbzLx0a7ekxn6XTfl9zKcig&usqp=CAU'
    , title: 'Zekry Pharmacy',urlWeb:'zikrypharmacies.com' ,phone:'19029'),
    CardItem(urlImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5HjSvdRxnMsDOFUUZUIyZh4-KAt_J40NNGA&usqp=CAU'
    , title: 'Seif Pharmacy',urlWeb:'seif-online.com' ,phone:'19199'),
  ];

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
                  child: Text('Welcome Back, Ga3far ElOmda!',
                      style: GoogleFonts.robotoCondensed(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
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
                child: Text('See all',
                    style: GoogleFonts.robotoCondensed(
                      fontSize: 14,
                    )),
              )
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
                  elevation: 0,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 20, 5),
                        child: Container(
                          decoration: BoxDecoration(color: Color(0XFF6295E2),
                          borderRadius: BorderRadius.circular(12)),
                          child: ListTile(
                            title:Text('Recent Doctor Visited'),
                            subtitle: Text('Doctor name'),
                            leading: SizedBox(width: 50,height: 50,
                            child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkmoJXrt6LyiMzXnR-Cceorv4Uw-MtLmIf2Q&usqp=CAU'),),
                            onTap: () {
                              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => LabDetail(labsDataModel: Labdata[index])));
                            },
                                  
                          ),
                        ),
                      ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 0, 20, 0),
                          child: Container(
                            decoration: BoxDecoration(color: Color(0XFFFF6C52),
                            borderRadius: BorderRadius.circular(12)),
                            child: ListTile( 
                            title:Text('Recent Test'),
                            subtitle: Text('Test name'),
                            leading: SizedBox(width: 50,height: 50,
                            child: Image.network(Labdata[index].imageUrl),),
                            onTap: () {
                              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => LabDetail(labsDataModel: Labdata[index])));
                            },
                                    
                                                ),
                          ),
                        ),
                    ],
                  ),
                );
              },),
          ),
          //SizedBox(height: 10,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 20, 10),
                  child: Text('Pharmacies',
                      style: GoogleFonts.robotoCondensed(
                        fontSize: 18,
                      ))),
            
            ],
          ),
          Container(
            height: 130,
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(25, 0, 20, 10),
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              separatorBuilder: (context, _) => SizedBox(width: 10,),
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
                        fontSize: 18,
                      ))),
              Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 18, 20, 20),
                child: Text('See all',
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
                  elevation: 0,
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
        ],
      )),
    );
  }

  Widget buildCard({required CardItem item}) => Container(
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
                  image: NetworkImage(item.urlImage),
                  child: InkWell(
                    onTap: () =>   Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PharmPage(item: item,)))
                  ),
                )
              ),
            ),
          ),
          ),
          const SizedBox(height: 4,),
          //Text(item.title),
      ],
    ),
  );
}

