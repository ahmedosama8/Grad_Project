import 'package:flutter/material.dart';
import 'package:mobile_app/colors.dart';
import 'package:flutter_html/flutter_html.dart';

class rad_report extends StatelessWidget {
  final Map<String, dynamic> scans;

  const rad_report({Key? key, required this.scans}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(scans['examined_part'] ?? ''),
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
                        leading: Icon(Icons.local_hospital),
                        title: Text('Radiology Center: ${scans['entityName']}'),
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
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/doctor.png'),
                        ),
                        title: Text('perfromed by: ${scans['performer']}'),
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
                          child: Text(
                            scans['report'] ?? 'no report',
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
                        title: Text('Comments'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: SingleChildScrollView(
                              child: Html(
                            data: scans['comments'] ?? '',
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
