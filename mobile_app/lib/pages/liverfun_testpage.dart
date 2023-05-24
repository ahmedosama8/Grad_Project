import 'package:flutter/material.dart';
import 'package:mobile_app/colors.dart';

class LiverTestpage extends StatelessWidget {
  final Map<String, dynamic> liver;
  const LiverTestpage({Key? key, required this.liver}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liver function Test'),
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
                            Text(liver['entityName'] ?? '')
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
                            Text(liver['referring_doctor'] ?? '')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 310,
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'ALT',
                                  style: TextStyle(
                                    color: (double.parse(liver['alt']) < 10 ||
                                            double.parse(liver['alt']) > 130)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  liver['alt'].toString(),
                                  style: TextStyle(
                                    color: (double.parse(liver['alt']) < 10 ||
                                            double.parse(liver['alt']) > 130)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'U/L',
                                  style: TextStyle(
                                    color: (double.parse(liver['alt']) < 10 ||
                                            double.parse(liver['alt']) > 130)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '10-130',
                                  style: TextStyle(
                                    color: (double.parse(liver['alt']) < 10 ||
                                            double.parse(liver['alt']) > 130)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
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
                              Expanded(
                                child: Text(
                                  'AST',
                                  style: TextStyle(
                                    color: (double.parse(liver['ast']) < 10 ||
                                            double.parse(liver['ast']) > 34)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  liver['ast'].toString(),
                                  style: TextStyle(
                                    color: (double.parse(liver['ast']) < 10 ||
                                            double.parse(liver['ast']) > 34)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'U/L',
                                  style: TextStyle(
                                    color: (double.parse(liver['ast']) < 10 ||
                                            double.parse(liver['ast']) > 34)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '10-34',
                                  style: TextStyle(
                                    color: (double.parse(liver['ast']) < 10 ||
                                            double.parse(liver['ast']) > 34)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
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
                              Expanded(
                                child: Text(
                                  'ALB',
                                  style: TextStyle(
                                    color: (double.parse(liver['alb']) < 3.4 ||
                                            double.parse(liver['alb']) > 5.4)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  liver['alb'].toString(),
                                  style: TextStyle(
                                    color: (double.parse(liver['alb']) < 3.4 ||
                                            double.parse(liver['alb']) > 5.4)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'g/dL',
                                  style: TextStyle(
                                    color: (double.parse(liver['alb']) < 3.4 ||
                                            double.parse(liver['alb']) > 5.4)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '3.4-5.4',
                                  style: TextStyle(
                                    color: (double.parse(liver['alb']) < 3.4 ||
                                            double.parse(liver['alb']) > 5.4)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
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
                              Expanded(
                                child: Text(
                                  'DBIL',
                                  style: TextStyle(
                                    color: (double.parse(liver['dbil']) < 0 ||
                                            double.parse(liver['dbil']) > 0.4)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  liver['dbil'].toString(),
                                  style: TextStyle(
                                    color: (double.parse(liver['dbil']) < 0 ||
                                            double.parse(liver['dbil']) > 0.4)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'mg/dL',
                                  style: TextStyle(
                                    color: (double.parse(liver['dbil']) < 0 ||
                                            double.parse(liver['dbil']) > 0.4)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '0-0.4',
                                  style: TextStyle(
                                    color: (double.parse(liver['dbil']) < 0 ||
                                            double.parse(liver['dbil']) > 0.4)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
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
                              Expanded(
                                child: Text(
                                  'TBIL',
                                  style: TextStyle(
                                    color: (double.parse(liver['tbil']) < 0.1 ||
                                            double.parse(liver['tbil']) > 1.2)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  liver['tbil'].toString(),
                                  style: TextStyle(
                                    color: (double.parse(liver['tbil']) < 0.1 ||
                                            double.parse(liver['tbil']) > 1.2)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'mg/dL',
                                  style: TextStyle(
                                    color: (double.parse(liver['tbil']) < 0.1 ||
                                            double.parse(liver['tbil']) > 1.2)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '0.1-1.2',
                                  style: TextStyle(
                                    color: (double.parse(liver['tbil']) < 0.1 ||
                                            double.parse(liver['tbil']) > 1.2)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
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
                              Expanded(
                                child: Text(
                                  'ALP',
                                  style: TextStyle(
                                    color: (double.parse(liver['alp']) < 24 ||
                                            double.parse(liver['alp']) > 147)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  liver['alp'].toString(),
                                  style: TextStyle(
                                    color: (double.parse(liver['alp']) < 24 ||
                                            double.parse(liver['alp']) > 147)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'U/L',
                                  style: TextStyle(
                                    color: (double.parse(liver['alp']) < 24 ||
                                            double.parse(liver['alp']) > 147)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '24-147',
                                  style: TextStyle(
                                    color: (double.parse(liver['alp']) < 24 ||
                                            double.parse(liver['alp']) > 147)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
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
                            color: liver['comments'] != null
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
                            liver['comments'] ?? '',
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
