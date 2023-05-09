import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_app/api/user.dart';
import 'package:mobile_app/configure.dart';
import 'package:mobile_app/pages/lipid_testpage.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

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
        .get(Uri.parse('${AppUrl.Base_Url}/LipidProfile/patient/$patientId'));

    if (response.statusCode == 200) {
      final List<dynamic> lipidJsonList = jsonDecode(response.body);
      final List<Map<String, dynamic>> lipidList = [];
      for (final lipidJson in lipidJsonList) {
        lipidList.add(Map<String, dynamic>.from(lipidJson));
      }
      setState(() {
        this.lipidList = lipidList;
      });
    } else {
      throw Exception('Failed to fetch lipid profile list');
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
      body: Column(
        children: [
          SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              controller: ScrollController(),
              itemCount: lipidList.length,
              itemBuilder: (context, index) {
                final lipid = lipidList[index];
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
                                LipTestpage(lipid: lipidList[index])));
                      },
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Lipid profile test'),
                          Text(
                            lipid['examination_Date'] ?? '',
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                        ],
                      ),
                      subtitle: Text(lipid['labName'] ?? ''),
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
