import 'package:flutter/material.dart';

class dr_report extends StatefulWidget {
  const dr_report({super.key});

  @override
  State<dr_report> createState() => _dr_reportState();
}

class _dr_reportState extends State<dr_report> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exmination name'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        shadowColor: Colors.greenAccent,
        elevation: 10,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Card(
              clipBehavior: Clip.antiAlias,
              shadowColor: Colors.greenAccent,
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/doctor.png'),
                    ),
                    title: const Text('Doctor: name'),
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              shadowColor: Colors.greenAccent,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.medication),
                    title: Text('medications'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'panadol,adol,moov',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6), fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              shadowColor: Colors.greenAccent,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.note),
                    title: Text('Report'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Patients may require portable suction machines in their home if they are unable to clear their own secretions for a variety of reasons. This includes patients who are receiving palliative care and find it difficult or impossible to clear their own secretions, individuals with chronic illnesses (COPD, ALS, cystic fibrosis, bronchiectasis, etc.), or patients who have undergone a tracheostomy.',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6), fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
