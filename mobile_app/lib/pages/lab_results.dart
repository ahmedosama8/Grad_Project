import 'package:flutter/material.dart';
import 'package:mobile_app/colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobile_app/pages/glucose_testpage.dart';

// ignore: camel_case_types
class lab_results extends StatefulWidget {
  const lab_results({super.key});

  @override
  State<lab_results> createState() => _lab_resultsState();
}

// ignore: camel_case_types
class _lab_resultsState extends State<lab_results> {
  List<dynamic> glucoseList = [];
  @override
  void initState() {
    super.initState();
    fetchGlucoseList();
  }

  Future<void> fetchGlucoseList() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8080/Glucose/patient/52'));

    if (response.statusCode == 200) {
      final List<dynamic> glucoseJsonList = jsonDecode(response.body);
      final List<Map<String, dynamic>> glucoseList = [];
      for (final glucoseJson in glucoseJsonList) {
        glucoseList.add(Map<String, dynamic>.from(glucoseJson));
      }
      setState(() {
        this.glucoseList = glucoseList;
      });
    } else {
      throw Exception('Failed to fetch glucose list');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lab results'),
        centerTitle: true,
        backgroundColor: primary,
        shadowColor: Colors.greenAccent,
        elevation: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(children: const [
                Text(
                  'CBC tests',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ]),
              Row(children: const [
                Text(
                  'Liver function tests',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ]),
              Row(children: const [
                Text(
                  'Glucose tests',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ]),
              SizedBox(
                height: 300,
                child: SingleChildScrollView(
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: ScrollController(),
                    itemCount: glucoseList.length,
                    itemBuilder: (context, index) {
                      final glucose = glucoseList[index];
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
                                  builder: (context) => GluTestpage(
                                      glucose: glucoseList[index])));
                            },
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Glucose test'),
                                Text(
                                  glucose['examination_Date'] ??
                                      'no date specfied',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black54),
                                ),
                              ],
                            ),
                            subtitle: Text('lab name'),
                            leading: CircleAvatar(
                                backgroundImage: AssetImage('assets/lab.png')),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Row(children: const [
                Text(
                  'Urine tests',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
