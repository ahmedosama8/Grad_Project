import 'package:flutter/material.dart';
import 'package:mobile_app/classes/lipid_form.dart';
import 'package:mobile_app/colors.dart';

class LipTestpage extends StatelessWidget {
  final Lipform lipform;
  const LipTestpage({Key? key, required this.lipform}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lipform.testname_Lip),
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
                        leading: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/${lipform.pic_Lip}')),
                        title: Text('Lab name: ${lipform.labname_Lip}'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 560,
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
                            children: const [
                              Text('ALT(SGPT)\nserum'),
                              Text(''),
                              Text('U/L'),
                              Text('10-65'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('AST(SGOT)\nserum'),
                              Text(''),
                              Text('U/L'),
                              Text(' 0-48'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Albumin\nserum'),
                              Text(''),
                              Text('g/dL'),
                              Text('3.5-5.2'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Cholestrol\nTotal\nserum'),
                              Text('100'),
                              Text('mg/dL'),
                              Text(
                                  'Desirable: < 200 mg/dL\nBorderline High: 200-239 mg/dl\nHigh: > or = 240 mg/dL '),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('HDL-C\nserum'),
                              Text('100'),
                              Text('mg/dL'),
                              Text(
                                  'Low HDL: < 40 mg/dL\nBorderline Low: 40-60 mg/dL\nAcceptable: > 60 mg/dL')
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('LDL-C\nserum'),
                              Text('100'),
                              Text('mg/dL'),
                              Text(
                                  'Desirable: < 100 mg/dL\nAbove Desirable: 100-129 mg/dl\nBorderline High: 130-159 mg/dL\nHigh: 160-189 mg/dL\nVery High: > or =190 mg/dL')
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Triglycerides\nserum'),
                              Text('100'),
                              Text('mg/dL'),
                              Text(
                                '< 150 Desirable 150-199\nBorder High Line 200-499 High\n>=500 Very High',
                              )
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
                        title: Text('notes'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            lipform.notes_Lip,
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
