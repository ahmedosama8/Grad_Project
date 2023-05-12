import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_app/api/user.dart';
import 'package:mobile_app/configure.dart';
import 'package:mobile_app/pages/liverfun_testpage.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../colors.dart';

class allLiver extends StatefulWidget {
  const allLiver({super.key});

  @override
  State<allLiver> createState() => _allLiverState();
}

class _allLiverState extends State<allLiver> {
  List<dynamic> liverList = [];

  @override
  void initState() {
    super.initState();
    int userId = Provider.of<UserIdProvider>(context, listen: false).id!;
    fetchLiverList(userId);
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

  Future<void> fetchLiverList(int patientId) async {
    final response = await http
        .get(Uri.parse('${AppUrl.Base_Url}/liver/patient/$patientId'));

    if (response.statusCode == 200) {
      final List<dynamic> liverJsonList = jsonDecode(response.body);
      final List<Map<String, dynamic>> liverList = [];
      for (final liverJson in liverJsonList) {
        liverList.add(Map<String, dynamic>.from(liverJson));
        // Fetch entity by ID and update the glucoseList with the entity name
        final entityData = await fetcEntityById(liverJson['entity_id'] ?? 0);
        final entityName = entityData['name'];

        liverList.last['entityName'] = entityName;
      }
      setState(() {
        this.liverList = liverList;
      });
    } else {
      throw Exception('Failed to fetch liver list');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liver function results'),
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
            itemCount: liverList.length,
            itemBuilder: (context, index) {
              final liver = liverList[index];
              String dateTimeString = liver['updated_at'];

              DateTime dateTime = DateTime.parse(dateTimeString);
              String date = DateFormat("yyyy-MM-dd").format(dateTime);
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
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
                              LiverTestpage(liver: liverList[index])));
                    },
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Liver function test'),
                        Text(
                          date,
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ],
                    ),
                    subtitle: Text(liver['entityName'] ?? ''),
                    leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/lab.png')),
                  ),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
