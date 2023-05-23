import 'package:mobile_app/pages/doctor_report.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_app/api/doctor.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../api/user.dart';
import '../colors.dart';
import '../configure.dart';

class doctor_visit extends StatefulWidget {
  const doctor_visit({super.key});

  @override
  State<doctor_visit> createState() => _doctor_visitState();
}

class _doctor_visitState extends State<doctor_visit> {
  List<dynamic> visitList = [];
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

  Future<void> fetchVisitList(int patientId) async {
    final response = await http
        .get(Uri.parse('${AppUrl.Base_Url}/visit/patient/$patientId'));

    if (response.statusCode == 200) {
      final List<dynamic> visitJsonList = jsonDecode(response.body);
      final List<Map<String, dynamic>> visitList = [];

      for (final visitJson in visitJsonList) {
        visitList.add(Map<String, dynamic>.from(visitJson));
        final entityData = await fetcEntityById(visitJson['entity_id'] ?? 0);
        final entityName = entityData['name'] ?? 'not specified';
        visitList.last['entityName'] = entityName;
      }

      setState(() {
        this.visitList = visitList;
      });
    } else {
      throw Exception('Failed to fetch visits');
    }
  }

  @override
  void initState() {
    super.initState();
    int userId = Provider.of<UserIdProvider>(context, listen: false).id!;
    fetchVisitList(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Visits'),
        centerTitle: true,
        backgroundColor: primary,
        shadowColor: Colors.greenAccent,
        elevation: 10,
      ),
      body: visitList.isEmpty
          ? Center(
              child: Text(
              'You dont have any data yet',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ))
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: SingleChildScrollView(
                      child: ListView.builder(
                        shrinkWrap: true,
                        controller: ScrollController(),
                        itemCount: visitList.length,
                        itemBuilder: (context, index) {
                          final visit = visitList[index];
                          String dateTimeString = visit['created_at'];
                          DateTime dateTime = DateTime.parse(dateTimeString);
                          String date =
                              DateFormat("dd-MM-yyyy").format(dateTime);
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
                                      builder: (context) => dr_report(
                                            visit: visitList[index],
                                          )));
                                },
                                title: SizedBox(
                                  width: double
                                      .infinity, // Set the width to occupy the available space

                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                              visit['diagnosed_by'] ?? '',
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                      ),
                                      Text(
                                        date,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                subtitle: Text(visit['entityName'] ?? ''),
                                leading: CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/doctor.png')),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
