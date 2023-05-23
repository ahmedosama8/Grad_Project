// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/api/user.dart';
import 'package:mobile_app/colors.dart';
import 'package:mobile_app/configure.dart';
import 'package:mobile_app/pages/pharmacy.dart';
import 'package:provider/provider.dart';

class MedicationsPage extends StatefulWidget {
  @override
  _MedicationsPageState createState() => _MedicationsPageState();
}

class _MedicationsPageState extends State<MedicationsPage> {
  List<String> medications = [];
  List<String> diagnoses = [];

  Future<void> fetchData() async {
    int userId = Provider.of<UserIdProvider>(context, listen: false).id!;
    final response =
        await http.get(Uri.parse('${AppUrl.Base_Url}/visit/patient/$userId'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List<dynamic>;
      setState(() {
        medications =
            data.map<String>((item) => item['medications'] as String).toList();
        diagnoses =
            data.map<String>((item) => item['diagnoses'] as String).toList();
      });
    } else {
      // Handle error response
      print('Failed to fetch data: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: primary,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(),
            color: Colors.white,
          ),
          title: Text(
            'My Medications',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: primary,
        ),
        body: medications.isEmpty
            ? Center(
                child: Text(
                'You dont have any medications',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ))
            :SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<Widget>.generate(
            medications.length,
            (index) {
              List<String> medicationList = medications[index]
                  .replaceAll('[', '')
                  .replaceAll(']', '')
                  .replaceAll('"', '')
                  .split(',');
              List<String> diagnosisList = diagnoses[index]
                  .replaceAll('[', '')
                  .replaceAll(']', '')
                  .replaceAll('"', '')
                  .split(',');

              return Padding(
            padding: const EdgeInsets.fromLTRB(3, 10, 3, 3),
                child: SizedBox(
                  width: 1000, // Set the desired width for the cards
                  child: Card(
                     elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: primary),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (int i = 0; i < medicationList.length; i++)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Medication:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  medicationList[i],
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Its Dose:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  diagnosisList[i],
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(width: 10),
                                
                              ],
                            ),
                            SizedBox(height: 10,),
                            Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primary,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MedicineListPage()),
                                );
                              },
                              child: Text(
                                'Buy now',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      ),
    );
  }
}
