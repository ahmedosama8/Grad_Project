import 'package:flutter/material.dart';
import 'package:mobile_app/colors.dart';
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
  //final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: Row(
            children: const [
              Expanded(
                child: Center(
                  child: Text(
                    'Medical Records',
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: primary,
        //toolbarHeight: 100,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 90,
                  ),
                  SizedBox(
                    width: 200,
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
                        // ignore: prefer_const_literals_to_create_immutables
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
                    height: 70,
                  ),
                  SizedBox(
                    width: 200,
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
                        // ignore: prefer_const_literals_to_create_immutables
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
                    height: 70,
                  ),
                  SizedBox(
                    width: 200,
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
                        // ignore: prefer_const_literals_to_create_immutables
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
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(15, 1, 50, 0),
            //   child: Row(
            //     // ignore: prefer_const_literals_to_create_immutables
            //     children: [
            //       Text(
            //         'To be decided later',
            //         style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            //       ),
            //     ],
            //   ),
            // ),
            //Expanded(
            // child: SingleChildScrollView(
            //   child: ListView.builder(
            //     shrinkWrap: true,
            //     controller: ScrollController(),
            //     itemCount: alldata.length,
            //     itemBuilder: (context, index) {
            //       return Padding(
            //         padding: const EdgeInsets.symmetric(
            //             vertical: 1.0, horizontal: 4.0),
            //         child: Card(
            //           shape: RoundedRectangleBorder(
            //             side: BorderSide(
            //               color: Colors.greenAccent,
            //             ),
            //             borderRadius: BorderRadius.circular(20.0),
            //           ),
            //           child: ListTile(
            //             onTap: () {
            //               Navigator.of(context).push(MaterialPageRoute(
            //                   builder: (context) => all_menu(
            //                         allmenu: alldata[index],
            //                       )));
            //             },
            //             title: Text(alldata[index].exminName),
            //             subtitle: Text(alldata[index].byname),
            //             leading: CircleAvatar(
            //                 backgroundImage:
            //                     AssetImage('assets/${alldata[index].pic}')),
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            //0 ),
          ],
        ),
      ),
    );
  }
}
