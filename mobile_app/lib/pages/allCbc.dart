import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_app/api/doctor.dart';
import 'package:mobile_app/pages/cbc_testpage.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
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
  List<dynamic> cbcList = [];

  @override
  void initState() {
    super.initState();
    int userId = Provider.of<UserIdProvider>(context, listen: false).id!;
    fetchCbcList(userId);
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

  Future<void> fetchCbcList(int patientId) async {
    final response =
        await http.get(Uri.parse('${AppUrl.Base_Url}/cbc/patient/$patientId'));

    if (response.statusCode == 200) {
      final List<dynamic> cbcJsonList = jsonDecode(response.body);
      final List<Map<String, dynamic>> cbcList = [];

      for (final cbcJson in cbcJsonList) {
        cbcList.add(Map<String, dynamic>.from(cbcJson));
        final entityData = await fetcEntityById(cbcJson['entity_id'] ?? 0);
        final entityName = entityData['name'] ?? 'not specified';
        cbcList.last['entityName'] = entityName;
      }

      setState(() {
        this.cbcList = cbcList;
      });
    } else {
      throw Exception('Failed to fetch CBC list');
    }
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
        body: Column(children: [
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
                      borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
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
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54),
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
