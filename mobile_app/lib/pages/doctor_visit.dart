import 'package:flutter/material.dart';
import 'package:mobile_app/pages/doctor_report.dart';
import 'package:mobile_app/classes/doc_form.dart';

class doctor_visit extends StatefulWidget {
  const doctor_visit({super.key});

  @override
  State<doctor_visit> createState() => _doctor_visitState();
}

class _doctor_visitState extends State<doctor_visit> {
  static List<String> exminName = ['Lung', 'hand', 'Brain '];
  static List drname = ['andraw tate', 'benzema', 'Ga3fr el3omda'];
  static List meds = [
    'moov',
    'panadol',
    'TextSpan is a little strange. The text parameter is the default style but the children list contains the styled (and possibly unstyled) text that follow it. You can use an empty string for text if you want to start with styled text',
  ];
  static List report = [
    'TextSpan is a little strange. The text parameter is the default style but the children list contains the styled (and possibly unstyled) text that follow it. You can use an empty string for text if you want to start with styled text',
    'very well',
    'need to go to doctor',
  ];
  final List<Docform> docdata = List.generate(
      exminName.length,
      (index) => Docform(
          exminName: exminName[index],
          report: '${report[index]}',
          meds: '${meds[index]}',
          drname: '${drname[index]}',
          pic: 'doctor.png'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Visits'),
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
                  itemCount: docdata.length,
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
                                builder: (context) => dr_report(
                                      docform: docdata[index],
                                    )));
                          },
                          title: Text(docdata[index].exminName),
                          subtitle: Text(docdata[index].drname),
                          leading: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/${docdata[index].pic}')),
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
