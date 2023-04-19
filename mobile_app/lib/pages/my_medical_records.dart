import 'package:flutter/material.dart';
import 'package:mobile_app/classes/Allmenu_form.dart';
import 'package:mobile_app/pages/all_menu.dart';
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
  static List<String> exminName = [
    'Complete blood culture',
    'Knee MRI',
    'Heart'
  ];
  static List byname = ['alfa lab', 'alfa scan', 'Ga3fr el3omda'];
  static List pic = ['lab.png', 'rad.png', 'doctor.png'];
  static List report = [
    '',
    'TextSpan is a little strange',
    'TextSpan is a little strange'
  ];
  static List others = [
    'TextSpan is a little strange. The text parameter is the default style but the children list contains the styled',
    'very good',
    'pruffen'
  ];
  final List<Allmenu> alldata = List.generate(
      exminName.length,
      (index) => Allmenu(
            exminName: exminName[index],
            report: '${report[index]}',
            pic: '${pic[index]}',
            byname: '${byname[index]}',
            others: '${others[index]}',
          ));
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
                itemCount: alldata.length,
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
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => all_menu(
                                    allmenu: alldata[index],
                                  )));
                        },
                        title: Text(alldata[index].exminName),
                        subtitle: Text(alldata[index].byname),
                        leading: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/${alldata[index].pic}')),
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
