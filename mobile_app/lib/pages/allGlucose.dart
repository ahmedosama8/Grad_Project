import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:mobile_app/pages/glucose_testpage.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

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
        .get(Uri.parse('${AppUrl.Base_Url}/glucose/patient/$patientId'));

    if (response.statusCode == 200) {
      final List<dynamic> glucoseJsonList = jsonDecode(response.body);
      final List<Map<String, dynamic>> glucoseList = [];

      for (final glucoseJson in glucoseJsonList) {
        glucoseList.add(Map<String, dynamic>.from(glucoseJson));

        // Fetch entity by ID and update the glucoseList with the entity name
        final entityData = await fetcEntityById(glucoseJson['entity_id'] ?? 0);
        final entityName = entityData['name'] ?? 'not specified';
        glucoseList.last['entityName'] = entityName;
      }
      setState(() {
        this.glucoseList = glucoseList;
      });
    } else {
      throw Exception('Failed to fetch glucose list');
    }
  }

  Future<Map<String, dynamic>> fetcEntityById(int entityId) async {
    final response =
        await http.get(Uri.parse('${AppUrl.Base_Url}/entity/$entityId'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to fetch entity');
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
                String dateTimeString = glucose['created_at'];
                DateTime dateTime = DateTime.parse(dateTimeString);
                String date = DateFormat("yyyy-MM-dd").format(dateTime);
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
                            date,
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                        ],
                      ),
                      subtitle: Text(glucose['entityName'] ?? ''),
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
