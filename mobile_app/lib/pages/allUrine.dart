import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_app/pages/urine_testpage.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../api/user.dart';
import '../colors.dart';
import '../configure.dart';

class allUrine extends StatefulWidget {
  const allUrine({super.key});

  @override
  State<allUrine> createState() => _allUrineState();
}

class _allUrineState extends State<allUrine> {
  List<dynamic> urineList = [];

  @override
  void initState() {
    super.initState();
    int userId = Provider.of<UserIdProvider>(context, listen: false).id!;
    fetchUrineList(userId);
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

  Future<void> fetchUrineList(int patientId) async {
    final response = await http
        .get(Uri.parse('${AppUrl.Base_Url}/urine/patient/$patientId'));

    if (response.statusCode == 200) {
      final List<dynamic> urineJsonList = jsonDecode(response.body);
      final List<Map<String, dynamic>> urineList = [];
      for (final urineJson in urineJsonList) {
        urineList.add(Map<String, dynamic>.from(urineJson));
// Fetch entity by ID and update the glucoseList with the entity name
        final entityData = await fetcEntityById(urineJson['entity_id'] ?? 0);
        final entityName = entityData['name'] ?? 'not specified';
        urineList.last['entityName'] = entityName;
      }
      setState(() {
        this.urineList = urineList;
      });
    } else {
      throw Exception('Failed to fetch urine list');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Urine results'),
        centerTitle: true,
        backgroundColor: primary,
        shadowColor: Colors.greenAccent,
        elevation: 10,
      ),
      body: urineList.isEmpty
          ? Center(
              child: Text(
              'You dont have any Results yet',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ))
          : Column(
              children: [
                SingleChildScrollView(
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: ScrollController(),
                    itemCount: urineList.length,
                    itemBuilder: (context, index) {
                      final urine = urineList[index];
                      String dateTimeString = urine['updated_at'];

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
                                      UriTestpage(urine: urineList[index])));
                            },
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Urine test'),
                                Text(
                                  date,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black54),
                                ),
                              ],
                            ),
                            subtitle: Text(urine['entityName'] ?? 0),
                            leading: CircleAvatar(
                                backgroundImage: AssetImage('assets/lab.png')),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
