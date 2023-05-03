import 'package:flutter/material.dart';
import 'package:mobile_app/classes/cbc_form.dart';
import 'package:mobile_app/colors.dart';
import 'package:mobile_app/pages/cbc_testpage.dart';

// ignore: camel_case_types
class lab_results extends StatefulWidget {
  const lab_results({super.key});

  @override
  State<lab_results> createState() => _lab_resultsState();
}

// ignore: camel_case_types
class _lab_resultsState extends State<lab_results> {
  ////////CBC/////////////////////////
  static List<String> testname = ['CBC'];
  static List testAtts = [
    'Haemoglobin :',
    'Hematocrit :',
    'Red Cell Count :',
    'MCV :',
    'MCH :',
    'MCHC :',
    'RDW :',
    'Platelet Count :',
    'T.L.C :',
    'Basophils :',
    'Eosinophils :',
    'Stab :',
    'Segmented :',
    'Lymphocytes :',
    'Monocytes :',
  ];
  static List results = [];
  static List range = [
    '13-17',
    '40-50',
    '4.5-6.2',
    '78-96',
    '26-32',
    '31-36',
    '11.5-14.5',
    '150-450',
    '4-11',
    '0-1',
    '0-6',
    '0-7',
    '40-75',
    '20-45',
    '1-10'
  ];
  static List unit = [
    'g/dL',
    '%',
    'x10^6/uL',
    'fL',
    'fL',
    'pg',
    'g/dl',
    '%',
    'x10^3/uL',
    'x10^3/uL',
    '%',
    '%',
    '%',
    '%',
    '%'
  ];
  static List notes = [];
  static List labname = ['alfa lab'];
  static List<String> date = ['19/12/2022'];

  final List<Cbcform> cbcdata = List.generate(
      testname.length,
      (index) => Cbcform(
          testname: testname[index],
          testAtts: testAtts,
          range: range,
          result: results,
          unit: unit,
          notes: '$notes',
          labname: '$labname',
          date: date[index],
          pic: 'lab.png'));
///////////////////////////////////////////////////////////
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
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  controller: ScrollController(),
                  itemCount: cbcdata.length,
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
                                    CbcTestpage(cbcform: cbcdata[index])));
                          },
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(cbcdata[index].testname),
                              Text(
                                cbcdata[index].date,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black54),
                              ),
                            ],
                          ),
                          subtitle: Text(cbcdata[index].labname),
                          leading: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/${cbcdata[index].pic}')),
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
