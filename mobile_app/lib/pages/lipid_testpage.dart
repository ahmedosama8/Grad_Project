import 'package:flutter/material.dart';
import 'package:mobile_app/colors.dart';

class LipTestpage extends StatelessWidget {
  final Map<String, dynamic> lipid;
  const LipTestpage({Key? key, required this.lipid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lipid Profile Test'),
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
                            Text(lipid['entityName'] ?? '')
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
                            Text(lipid['referring_doctor'] ?? '')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 770,
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
                              Text('Test\u00A0\u00A0\u00A0\u00A0\u00A0'),
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
                                'Cholestrol\nTotal\nserum',
                                style: TextStyle(
                                  color: (double.parse(lipid['cholesterol']) >=
                                          240)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                lipid['cholesterol'].toString(),
                                style: TextStyle(
                                  color: (double.parse(lipid['cholesterol']) >=
                                          240)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                'mg/dL',
                                style: TextStyle(
                                  color: (double.parse(lipid['cholesterol']) >=
                                          240)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                'Desirable: < 200 mg/dL\nBorderline High: 200-239 mg/dl\nHigh: > or = 240 mg/dL ',
                                style: TextStyle(
                                  color: (double.parse(lipid['cholesterol']) >=
                                          240)
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
                                'HDL-C\nserum',
                                style: TextStyle(
                                  color: (double.parse(lipid['hdl_c']) < 40)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                lipid['hdl_c'].toString(),
                                style: TextStyle(
                                  color: (double.parse(lipid['hdl_c']) < 40)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                'mg/dL',
                                style: TextStyle(
                                  color: (double.parse(lipid['hdl_c']) < 40)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                'Low HDL: < 40 mg/dL\nBorderline Low: 40-60 mg/dL\nAcceptable: > 60 mg/dL',
                                style: TextStyle(
                                  color: (double.parse(lipid['hdl_c']) < 40)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'LDL-C\nserum',
                                style: TextStyle(
                                  color: (double.parse(lipid['ldl_c']) >= 160)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                lipid['ldl_c'].toString(),
                                style: TextStyle(
                                  color: (double.parse(lipid['ldl_c']) >= 160)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                'mg/dL',
                                style: TextStyle(
                                  color: (double.parse(lipid['ldl_c']) >= 160)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                'Desirable: < 100 mg/dL\nAbove Desirable: 100-129 mg/dl\nBorderline High: 130-159 mg/dL\nHigh: 160-189 mg/dL\nVery High: > or =190 mg/dL',
                                style: TextStyle(
                                  color: (double.parse(lipid['ldl_c']) >= 160)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Triglycerides\nserum',
                                style: TextStyle(
                                  color:
                                      (double.parse(lipid['triglycerides']) >=
                                              150)
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                lipid['triglycerides'].toString(),
                                style: TextStyle(
                                  color:
                                      (double.parse(lipid['triglycerides']) >=
                                              150)
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                'mg/dL',
                                style: TextStyle(
                                  color:
                                      (double.parse(lipid['triglycerides']) >=
                                              150)
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                '< 150 Desirable 150-199\nBorder High Line 200-499 High\n>=500 Very High',
                                style: TextStyle(
                                  color:
                                      (double.parse(lipid['triglycerides']) >=
                                              150)
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Test\u00A0\u00A0\u00A0\u00A0\u00A0'),
                              Text('Result'),
                              Text('Unit'),
                              Text('Range'),
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
                            color: lipid['comments'] != null
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
                            lipid['comments'] ?? '',
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
