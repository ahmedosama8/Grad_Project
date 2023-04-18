import 'package:flutter/material.dart';
import 'package:mobile_app/classes/All_menu.dart';
import 'package:mobile_app/pages/doctor_visit.dart';
import 'package:mobile_app/pages/lab_results.dart';
import 'package:mobile_app/pages/rad_scans.dart';

class My_Medical_Records extends StatefulWidget {
  const My_Medical_Records({super.key});

  @override
  State<My_Medical_Records> createState() => _My_Medical_RecordsState();
}

class _My_Medical_RecordsState extends State<My_Medical_Records> {
  // This controller will store the value of the search bar
  final TextEditingController _searchController = TextEditingController();
  List<All_menu> all_menu_items = [
    All_menu(
        exmination: 'complete blood culture', name: 'alfa lab', pic: 'lab.png'),
    All_menu(exmination: 'Knee MRI', name: 'alfa scan', pic: 'rad.png'),
    All_menu(exmination: 'heart', name: 'Dr.fathy', pic: 'doctor.png'),
    All_menu(exmination: 'Leg', name: 'Dr.ibraheem', pic: 'doctor.png'),
    All_menu(
        exmination: 'complete blood culture', name: 'alfa lab', pic: 'lab.png'),
    All_menu(exmination: 'Knee MRI', name: 'alfa scan', pic: 'rad.png'),
    All_menu(exmination: 'heart', name: 'Dr.fathy', pic: 'doctor.png'),
    All_menu(exmination: 'Leg', name: 'Dr.ibraheem', pic: 'doctor.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(201, 244, 246, 245),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
          child: Text(
            'Medical Records',
            style: TextStyle(
              color: Colors.black,
              fontSize: 35,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 100,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                onSubmitted: (value) {
                  print(_searchController.text);
                },
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () => _searchController.clear(),
                  ),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 8, 0, 0),
            child: Row(
              children: [
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
                            builder: (context) => const lab_results()),
                      );
                    },
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Icon(
                          Icons.biotech,
                          color: Colors.blueAccent,
                          size: 40,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Lab results',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.black),
                        ),
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
                            builder: (context) => const rad_scans()),
                      );
                    },
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Icon(
                          Icons.content_paste,
                          size: 40,
                          color: Colors.lightGreen,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Rad-Scans',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.black),
                        ),
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
                            builder: (context) => const doctor_visit()),
                      );
                    },
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Icon(
                          Icons.health_and_safety,
                          size: 40,
                          color: Colors.redAccent,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Doctors Visit',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 1, 50, 0),
            child: Row(
              children: [
                Text(
                  'All',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
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
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: ListTile(
                        onTap: (  
                        ) {print('tapped');},
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
    );
  }
}
