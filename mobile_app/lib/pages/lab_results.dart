import 'package:flutter/material.dart';
import 'package:mobile_app/colors.dart';
import 'package:mobile_app/pages/allCbc.dart';
import 'package:mobile_app/pages/allGlucose.dart';
import 'package:mobile_app/pages/allLipid.dart';
import 'package:mobile_app/pages/allLiver.dart';
import 'package:mobile_app/pages/allUrine.dart';

// ignore: camel_case_types
class lab_results extends StatefulWidget {
  const lab_results({super.key});

  @override
  State<lab_results> createState() => _lab_resultsState();
}

// ignore: camel_case_types
class _lab_resultsState extends State<lab_results> {
  @override
  void initState() {
    super.initState();
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
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.greenAccent,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 0,
                child: ListTile(
                  title: Text('Cbc Test menu'),
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset('assets/lab.png'),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => allCbc()));
                  },
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.greenAccent,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 0,
                child: ListTile(
                  title: Text('Glucose Test menu'),
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset('assets/lab.png'),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => allGlucose()));
                  },
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.greenAccent,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 0,
                child: ListTile(
                  title: Text('Urine Test menu'),
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset('assets/lab.png'),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => allUrine()));
                  },
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.greenAccent,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 0,
                child: ListTile(
                  title: Text('Lipid profile Test menu'),
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset('assets/lab.png'),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => allLipid()));
                  },
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.greenAccent,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 0,
                child: ListTile(
                  title: Text('Liver function Test menu'),
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset('assets/lab.png'),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => allLiver()));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
