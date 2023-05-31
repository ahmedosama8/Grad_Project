import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_app/notifications_service.dart';
import 'package:mobile_app/pages/cbc_testpage.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import '../api/user.dart';
import '../colors.dart';
import '../configure.dart';

class allCbc extends StatefulWidget {
  const allCbc({super.key});

  @override
  State<allCbc> createState() => _allCbcState();
}

class _allCbcState extends State<allCbc> {
  List<Map<String, dynamic>> cbcList = []; // State variable

  void getCbcList(int patientId) {
    fetchCbcList(patientId).then((list) {
      setState(() {
        cbcList = list;
      });
    }).catchError((error) {
      // Handle error
      print('Error: $error');
    });
  }

  @override
  void initState() {
    super.initState();
    int userId = Provider.of<UserIdProvider>(context, listen: false).id!;
    getCbcList(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CBC results'),
          centerTitle: true,
          backgroundColor: primary,
          shadowColor: Colors.greenAccent,
          elevation: 10,
        ),
        body: cbcList.isEmpty
            ? Center(
                child: Text(
                'You dont have any Results yet',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ))
            : Column(children: [
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: ScrollController(),
                    itemCount: cbcList.length,
                    itemBuilder: (context, index) {
                      final cbc = cbcList[index];
                      String dateTimeString = cbc['updated_at'];

                      DateTime dateTime = DateTime.parse(dateTimeString);
                      String date = DateFormat("dd-MM-yyyy").format(dateTime);
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
                                  builder: (context) =>
                                      CbcTestpage(cbc: cbcList[index])));
                            },
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('CBC test'),
                                Text(
                                  date,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black54),
                                ),
                              ],
                            ),
                            subtitle: Text(cbc['entityName'] ?? ''), //labname
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

Future<List<Map<String, dynamic>>> fetchCbcList(int patientId) async {
  final response =
      await http.get(Uri.parse('${AppUrl.Base_Url}/cbc/patient/$patientId'));

  if (response.statusCode == 200) {
    final List<dynamic> cbcJsonList = jsonDecode(response.body);
    final List<Map<String, dynamic>> cbcList = [];

    for (final cbcJson in cbcJsonList) {
      final cbcData = Map<String, dynamic>.from(cbcJson);
      final entityData = await fetcEntityById(cbcJson['entity_id'] ?? 0);
      final entityName = entityData['name'] ?? 'not specified';
      cbcData['entityName'] = entityName;
      cbcList.add(cbcData);
    }
    await NotficationService.showNotification(
      title: 'New medical record',
      body: 'Its a cbc test from ${cbcList.last['entityName']}.',
      scheduled: true,
      interval: 10, // Single notification, not repeating
      // Date in "2023-05-26" format
    );
    return cbcList;
  } else {
    throw Exception('Failed to fetch CBC list');
  }
}
