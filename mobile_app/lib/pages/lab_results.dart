import 'package:flutter/material.dart';
import 'package:mobile_app/colors.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/pages/cbc_testpage.dart';
import 'dart:convert';
import 'package:mobile_app/pages/glucose_testpage.dart';
import 'package:mobile_app/pages/lipid_testpage.dart';
import 'package:mobile_app/pages/liverfun_testpage.dart';
import 'package:mobile_app/pages/urine_testpage.dart';
import 'package:provider/provider.dart';
import '../api/user.dart';
import '../configure.dart';

// ignore: camel_case_types
class lab_results extends StatefulWidget {
  const lab_results({super.key});

  @override
  State<lab_results> createState() => _lab_resultsState();
}

// ignore: camel_case_types
class _lab_resultsState extends State<lab_results> {
  List<dynamic> glucoseList = [];
  List<dynamic> urineList = [];
  List<dynamic> liverList = [];
  List<dynamic> cbcList = [];
  List<dynamic> lipidList = [];

  @override
  void initState() {
    super.initState();
    int userId = Provider.of<UserIdProvider>(context, listen: false).id!;
    fetchGlucoseList(userId);
    fetchUrineList(userId);
    fetchLipidList(userId);
    fetchLiverList(userId);
    fetchCbcList(userId);
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

  Future<void> fetchGlucoseList(int patientId) async {
    final response = await http
        .get(Uri.parse('${AppUrl.Base_Url}/Glucose/patient/$patientId'));

    if (response.statusCode == 200) {
      final List<dynamic> glucoseJsonList = jsonDecode(response.body);
      final List<Map<String, dynamic>> glucoseList = [];
      for (final glucoseJson in glucoseJsonList) {
        glucoseList.add(Map<String, dynamic>.from(glucoseJson));
      }
      setState(() {
        this.glucoseList = glucoseList;
      });
    } else {
      throw Exception('Failed to fetch glucose list');
    }
  }

  Future<void> fetchUrineList(int patientId) async {
    final response = await http
        .get(Uri.parse('${AppUrl.Base_Url}/UrineTest/patient/$patientId'));

    if (response.statusCode == 200) {
      final List<dynamic> urineJsonList = jsonDecode(response.body);
      final List<Map<String, dynamic>> urineList = [];
      for (final urineJson in urineJsonList) {
        urineList.add(Map<String, dynamic>.from(urineJson));
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
        title: Text('Lab results'),
        centerTitle: true,
        backgroundColor: primary,
        shadowColor: Colors.greenAccent,
        elevation: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(children: const [
                Text(
                  'CBC tests',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ]),
              SizedBox(
                height: 245,
                child: SingleChildScrollView(
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
                                  cbc['examination_Date'] ?? '',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black54),
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
              ),
              Row(children: const [
                Text(
                  'Liver function tests',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ]),
              SizedBox(
                height: 245,
                child: SingleChildScrollView(
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: ScrollController(),
                    itemCount: liverList.length,
                    itemBuilder: (context, index) {
                      final liver = liverList[index];
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
                                      LiverTestpage(liver: liverList[index])));
                            },
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Liver function test'),
                                Text(
                                  liver['examination_Date'] ?? '',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black54),
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
              ),
              Row(children: const [
                Text(
                  'Lipid profile tests',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ]),
              SizedBox(
                height: 245,
                child: SingleChildScrollView(
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
                                  lipid['examination_Date'] ?? '',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black54),
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
              ),
              Row(children: const [
                Text(
                  'Glucose tests',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ]),
              SizedBox(
                height: 245,
                child: SingleChildScrollView(
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: ScrollController(),
                    itemCount: glucoseList.length,
                    itemBuilder: (context, index) {
                      final glucose = glucoseList[index];
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
                                  builder: (context) => GluTestpage(
                                      glucose: glucoseList[index])));
                            },
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Glucose test'),
                                Text(
                                  glucose['examination_Date'] ?? '',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black54),
                                ),
                              ],
                            ),
                            subtitle: Text(glucose['labName'] ?? ''),
                            leading: CircleAvatar(
                                backgroundImage: AssetImage('assets/lab.png')),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Row(children: const [
                Text(
                  'Urine tests',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ]),
              SizedBox(
                height: 245,
                child: SingleChildScrollView(
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: ScrollController(),
                    itemCount: urineList.length,
                    itemBuilder: (context, index) {
                      final urine = urineList[index];
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
                                  urine['examination_Date'] ?? '',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black54),
                                ),
                              ],
                            ),
                            subtitle: Text(urine['labName'] ?? ''),
                            leading: CircleAvatar(
                                backgroundImage: AssetImage('assets/lab.png')),
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
      ),
    );
  }
}
