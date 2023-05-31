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
                  height: 230,
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
                              Expanded(child: Text('Test')),
                              Expanded(child: Text('Result')),
                              Expanded(child: Text('Unit')),
                              Expanded(child: Text('Range')),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 10, 10),
                          child: Column(
                            children: [
                              // ignore: unnecessary_null_comparison
                              if (glucose['rbg'] != null &&
                                  double.parse(glucose['rbg']) != 0)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Random\nblood\nglucose',
                                        style: TextStyle(
                                          color: (double.parse(glucose['rbg']) <
                                                      60 ||
                                                  double.parse(glucose['rbg']) >
                                                      160)
                                              ? Colors.red
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        glucose['rbg'].toString(),
                                        style: TextStyle(
                                          color: (double.parse(glucose['rbg']) <
                                                      60 ||
                                                  double.parse(glucose['rbg']) >
                                                      160)
                                              ? Colors.red
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'mg/dL',
                                        style: TextStyle(
                                          color: (double.parse(glucose['rbg']) <
                                                      60 ||
                                                  double.parse(glucose['rbg']) >
                                                      160)
                                              ? Colors.red
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '60 - 160',
                                        style: TextStyle(
                                          color: (double.parse(glucose['rbg']) <
                                                      60 ||
                                                  double.parse(glucose['rbg']) >
                                                      160)
                                              ? Colors.red
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              SizedBox(
                                height: 10,
                              ),
                              if (glucose['fpg'] != null &&
                                  double.parse(glucose['fpg']) != 0)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Fasting plasma glucose',
                                        style: TextStyle(
                                          color: (double.parse(glucose['fpg']) <
                                                      60 ||
                                                  double.parse(glucose['fpg']) >
                                                      110)
                                              ? Colors.red
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        glucose['fpg'].toString(),
                                        style: TextStyle(
                                          color: (double.parse(glucose['fpg']) <
                                                      60 ||
                                                  double.parse(glucose['fpg']) >
                                                      110)
                                              ? Colors.red
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'mg/dL',
                                        style: TextStyle(
                                          color: (double.parse(glucose['fpg']) <
                                                      60 ||
                                                  double.parse(glucose['fpg']) >
                                                      110)
                                              ? Colors.red
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '60 - 110',
                                        style: TextStyle(
                                          color: (double.parse(glucose['fpg']) <
                                                      60 ||
                                                  double.parse(glucose['fpg']) >
                                                      110)
                                              ? Colors.red
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              SizedBox(
                                height: 10,
                              ),
                              if (glucose['ppg'] != null &&
                                  double.parse(glucose['ppg']) != 0)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Postprandial glucose',
                                        style: TextStyle(
                                          color: (double.parse(glucose['ppg']) >
                                                  140)
                                              ? Colors.red
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        glucose['ppg'].toString(),
                                        style: TextStyle(
                                          color: (double.parse(glucose['ppg']) >
                                                  140)
                                              ? Colors.red
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'mg/dL',
                                        style: TextStyle(
                                          color: (double.parse(glucose['ppg']) >
                                                  140)
                                              ? Colors.red
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'less than 140',
                                        style: TextStyle(
                                          color: (double.parse(glucose['ppg']) >
                                                  140)
                                              ? Colors.red
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
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
