import 'package:flutter/material.dart';
import 'package:mobile_app/classes/urine_form.dart';
import 'package:mobile_app/colors.dart';

class UriTestpage extends StatelessWidget {
  final Urineform uriform;
  const UriTestpage({Key? key, required this.uriform}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(uriform.testname_Ur),
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
                                AssetImage('assets/${uriform.pic_Ur}')),
                        title: Text('Lab name: ${uriform.labname_Ur}'),
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
                  height: 520,
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    shadowColor: Colors.greenAccent,
                    child: Row(
                      children: [
                        Expanded(
                          child: ListView(
                            children: uriform.testAtts_Ur.map((item) {
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 15, 0, 0),
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            children: uriform.result_Ur.map((item) {
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
                            children: uriform.unit_Ur.map((item) {
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
                            children: uriform.range_Ur.map((item) {
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 15, 0, 0),
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
                            uriform.notes_Ur,
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
