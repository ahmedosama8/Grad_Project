import 'package:flutter/material.dart';
import 'package:mobile_app/classes/Test_form.dart';
import 'package:mobile_app/pages/test_page.dart';

class lab_results extends StatefulWidget {
  const lab_results({super.key});

  @override
  State<lab_results> createState() => _lab_resultsState();
}

class _lab_resultsState extends State<lab_results> {
  static List<String> testname = [
    'CBC',
    'Glucose',
    'liver function',
    'lipid Profile'
  ];
  static List testAtt = [
    'WBC\n RBC\n Hemoglobin\n Hematocrit\n platelates\n',
    'R B G\n R B S\n ',
    'ALT\n AST\n ALB\n DBIL\n TBIL\n ALP\n',
    'ALT (SGPT),serum\n AST (SGOT),serum\n Albumin,serum\n Cholestrol Total, serum\n  HDL-C, serum\n LDL-C,serum\n Triglycerides,serum\n'
  ];
  static List results = [
    '36\n 34\n 12\n 33\n 30\n',
    '20\n 10\n ',
    '20\n 10\n 20\n 10\n 23\n 45\n',
    '20\n 10\n 20\n 10\n 23\n 45\n 123\n'
  ];
  static List unit = [
    'g/dL\n g/dL\n g/dL\n g/dL\n g/dL\n',
    'mg/dl\n mg/dl\n',
    'U/L\n U/L\n g/dl\n mg/dl\n mg/dl\n U/L\n',
    'U/L\n U/L\n g/dl\n mg/dl\n mg/dl\n mg/dl\n mg/dl\n'
  ];
  static List range = [
    '13 - 17\n 13 - 17\n 13 - 17\n 13 - 17\n 13 - 17\n 13 - 17\n',
    '13 - 17\n 13 - 17\n',
    '13 - 17\n 13 - 17\n 13 - 17\n 13 - 17\n 13 - 17\n 13 - 17\n',
    '13 - 17\n 13 - 17\n 13 - 17\n 13 - 17\n 13 - 17\n 13 - 17\n 13 - 17\n',
  ];
  static List notes = [
    'TextSpan is a little strange. The text parameter is the default style but the children list contains the styled (and possibly unstyled) text that follow it. You can use an empty string for text if you want to start with styled text',
    'very well',
    'need to go to doctor',
    'good',
  ];
  static List labname = [
    'alfa lab',
    'alfa lab',
    'elmokhtabar',
    'trust lab',
  ];

  final List<Testform> testdata = List.generate(
      testname.length,
      (index) => Testform(
          testname: testname[index],
          testAtt: '${testAtt[index]}',
          range: '${range[index]}',
          result: '${results[index]}',
          unit: '${unit[index]}',
          notes: '${notes[index]}',
          labname: '${labname[index]}',
          pic: 'lab.png'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lab results'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
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
                  itemCount: testdata.length,
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
                                builder: (context) => Testpage(
                                      testform: testdata[index],
                                    )));
                          },
                          title: Text(testdata[index].testname),
                          subtitle: Text(testdata[index].labname),
                          leading: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/${testdata[index].pic}')),
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
