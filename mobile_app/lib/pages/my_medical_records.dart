import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mobile_app/colors.dart';

class My_Medical_Records extends StatefulWidget {
  const My_Medical_Records({super.key});

  @override
  State<My_Medical_Records> createState() => _My_Medical_RecordsState();
}

class _My_Medical_RecordsState extends State<My_Medical_Records> {
  // This controller will store the value of the search bar
  final TextEditingController _searchController = TextEditingController();
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
                          backgroundColor: Color.fromARGB(175, 255, 255, 255)),
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
                                fontWeight: FontWeight.bold, fontSize: 13),
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
                          backgroundColor: Color.fromARGB(175, 255, 255, 255)),
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
                                fontWeight: FontWeight.bold, fontSize: 13),
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
                          backgroundColor: Color.fromARGB(175, 255, 255, 255)),
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
                                fontWeight: FontWeight.bold, fontSize: 12),
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
          ],
        ),
      ),
    );
  }
}
