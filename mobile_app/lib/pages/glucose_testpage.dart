import 'package:flutter/material.dart';
import 'package:mobile_app/colors.dart';

class GluTestpage extends StatelessWidget {
  final Map<String, dynamic> glucose;
  const GluTestpage({Key? key, required this.glucose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Glucose Test'),
        centerTitle: true,
        backgroundColor: primary,
        shadowColor: Colors.greenAccent,
        elevation: 10,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          controller: ScrollController(),
          children: [
            Column(
              children: <Widget>[
                Card(
                  clipBehavior: Clip.antiAlias,
                  shadowColor: Colors.greenAccent,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.local_hospital),
                        title: Row(
                          children: [
                            Text(
                              'Lab :',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(glucose['entityName'] ?? '')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  shadowColor: Colors.greenAccent,
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/doctor.png'),
                        ),
                        title: Row(
                          children: [
                            Text(
                              'Doctor Name: ',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(glucose['referring_doctor'] ?? '')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 140,
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    shadowColor: Colors.greenAccent,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Test'),
                              Text('Result'),
                              Text('Unit'),
                              Text('Range'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'R B G',
                                style: TextStyle(
                                  color: (double.parse(glucose['rbc']) < 20 ||
                                          double.parse(glucose['rbc']) > 45)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                glucose['rbc'].toString(),
                                style: TextStyle(
                                  color: (double.parse(glucose['rbc']) < 20 ||
                                          double.parse(glucose['rbc']) > 45)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                'mg/dL',
                                style: TextStyle(
                                  color: (double.parse(glucose['rbc']) < 20 ||
                                          double.parse(glucose['rbc']) > 45)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '--',
                                style: TextStyle(
                                  color: (double.parse(glucose['rbc']) < 20 ||
                                          double.parse(glucose['rbc']) > 45)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'R B S',
                                style: TextStyle(
                                  color: (double.parse(glucose['rbs']) < 20 ||
                                          double.parse(glucose['rbs']) > 45)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                glucose['rbs'].toString(),
                                style: TextStyle(
                                  color: (double.parse(glucose['rbs']) < 20 ||
                                          double.parse(glucose['rbs']) > 45)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                'mg/dL',
                                style: TextStyle(
                                  color: (double.parse(glucose['rbs']) < 20 ||
                                          double.parse(glucose['rbs']) > 45)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '--',
                                style: TextStyle(
                                  color: (double.parse(glucose['rbs']) < 20 ||
                                          double.parse(glucose['rbs']) > 45)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.note),
                        title: Text(
                          'notes',
                          style: TextStyle(
                            color: glucose['comments'] != null
                                ? Colors.red
                                : Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            glucose['comments'] ?? '',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
