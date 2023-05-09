import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_app/api/user.dart';
import 'package:mobile_app/configure.dart';
import 'package:mobile_app/pages/liverfun_testpage.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

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

  Future<void> fetchLiverList(int patientId) async {
    final response = await http
        .get(Uri.parse('${AppUrl.Base_Url}/LiverFunc/patient/$patientId'));

    if (response.statusCode == 200) {
      final List<dynamic> liverJsonList = jsonDecode(response.body);
      final List<Map<String, dynamic>> liverList = [];
      for (final liverJson in liverJsonList) {
        liverList.add(Map<String, dynamic>.from(liverJson));
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
                          liver['examination_Date'] ?? '',
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ],
                    ),
                    subtitle: Text(liver['labName'] ?? ''),
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
