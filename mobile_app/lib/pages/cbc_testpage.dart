import 'package:flutter/material.dart';
import 'package:mobile_app/classes/cbc_form.dart';
import 'package:mobile_app/colors.dart';

class CbcTestpage extends StatelessWidget {
  final Cbcform cbcform;
  const CbcTestpage({Key? key, required this.cbcform}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cbcform.testname),
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
                                AssetImage('assets/${cbcform.pic}')),
                        title: Text('Lab name: ${cbcform.labname}'),
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
                  height: 500,
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    shadowColor: Colors.greenAccent,
                    child: Row(
                      children: [
                        Expanded(
                          child: ListView(
                            children: cbcform.testAtts.map((item) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                child: Text(
                                  item,
                                  style: TextStyle(fontSize: 13.5),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            children: cbcform.result.map((item) {
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
                            children: cbcform.unit.map((item) {
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
                            children: cbcform.range.map((item) {
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
                            cbcform.notes,
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
