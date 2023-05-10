import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:mobile_app/pages/glucose_testpage.dart';
import 'package:provider/provider.dart';

import '../api/user.dart';
import '../colors.dart';
import '../configure.dart';

class allGlucose extends StatefulWidget {
  const allGlucose({super.key});

  @override
  State<allGlucose> createState() => _allGlucoseState();
}

class _allGlucoseState extends State<allGlucose> {
  List<dynamic> glucoseList = [];
  @override
  void initState() {
    super.initState();
    int userId = Provider.of<UserIdProvider>(context, listen: false).id!;
    fetchGlucoseList(userId);
  }

  Future<void> fetchGlucoseList(int patientId) async {
    final response = await http
        .get(Uri.parse('${AppUrl.Base_Url}/Glucose/patient/$patientId'));

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
          title: Text('Glucose results'),
          centerTitle: true,
          backgroundColor: primary,
          shadowColor: Colors.greenAccent,
          elevation: 10,
        ),
        body: Column(children: [
          SingleChildScrollView(
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
                      borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                GluTestpage(glucose: glucoseList[index])));
                      },
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Glucose test'),
                          Text(
                            glucose['examination_Date'] ?? '',
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                        ],
                      ),
                      subtitle: Text(glucose['labName'] ?? ''),
                      leading: CircleAvatar(
                          backgroundImage: AssetImage('assets/lab.png')),
                    ),
                  ),
                );
              },
            ),
          ),
        ]));
  }
}
