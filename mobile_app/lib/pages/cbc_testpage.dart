import 'package:flutter/material.dart';
import 'package:mobile_app/colors.dart';

class CbcTestpage extends StatelessWidget {
  final Map<String, dynamic> cbc;
  const CbcTestpage({Key? key, required this.cbc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CBC Test'),
        centerTitle: true,
        backgroundColor: primary,
        shadowColor: Colors.greenAccent,
        elevation: 10,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          controller: ScrollController(),
          children: [
            Column(
              children: <Widget>[
                Card(
                  clipBehavior: Clip.antiAlias,
                  shadowColor: Colors.greenAccent,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.local_hospital),
                        title: Row(
                          children: [
                            Text(
                              'Lab :',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(cbc['entityName'] ?? '')
                          ],
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
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/doctor.png'),
                        ),
                        title: Row(
                          children: [
                            Text(
                              'Doctor Name: ',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(cbc['referring_doctor'] ?? '')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 696,
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    shadowColor: Colors.greenAccent,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Expanded(child: Text('Test')),
                              Expanded(child: Text('Result')),
                              Expanded(child: Text('Unit')),
                              Expanded(child: Text('Range')),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'Hemoglobin',
                                  style: TextStyle(
                                    color: (double.parse(cbc['haemoglobin']) <
                                                13 ||
                                            double.parse(cbc['haemoglobin']) >
                                                17)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  cbc['haemoglobin'].toString(),
                                  style: TextStyle(
                                    color: (double.parse(cbc['haemoglobin']) <
                                                13 ||
                                            double.parse(cbc['haemoglobin']) >
                                                17)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'g/dL',
                                  style: TextStyle(
                                    color: (double.parse(cbc['haemoglobin']) <
                                                13 ||
                                            double.parse(cbc['haemoglobin']) >
                                                17)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '13-17',
                                  style: TextStyle(
                                    color: (double.parse(cbc['haemoglobin']) <
                                                13 ||
                                            double.parse(cbc['haemoglobin']) >
                                                17)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'Hematocrit',
                                  style: TextStyle(
                                    color: (double.parse(cbc['hematocrit']) <
                                                40 ||
                                            double.parse(cbc['hematocrit']) >
                                                50)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  cbc['hematocrit'].toString(),
                                  style: TextStyle(
                                    color: (double.parse(cbc['hematocrit']) <
                                                40 ||
                                            double.parse(cbc['hematocrit']) >
                                                50)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '%',
                                  style: TextStyle(
                                    color: (double.parse(cbc['hematocrit']) <
                                                40 ||
                                            double.parse(cbc['hematocrit']) >
                                                50)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '40-50',
                                  style: TextStyle(
                                    color: (double.parse(cbc['hematocrit']) <
                                                40 ||
                                            double.parse(cbc['hematocrit']) >
                                                50)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'Red Cell\nCount',
                                  style: TextStyle(
                                    color:
                                        (double.parse(cbc['red_cell_count']) <
                                                    4.5 ||
                                                double.parse(
                                                        cbc['red_cell_count']) >
                                                    6.2)
                                            ? Colors.red
                                            : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  cbc['red_cell_count'].toString(),
                                  style: TextStyle(
                                    color:
                                        (double.parse(cbc['red_cell_count']) <
                                                    4.5 ||
                                                double.parse(
                                                        cbc['red_cell_count']) >
                                                    6.2)
                                            ? Colors.red
                                            : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'x10^6/uL',
                                  style: TextStyle(
                                    color:
                                        (double.parse(cbc['red_cell_count']) <
                                                    4.5 ||
                                                double.parse(
                                                        cbc['red_cell_count']) >
                                                    6.2)
                                            ? Colors.red
                                            : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '4.5-6.2',
                                  style: TextStyle(
                                    color:
                                        (double.parse(cbc['red_cell_count']) <
                                                    4.5 ||
                                                double.parse(
                                                        cbc['red_cell_count']) >
                                                    6.2)
                                            ? Colors.red
                                            : Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'MCV',
                                  style: TextStyle(
                                    color: (double.parse(cbc['mcv']) < 78 ||
                                            double.parse(cbc['mcv']) > 96)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  cbc['mcv'].toString(),
                                  style: TextStyle(
                                    color: (double.parse(cbc['mcv']) < 78 ||
                                            double.parse(cbc['mcv']) > 96)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'fL',
                                  style: TextStyle(
                                    color: (double.parse(cbc['mcv']) < 78 ||
                                            double.parse(cbc['mcv']) > 96)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '78-96',
                                  style: TextStyle(
                                    color: (double.parse(cbc['mcv']) < 78 ||
                                            double.parse(cbc['mcv']) > 96)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'MCH',
                                  style: TextStyle(
                                    color: (double.parse(cbc['mch']) < 26 ||
                                            double.parse(cbc['mch']) > 32)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  cbc['mch'].toString(),
                                  style: TextStyle(
                                    color: (double.parse(cbc['mch']) < 26 ||
                                            double.parse(cbc['mch']) > 32)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'fL',
                                  style: TextStyle(
                                    color: (double.parse(cbc['mch']) < 26 ||
                                            double.parse(cbc['mch']) > 32)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '26-32',
                                  style: TextStyle(
                                    color: (double.parse(cbc['mch']) < 26 ||
                                            double.parse(cbc['mch']) > 32)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'MCHC',
                                  style: TextStyle(
                                    color: (double.parse(cbc['mchc']) < 31 ||
                                            double.parse(cbc['mchc']) > 36)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  cbc['mchc'].toString(),
                                  style: TextStyle(
                                    color: (double.parse(cbc['mchc']) < 31 ||
                                            double.parse(cbc['mchc']) > 36)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'pg',
                                  style: TextStyle(
                                    color: (double.parse(cbc['mchc']) < 31 ||
                                            double.parse(cbc['mchc']) > 36)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '31-36',
                                  style: TextStyle(
                                    color: (double.parse(cbc['mchc']) < 31 ||
                                            double.parse(cbc['mchc']) > 36)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'RDW',
                                  style: TextStyle(
                                    color: (double.parse(cbc['rdw']) < 11.5 ||
                                            double.parse(cbc['rdw']) > 14.5)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  cbc['rdw'].toString(),
                                  style: TextStyle(
                                    color: (double.parse(cbc['rdw']) < 11.5 ||
                                            double.parse(cbc['rdw']) > 14.5)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'g/dL',
                                  style: TextStyle(
                                    color: (double.parse(cbc['rdw']) < 11.5 ||
                                            double.parse(cbc['rdw']) > 14.5)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '11.5-14.5',
                                  style: TextStyle(
                                    color: (double.parse(cbc['rdw']) < 11.5 ||
                                            double.parse(cbc['rdw']) > 14.5)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'Platelet\nCount',
                                  style: TextStyle(
                                    color:
                                        (double.parse(cbc['platelet_count']) <
                                                    150 ||
                                                double.parse(
                                                        cbc['platelet_count']) >
                                                    450)
                                            ? Colors.red
                                            : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  cbc['platelet_count'].toString(),
                                  style: TextStyle(
                                    color:
                                        (double.parse(cbc['platelet_count']) <
                                                    150 ||
                                                double.parse(
                                                        cbc['platelet_count']) >
                                                    450)
                                            ? Colors.red
                                            : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '%',
                                  style: TextStyle(
                                    color:
                                        (double.parse(cbc['platelet_count']) <
                                                    150 ||
                                                double.parse(
                                                        cbc['platelet_count']) >
                                                    450)
                                            ? Colors.red
                                            : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '150-450',
                                  style: TextStyle(
                                    color:
                                        (double.parse(cbc['platelet_count']) <
                                                    150 ||
                                                double.parse(
                                                        cbc['platelet_count']) >
                                                    450)
                                            ? Colors.red
                                            : Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'T.L.C',
                                  style: TextStyle(
                                    color: (double.parse(cbc['tlc']) < 4 ||
                                            double.parse(cbc['tlc']) > 11)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  cbc['tlc'].toString(),
                                  style: TextStyle(
                                    color: (double.parse(cbc['tlc']) < 4 ||
                                            double.parse(cbc['tlc']) > 11)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'x10^3/uL',
                                  style: TextStyle(
                                    color: (double.parse(cbc['tlc']) < 4 ||
                                            double.parse(cbc['tlc']) > 11)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '4-11',
                                  style: TextStyle(
                                    color: (double.parse(cbc['tlc']) < 4 ||
                                            double.parse(cbc['tlc']) > 11)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'Basophils',
                                  style: TextStyle(
                                    color: (double.parse(cbc['basophils']) <
                                                0 ||
                                            double.parse(cbc['basophils']) > 1)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  cbc['basophils'].toString(),
                                  style: TextStyle(
                                    color: (double.parse(cbc['basophils']) <
                                                0 ||
                                            double.parse(cbc['basophils']) > 1)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'x10^3/uL',
                                  style: TextStyle(
                                    color: (double.parse(cbc['basophils']) <
                                                0 ||
                                            double.parse(cbc['basophils']) > 1)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '0-1',
                                  style: TextStyle(
                                    color: (double.parse(cbc['basophils']) <
                                                0 ||
                                            double.parse(cbc['basophils']) > 1)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'Eosinophils',
                                  style: TextStyle(
                                    color: (double.parse(cbc['eosinophils']) <
                                                0 ||
                                            double.parse(cbc['eosinophils']) >
                                                6)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  cbc['eosinophils'].toString(),
                                  style: TextStyle(
                                    color: (double.parse(cbc['eosinophils']) <
                                                0 ||
                                            double.parse(cbc['eosinophils']) >
                                                6)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '%',
                                  style: TextStyle(
                                    color: (double.parse(cbc['eosinophils']) <
                                                0 ||
                                            double.parse(cbc['eosinophils']) >
                                                6)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '0-6',
                                  style: TextStyle(
                                    color: (double.parse(cbc['eosinophils']) <
                                                0 ||
                                            double.parse(cbc['eosinophils']) >
                                                6)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'stab',
                                  style: TextStyle(
                                    color: (double.parse(cbc['stab']) < 0 ||
                                            double.parse(cbc['stab']) > 7)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  cbc['stab'].toString(),
                                  style: TextStyle(
                                    color: (double.parse(cbc['stab']) < 0 ||
                                            double.parse(cbc['stab']) > 7)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '%',
                                  style: TextStyle(
                                    color: (double.parse(cbc['stab']) < 0 ||
                                            double.parse(cbc['stab']) > 7)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '0-7',
                                  style: TextStyle(
                                    color: (double.parse(cbc['stab']) < 0 ||
                                            double.parse(cbc['stab']) > 7)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'Segmented',
                                  style: TextStyle(
                                    color: (double.parse(cbc['segmented']) <
                                                40 ||
                                            double.parse(cbc['segmented']) > 75)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  cbc['segmented'].toString(),
                                  style: TextStyle(
                                    color: (double.parse(cbc['segmented']) <
                                                40 ||
                                            double.parse(cbc['segmented']) > 75)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '%',
                                  style: TextStyle(
                                    color: (double.parse(cbc['segmented']) <
                                                40 ||
                                            double.parse(cbc['segmented']) > 75)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '40-75',
                                  style: TextStyle(
                                    color: (double.parse(cbc['segmented']) <
                                                40 ||
                                            double.parse(cbc['segmented']) > 75)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  'Lymphocytes',
                                  style: TextStyle(
                                    color: (double.parse(cbc['lymphocytes']) <
                                                20 ||
                                            double.parse(cbc['lymphocytes']) >
                                                45)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  cbc['lymphocytes'].toString(),
                                  style: TextStyle(
                                    color: (double.parse(cbc['lymphocytes']) <
                                                20 ||
                                            double.parse(cbc['lymphocytes']) >
                                                45)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '%',
                                  style: TextStyle(
                                    color: (double.parse(cbc['lymphocytes']) <
                                                20 ||
                                            double.parse(cbc['lymphocytes']) >
                                                45)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '20-45',
                                  style: TextStyle(
                                    color: (double.parse(cbc['lymphocytes']) <
                                                20 ||
                                            double.parse(cbc['lymphocytes']) >
                                                45)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'Monocytes',
                                  style: TextStyle(
                                    color: (double.parse(cbc['monocytes']) <
                                                1 ||
                                            double.parse(cbc['monocytes']) > 10)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  cbc['monocytes'].toString(),
                                  style: TextStyle(
                                    color: (double.parse(cbc['monocytes']) <
                                                1 ||
                                            double.parse(cbc['monocytes']) > 10)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '%',
                                  style: TextStyle(
                                    color: (double.parse(cbc['monocytes']) <
                                                1 ||
                                            double.parse(cbc['monocytes']) > 10)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '1-10',
                                  style: TextStyle(
                                    color: (double.parse(cbc['monocytes']) <
                                                1 ||
                                            double.parse(cbc['monocytes']) > 10)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.note),
                        title: Text(
                          'notes',
                          style: TextStyle(
                            color: cbc['comments'] != null
                                ? Colors.red
                                : Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            cbc['comments'] ?? 'no comments',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
