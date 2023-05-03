import 'package:flutter/material.dart';
import 'package:mobile_app/classes/liverfun_form.dart';
import 'package:mobile_app/colors.dart';

class LiverTestpage extends StatelessWidget {
  final Liverfunform liverform;
  const LiverTestpage({Key? key, required this.liverform}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(liverform.testname_liver),
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
                                AssetImage('assets/${liverform.pic_liver}')),
                        title: Text('Lab name: ${liverform.labname_liver}'),
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
                  height: 210,
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    shadowColor: Colors.greenAccent,
                    child: Row(
                      children: [
                        Expanded(
                          child: ListView(
                            children: liverform.testAtts_liver.map((item) {
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
                            children: liverform.result_liver.map((item) {
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
                            children: liverform.unit_liver.map((item) {
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
                            children: liverform.range_liver.map((item) {
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
                            liverform.notes_liver,
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
