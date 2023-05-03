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
                  height: 420,
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    shadowColor: Colors.greenAccent,
                    child: Row(
                      children: [
                        Expanded(
                          child: ListView(
                            children: lipform.testAtts_Lip.map((item) {
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
                            children: lipform.result_Lip.map((item) {
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(70, 30, 0, 0),
                                child: Text(item),
                              );
                            }).toList(),
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            children: lipform.unit_Lip.map((item) {
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 30, 0, 0),
                                child: Text(item),
                              );
                            }).toList(),
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            children: lipform.range_Lip.map((item) {
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 30, 0, 0),
                                child: Text(
                                  item,
                                  style: TextStyle(fontSize: 6.7),
                                ),
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
