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
  ////////urine/////////////////////////
  static List<String> testname_Ur = ['Urine'];
  static List testAtts_Ur = [
    'Color :',
    'Clarity :',
    'Specific Gravity:',
    'PH :',
    'Protein :',
    'Glucose :',
    'Ketone :',
    'Urobilinogen :',
    'Bilirubin :',
    'Nitrite :',
    'Pus Cells :',
    'Red Cells :',
    'Epithelial :',
    'Amorphous :',
    'Crystals :',
    'Casts :',
  ];
  static List results_Ur = [
    '12',
    '45',
    '3',
    '70',
    '30',
    '30',
    '12',
    '125',
    '6',
    '0.5',
    '2',
    '5',
    '60',
    '35',
    '5',
    '2',
  ];
  static List range_Ur = [
    'Amberyellow',
    'Clear',
    '2015-1025',
    '4.5-6.5',
    'Negative',
    'Negative',
    'Negative',
    'Normal Trace',
    'Negative',
    'Negative',
    '0:1',
    '0:1',
    'Negative',
    'Negative',
    'Negative',
    'Negative'
  ];
  static List unit_Ur = [
    '--',
    '--',
    '--',
    '--',
    '--',
    '--',
    '--',
    '--',
    '--',
    '--',
    '/HPF',
    '/HPF',
    '/HPF',
    '/HPF',
    '/HPF',
    '/HPF',
  ];
  static List notes_Ur = [];
  static List labname_Ur = [
    'Alfa lab',
  ];
  static List<String> date_Ur = [
    '19/12/2022',
  ];

  final List<Urineform> uridata = List.generate(
      testname_Ur.length,
      (index) => Urineform(
          testname_Ur: testname_Ur[index],
          testAtts_Ur: testAtts_Ur,
          range_Ur: range_Ur,
          result_Ur: results_Ur,
          unit_Ur: unit_Ur,
          notes_Ur: '$notes_Ur',
          labname_Ur: labname_Ur[index],
          date_Ur: date_Ur[index],
          pic_Ur: 'lab.png'));
  ////////CBC/////////////////////////
  static List<String> testname = ['CBC', 'CBC', 'CBC'];
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
  static List labname = [
    'Alfa lab',
    'Alfa lab',
    'Alfa lab',
  ];
  static List<String> date = [
    '19/12/2022',
    '19/12/2022',
    '19/12/2022',
  ];

  final List<Cbcform> cbcdata = List.generate(
      testname.length,
      (index) => Cbcform(
          testname: testname[index],
          testAtts: testAtts,
          range: range,
          result: results,
          unit: unit,
          notes: '$notes',
          labname: labname[index],
          date: date[index],
          pic: 'lab.png'));
///////////////////////////////////////////////////////////
///////////////////////////////LIVERFUNCTION//////////////
  static List<String> testname_liver = ['Liver function test'];
  static List testAtts_liver = [
    'ALT :',
    'AST :',
    'ALB :',
    'DBIL :',
    'TBIL :',
    'ALP :',
  ];
  static List results_liver = [
    '12',
    '45',
    '3',
    '70',
    '30',
    '30',
    '12',
  ];
  static List range_liver = [
    '10-130',
    '10-34',
    '3.4-5.4',
    '0-0.3',
    '0.1-1.2',
    '24-147',
  ];
  static List unit_liver = [
    'U/L',
    'U/L',
    'g/dL',
    'mg/dL',
    'mg/dL',
    'U/L',
  ];
  static List notes_liver = [];
  static List labname_liver = [
    'Alfa lab',
  ];
  static List<String> date_liver = ['30/12/2022'];

  final List<Liverfunform> liverdata = List.generate(
      testname_liver.length,
      (index) => Liverfunform(
          testname_liver: testname_liver[index],
          testAtts_liver: testAtts_liver,
          range_liver: range_liver,
          result_liver: results_liver,
          unit_liver: unit_liver,
          notes_liver: '$notes_liver',
          labname_liver: labname_liver[index],
          date_liver: date_liver[index],
          pic_liver: 'lab.png'));
///////////////////////////////////////////////////////////
//////////////////////////////////Glucose//////////////
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
          pic_Glu: 'lab.png'));
///////////////////////////////////////////////////////////
//////////////////////////////////LIPIDPROFILE//////////////
  static List<String> testname_Lip = ['Lipid profile test'];
  static List testAtts_Lip = [
    'ALT(SGPT),serum :',
    'AST(SGOT),serum :',
    'Albumin,\n serum :',
    'Cholestrol Total,serum:',
    'HDL-C,serum :',
    'LDL-C,serum :',
    'Triglycerides,serum :',
  ];
  static List results_Lip = [
    '12',
    '45',
    '3',
    '70',
    '30',
    '30',
    '12',
  ];
  static List range_Lip = [
    '10-65',
    '0-48',
    '3.5-5.2',
    'Desirable: < 200 mg/dL Borderline High: 200-239 mg/dl High: > or = 240 mg/dL ',
    'Low HDL: < 40 mg/dL  Borderline Low: 40-60 mg/dL Acceptable: > 60 mg/dL',
    'Desirable: < 100 mg/dL Above Desirable: 100-129 mg/dl Borderline High: 130-159 mg/dL High: 160-189 mg/dL Very High: > or =190 mg/dL',
    '< 150 Desirable 150-199 Border High Line 200-499 High\n>=500 Very High',
  ];
  static List unit_Lip = [
    'U/L',
    'U/L',
    'g/dL',
    'mg/dL',
    'mg/dL',
    'mg/dL',
    'mg/dL'
  ];
  static List notes_Lip = [];
  static List labname_Lip = [
    'Alfa lab',
  ];
  static List<String> date_Lip = ['30/12/2022'];

  final List<Lipform> lipdata = List.generate(
      testname_Lip.length,
      (index) => Lipform(
          testname_Lip: testname_Lip[index],
          testAtts_Lip: testAtts_Lip,
          range_Lip: range_Lip,
          result_Lip: results_Lip,
          unit_Lip: unit_Lip,
          notes_Lip: '$notes_Lip',
          labname_Lip: labname_Lip[index],
          date_Lip: date_Lip[index],
          pic_Lip: 'lab.png'));

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
              SizedBox(
                height: 300,
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
              Row(children: const [
                Text(
                  'Liver function tests',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ]),
              SizedBox(
                height: 300,
                child: SingleChildScrollView(
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: ScrollController(),
                    itemCount: liverdata.length,
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
                                  builder: (context) => LiverTestpage(
                                      liverform: liverdata[index])));
                            },
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(liverdata[index].testname_liver),
                                Text(
                                  liverdata[index].date_liver,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black54),
                                ),
                              ],
                            ),
                            subtitle: Text(liverdata[index].labname_liver),
                            leading: CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/${liverdata[index].pic_liver}')),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
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
                                backgroundImage: AssetImage(
                                    'assets/${gludata[index].pic_Glu}')),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Row(children: const [
                Text(
                  'Lipid profile tests',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ]),
              SizedBox(
                height: 300,
                child: SingleChildScrollView(
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: ScrollController(),
                    itemCount: lipdata.length,
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
                                      LipTestpage(lipform: lipdata[index])));
                            },
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(lipdata[index].testname_Lip),
                                Text(
                                  lipdata[index].date_Lip,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black54),
                                ),
                              ],
                            ),
                            subtitle: Text(lipdata[index].labname_Lip),
                            leading: CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/${lipdata[index].pic_Lip}')),
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
              SizedBox(
                height: 300,
                child: SingleChildScrollView(
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: ScrollController(),
                    itemCount: uridata.length,
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
                                      UriTestpage(uriform: uridata[index])));
                            },
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(uridata[index].testname_Ur),
                                Text(
                                  uridata[index].date_Ur,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black54),
                                ),
                              ],
                            ),
                            subtitle: Text(uridata[index].labname_Ur),
                            leading: CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/${uridata[index].pic_Ur}')),
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
      ),
    );
  }
}
