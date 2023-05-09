import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_app/pages/cbc_testpage.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

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

  Future<void> fetchCbcList(int patientId) async {
    final response =
        await http.get(Uri.parse('${AppUrl.Base_Url}/CBC/patient/$patientId'));

    if (response.statusCode == 200) {
      final List<dynamic> cbcJsonList = jsonDecode(response.body);
      final List<Map<String, dynamic>> cbcList = [];
      for (final cbcJson in cbcJsonList) {
        cbcList.add(Map<String, dynamic>.from(cbcJson));
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
          SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              controller: ScrollController(),
              itemCount: cbcList.length,
              itemBuilder: (context, index) {
                final cbc = cbcList[index];
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
                            cbc['examination_Date'] ?? '',
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                        ],
                      ),
                      subtitle: Text(cbc['labName'] ?? ''),
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
