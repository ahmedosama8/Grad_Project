import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mobile_app/classes/All_menu.dart';
import 'package:mobile_app/colors.dart';

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
    All_menu(exmination: 'انف و حنجرة', name: 'Dr.ibraheem', pic: 'doctor.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(201, 244, 246, 245),
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextField(
              onSubmitted: (value) {
                print(_searchController.text);
              },
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                // Add a clear button to the search bar
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () => _searchController.clear(),
                ),
                // Add a search icon or button to the search bar
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
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
                              side: BorderSide(
                                  color: Colors.greenAccent)) // elevation color
                          ),
                      onPressed: () {
                        print('lab results');
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
                              side: BorderSide(
                                  color: Colors.greenAccent)) // elevation color
                          ),
                      onPressed: () {
                        print('reports');
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
                              side: BorderSide(
                                  color: Colors.greenAccent)) // elevation color
                          ),
                      onPressed: () {
                        print('Doctor');
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
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'All',
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
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
