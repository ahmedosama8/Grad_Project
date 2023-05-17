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
                                'ALT',
                                style: TextStyle(
                                  color:
                                      (liver['alt'] < 10 || liver['alt'] > 130)
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                liver['alt'].toString(),
                                style: TextStyle(
                                  color:
                                      (liver['alt'] < 10 || liver['alt'] > 130)
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                'U/L',
                                style: TextStyle(
                                  color:
                                      (liver['alt'] < 10 || liver['alt'] > 130)
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                '10-130',
                                style: TextStyle(
                                  color:
                                      (liver['alt'] < 10 || liver['alt'] > 130)
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
                                'AST',
                                style: TextStyle(
                                  color:
                                      (liver['ast'] < 10 || liver['ast'] > 34)
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                liver['ast'].toString(),
                                style: TextStyle(
                                  color:
                                      (liver['ast'] < 10 || liver['ast'] > 34)
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                'U/L',
                                style: TextStyle(
                                  color:
                                      (liver['ast'] < 10 || liver['ast'] > 34)
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                '10-34',
                                style: TextStyle(
                                  color:
                                      (liver['ast'] < 10 || liver['ast'] > 34)
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
                                'ALB',
                                style: TextStyle(
                                  color:
                                      (liver['alb'] < 3.4 || liver['alb'] > 5.4)
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                liver['alb'].toString(),
                                style: TextStyle(
                                  color:
                                      (liver['alb'] < 3.4 || liver['alb'] > 5.4)
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                'g/dL',
                                style: TextStyle(
                                  color:
                                      (liver['alb'] < 3.4 || liver['alb'] > 5.4)
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                '3.4-5.4',
                                style: TextStyle(
                                  color:
                                      (liver['alb'] < 3.4 || liver['alb'] > 5.4)
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
                                'DBIL',
                                style: TextStyle(
                                  color:
                                      (liver['dbil'] < 0 || liver['dbil'] > 0.4)
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                liver['dbil'].toString(),
                                style: TextStyle(
                                  color:
                                      (liver['dbil'] < 0 || liver['dbil'] > 0.4)
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                'mg/dL',
                                style: TextStyle(
                                  color:
                                      (liver['dbil'] < 0 || liver['dbil'] > 0.4)
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                '0-0.4',
                                style: TextStyle(
                                  color:
                                      (liver['dbil'] < 0 || liver['dbil'] > 0.4)
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
                                'TBIL',
                                style: TextStyle(
                                  color: (liver['tbil'] < 0.1 ||
                                          liver['tbil'] > 1.2)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                liver['tbil'].toString(),
                                style: TextStyle(
                                  color: (liver['tbil'] < 0.1 ||
                                          liver['tbil'] > 1.2)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                'mg/dL',
                                style: TextStyle(
                                  color: (liver['tbil'] < 0.1 ||
                                          liver['tbil'] > 1.2)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '0.1-1.2',
                                style: TextStyle(
                                  color: (liver['tbil'] < 0.1 ||
                                          liver['tbil'] > 1.2)
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
                                'ALP',
                                style: TextStyle(
                                  color:
                                      (liver['alp'] < 24 || liver['alp'] > 147)
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                liver['alp'].toString(),
                                style: TextStyle(
                                  color:
                                      (liver['alp'] < 24 || liver['alp'] > 147)
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                'U/L',
                                style: TextStyle(
                                  color:
                                      (liver['alp'] < 24 || liver['alp'] > 147)
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                '24-147',
                                style: TextStyle(
                                  color:
                                      (liver['alp'] < 24 || liver['alp'] > 147)
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
