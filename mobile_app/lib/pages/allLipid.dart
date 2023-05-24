import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_app/api/user.dart';
import 'package:mobile_app/configure.dart';
import 'package:mobile_app/pages/lipid_testpage.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../colors.dart';

class allLipid extends StatefulWidget {
  const allLipid({super.key});

  @override
  State<allLipid> createState() => _allLipidState();
}

class _allLipidState extends State<allLipid> {
  List<dynamic> lipidList = [];

  @override
  void initState() {
    super.initState();
    int userId = Provider.of<UserIdProvider>(context, listen: false).id!;
    fetchLipidList(userId);
  }

  Future<void> fetchLipidList(int patientId) async {
    final response = await http
        .get(Uri.parse('${AppUrl.Base_Url}/lipid/patient/$patientId'));

    if (response.statusCode == 200) {
      final List<dynamic> lipidJsonList = jsonDecode(response.body);
      final List<Map<String, dynamic>> lipidList = [];
      for (final lipidJson in lipidJsonList) {
        lipidList.add(Map<String, dynamic>.from(lipidJson));

        final entityData = await fetcEntityById(lipidJson['entity_id'] ?? 0);
        final entityName = entityData['name'] ?? 'not specified';
        lipidList.last['entityName'] = entityName;
      }
      setState(() {
        this.lipidList = lipidList;
      });
    } else {
      throw Exception('Failed to fetch lipid profile list');
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
        title: Text('Lipid profile results'),
        centerTitle: true,
        backgroundColor: primary,
        shadowColor: Colors.greenAccent,
        elevation: 10,
      ),
      body: lipidList.isEmpty
          ? Center(
              child: Text(
              'You dont have any Results yet',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ))
          : Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: ScrollController(),
                    itemCount: lipidList.length,
                    itemBuilder: (context, index) {
                      final lipid = lipidList[index];
                      String dateTimeString = lipid['updated_at'];

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
                                      LipTestpage(lipid: lipidList[index])));
                            },
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Lipid profile test'),
                                Text(
                                  date,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black54),
                                ),
                              ],
                            ),
                            subtitle: Text(lipid['entityName'] ?? 0),
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
