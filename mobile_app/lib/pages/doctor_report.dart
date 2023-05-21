import 'package:flutter/material.dart';
import 'package:mobile_app/colors.dart';
import 'package:flutter_html/flutter_html.dart';

// ignore: import_of_legacy_library_into_null_safe

class dr_report extends StatelessWidget {
  final Map<String, dynamic> visit;

  const dr_report({Key? key, required this.visit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''
            // visit['diagnoses'] ?? '',
            // overflow: TextOverflow.ellipsis,
            ),
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
                          radius: 20,
                          backgroundImage: AssetImage('assets/doctor.png'),
                        ),
                        title: Text('Doctor: ${visit['entityName']}'),
                      ),
                    ],
                  ),
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  shadowColor: Colors.greenAccent,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.medication),
                        title: Text('medications'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            visit['medications'] ?? '',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  shadowColor: Colors.greenAccent,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.note),
                        title: Text('Report'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: SingleChildScrollView(
                              child: Html(
                            data: visit['comments'],
                            style: {
                              'p': Style(
                                margin: EdgeInsets.symmetric(vertical: 8.0),
                                fontSize: FontSize(
                                    18.0), // Set the desired font size here
                              ),
                              'strong': Style(
                                fontWeight: FontWeight.bold,
                                fontSize: FontSize(
                                    20.0), // Set the desired font size here
                              ),
                              'ul': Style(
                                margin: EdgeInsets.symmetric(vertical: 8.0),
                                listStyleType: ListStyleType
                                    .CIRCLE, // Set the bullet point style here
                              ),
                              'li': Style(
                                margin: EdgeInsets.only(bottom: 4.0),
                                fontSize: FontSize(
                                    18.0), // Set the desired font size here
                              ),
                              // Add more styles as needed
                            },
                          )),
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
