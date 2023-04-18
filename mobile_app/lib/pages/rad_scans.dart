import 'package:flutter/material.dart';
import 'package:mobile_app/pages/rad_report.dart';
import 'package:mobile_app/classes/rad_form.dart';

class rad_scans extends StatefulWidget {
  const rad_scans({super.key});

  @override
  State<rad_scans> createState() => _rad_scansState();
}

class _rad_scansState extends State<rad_scans> {
  static List<String> exminName = ['Lung', 'hand', 'Brain CT'];
  static List byname = ['andraw tate', 'benzema', 'Ga3fr el3omda'];
  static List report = [
    'TextSpan is a little strange. The text parameter is the default style but the children list contains the styled (and possibly unstyled) text that follow it. You can use an empty string for text if you want to start with styled text',
    'very well',
    'need to go to doctor',
  ];
  static List radname = [
    'alfa scan',
    'nile scan',
    'scan by us',
  ];
  final List<Radform> raddata = List.generate(
      exminName.length,
      (index) => Radform(
          exminName: exminName[index],
          report: '${report[index]}',
          radname: '${radname[index]}',
          byname: '${byname[index]}',
          pic: 'rad.png'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radiology Scans'),
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
                  controller: ScrollController(),
                  shrinkWrap: true,
                  itemCount: raddata.length,
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
                                builder: (context) => rad_report(
                                      radform: raddata[index],
                                    )));
                          },
                          title: Text(raddata[index].exminName),
                          subtitle: Text(raddata[index].radname),
                          leading: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/${raddata[index].pic}')),
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
