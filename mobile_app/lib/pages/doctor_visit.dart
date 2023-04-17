import 'package:flutter/material.dart';
import 'package:mobile_app/pages/doctor_report.dart';
import '../classes/All_menu.dart';

class doctor_visit extends StatefulWidget {
  const doctor_visit({super.key});

  @override
  State<doctor_visit> createState() => _doctor_visitState();
}

class _doctor_visitState extends State<doctor_visit> {
  List<All_menu> all_menu_items = [
    All_menu(exmination: 'heart', name: 'Dr.fathy', pic: 'doctor.png'),
    All_menu(exmination: 'knee injury', name: 'Dr.ibraheem', pic: 'doctor.png'),
    All_menu(exmination: 'heart', name: 'Dr.fathy', pic: 'doctor.png'),
    All_menu(exmination: 'muscles', name: 'Dr.ibraheem', pic: 'doctor.png'),
    All_menu(exmination: 'heart', name: 'Dr.fathy', pic: 'doctor.png'),
    All_menu(exmination: ' brain', name: 'Dr.ibraheem', pic: 'doctor.png'),
    All_menu(exmination: 'leg', name: 'Dr.fathy', pic: 'doctor.png'),
    All_menu(
        exmination: 'lala  lalala', name: 'Dr.ibraheem', pic: 'doctor.png'),
    All_menu(exmination: 'heart', name: 'Dr.fathy', pic: 'doctor.png'),
    All_menu(exmination: 'knee injury', name: 'Dr.ibraheem', pic: 'doctor.png'),
    All_menu(exmination: 'heart', name: 'Dr.fathy', pic: 'doctor.png'),
    All_menu(exmination: 'muscles', name: 'Dr.ibraheem', pic: 'doctor.png'),
    All_menu(exmination: 'heart', name: 'Dr.fathy', pic: 'doctor.png'),
    All_menu(exmination: ' brain', name: 'Dr.ibraheem', pic: 'doctor.png'),
    All_menu(exmination: 'leg', name: 'Dr.fathy', pic: 'doctor.png'),
    All_menu(
        exmination: 'lala  lalala', name: 'Dr.ibraheem', pic: 'doctor.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Visits'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        shadowColor: Colors.greenAccent,
        elevation: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  controller: ScrollController(),
                  itemCount: all_menu_items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 1.0, horizontal: 4.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.greenAccent,
                          ),
                          borderRadius:
                              BorderRadius.circular(20.0), //<-- SEE HERE
                        ),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const dr_report()),
                            );
                          },
                          title: Text(all_menu_items[index].exmination),
                          subtitle: Text(all_menu_items[index].name),
                          leading: CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/${all_menu_items[index].pic}')),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
