import 'package:flutter/material.dart';
import 'package:mobile_app/pages/rad_report.dart';

import '../classes/all_menu.dart';

class rad_scans extends StatefulWidget {
  const rad_scans({super.key});

  @override
  State<rad_scans> createState() => _rad_scansState();
}

class _rad_scansState extends State<rad_scans> {
  List<Allmenu> Allmenu_items = [
    Allmenu(exmination: 'Knee MRI', name: 'alfa scan', pic: 'rad.png'),
    Allmenu(exmination: 'leg MRI', name: 'alfa scan', pic: 'rad.png'),
    Allmenu(exmination: 'brain CT', name: 'alfa scan', pic: 'rad.png'),
    Allmenu(exmination: 'Knee MRI', name: 'alfa scan', pic: 'rad.png'),
    Allmenu(exmination: 'HAND MRI', name: 'alfa scan', pic: 'rad.png'),
    Allmenu(exmination: 'lung x-ray', name: 'alfa scan', pic: 'rad.png'),
    Allmenu(exmination: 'mamography ', name: 'alfa scan', pic: 'rad.png'),
    Allmenu(exmination: 'Knee MRI', name: 'alfa scan', pic: 'rad.png'),
    Allmenu(exmination: 'HAND MRI', name: 'alfa scan', pic: 'rad.png'),
    Allmenu(exmination: 'lung x-ray', name: 'alfa scan', pic: 'rad.png'),
    Allmenu(exmination: 'mamography ', name: 'alfa scan', pic: 'rad.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radiology Scans'),
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
                  controller: ScrollController(),
                  shrinkWrap: true,
                  itemCount: Allmenu_items.length,
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
                                  builder: (context) => const rad_report()),
                            );
                          },
                          title: Text(Allmenu_items[index].exmination),
                          subtitle: Text(Allmenu_items[index].name),
                          leading: CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/${Allmenu_items[index].pic}')),
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
