import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'classes/All_menu.dart';

class rad_scans extends StatefulWidget {
  const rad_scans({super.key});

  @override
  State<rad_scans> createState() => _rad_scansState();
}

class _rad_scansState extends State<rad_scans> {
  List<All_menu> all_menu_items = [
    All_menu(exmination: 'Knee MRI', name: 'alfa scan', pic: 'rad.png'),
    All_menu(exmination: 'leg MRI', name: 'alfa scan', pic: 'rad.png'),
    All_menu(exmination: 'brain CT', name: 'alfa scan', pic: 'rad.png'),
    All_menu(exmination: 'Knee MRI', name: 'alfa scan', pic: 'rad.png'),
    All_menu(exmination: 'HAND MRI', name: 'alfa scan', pic: 'rad.png'),
    All_menu(exmination: 'lung x-ray', name: 'alfa scan', pic: 'rad.png'),
    All_menu(exmination: 'mamography ', name: 'alfa scan', pic: 'rad.png'),
    All_menu(exmination: 'Knee MRI', name: 'alfa scan', pic: 'rad.png'),
    All_menu(exmination: 'HAND MRI', name: 'alfa scan', pic: 'rad.png'),
    All_menu(exmination: 'lung x-ray', name: 'alfa scan', pic: 'rad.png'),
    All_menu(exmination: 'mamography ', name: 'alfa scan', pic: 'rad.png'),
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
                            print('${all_menu_items[index].exmination}');
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
