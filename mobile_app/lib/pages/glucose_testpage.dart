import 'package:flutter/material.dart';
import 'package:mobile_app/classes/glucose_form.dart';
import 'package:mobile_app/colors.dart';

class GluTestpage extends StatelessWidget {
  final Gluform gluform;
  const GluTestpage({Key? key, required this.gluform}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gluform.testname_Glu),
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
                                AssetImage('assets/${gluform.pic_Glu}')),
                        title: Text('Lab name: ${gluform.labname_Glu}'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Padding(
                    padding: EdgeInsets.only(left: 60),
                    child: Text(
                      'Results    Unit    Range',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.left,
                      // Add left padding
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    shadowColor: Colors.greenAccent,
                    child: Row(
                      children: [
                        Expanded(
                          child: ListView(
                            children: gluform.testAtts_Glu.map((item) {
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 15, 0, 0),
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: 13.5,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            children: gluform.result_Glu.map((item) {
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(70, 15, 0, 0),
                                child: Text(item),
                              );
                            }).toList(),
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            children: gluform.unit_Glu.map((item) {
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 15, 0, 0),
                                child: Text(item),
                              );
                            }).toList(),
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            children: gluform.range_Glu.map((item) {
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 15, 0, 0),
                                child: Text(item),
                              );
                            }).toList(),
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
                            gluform.notes_Glu,
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
