import 'package:flutter/material.dart';
import 'package:mobile_app/classes/cbc_form.dart';
import 'package:mobile_app/classes/glucose_form.dart';
import 'package:mobile_app/classes/lipid_form.dart';
import 'package:mobile_app/classes/liverfun_form.dart';
import 'package:mobile_app/classes/urine_form.dart';
import 'package:mobile_app/colors.dart';
import 'package:mobile_app/pages/cbc_testpage.dart';
import 'package:mobile_app/pages/lipid_testpage.dart';
import 'package:mobile_app/pages/liverfun_testpage.dart';
import 'package:mobile_app/pages/urine_testpage.dart';
import 'glucose_testpage.dart';

// ignore: camel_case_types
class lab_results extends StatefulWidget {
  const lab_results({super.key});

  @override
  State<lab_results> createState() => _lab_resultsState();
}

// ignore: camel_case_types
class _lab_resultsState extends State<lab_results> {
  static List<String> testname_Glu = ['Glucose test'];
  static List testAtts_Glu = [
    'R B G :',
    'R B S :',
  ];
  static List results_Glu = [
    '12',
    '45',
  ];
  static List range_Glu = [
    '---',
    '---',
  ];
  static List unit_Glu = [
    'mg/dL',
    'mg/dL',
  ];
  static List notes_Glu = [];
  static List labname_Glu = [
    'Alfa lab',
  ];
  static List<String> date_Glu = ['30/12/2022'];

  final List<Gluform> gludata = List.generate(
      testname_Glu.length,
      (index) => Gluform(
            testname_Glu: testname_Glu[index],
            testAtts_Glu: testAtts_Glu,
            range_Glu: range_Glu,
            result_Glu: results_Glu,
            unit_Glu: unit_Glu,
            notes_Glu: '$notes_Glu',
            labname_Glu: labname_Glu[index],
            date_Glu: date_Glu[index],
          ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lab results'),
        centerTitle: true,
        backgroundColor: primary,
        shadowColor: Colors.greenAccent,
        elevation: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(children: const [
                Text(
                  'CBC tests',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ]),
              Row(children: const [
                Text(
                  'Liver function tests',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ]),
              Row(children: const [
                Text(
                  'Glucose tests',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ]),
              SizedBox(
                height: 300,
                child: SingleChildScrollView(
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: ScrollController(),
                    itemCount: gludata.length,
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
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      GluTestpage(gluform: gludata[index])));
                            },
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(gludata[index].testname_Glu),
                                Text(
                                  gludata[index].date_Glu,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black54),
                                ),
                              ],
                            ),
                            subtitle: Text(gludata[index].labname_Glu),
                            leading: CircleAvatar(
                                backgroundImage: AssetImage('assets/lab.png')),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Row(children: const [
                Text(
                  'Urine tests',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
