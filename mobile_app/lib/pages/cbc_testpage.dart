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
                        title: Text('Lab :${cbc['entityName']}'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 675,
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
                              Text('Test'),
                              Text('Result'),
                              Text('Unit'),
                              Text('Range'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Hemoglobin',
                                style: TextStyle(
                                  color: (double.parse(cbc['haemoglobin']) <
                                              13 ||
                                          double.parse(cbc['haemoglobin']) > 17)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                cbc['haemoglobin'].toString(),
                                style: TextStyle(
                                  color: (double.parse(cbc['haemoglobin']) <
                                              13 ||
                                          double.parse(cbc['haemoglobin']) > 17)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                'g/dL',
                                style: TextStyle(
                                  color: (double.parse(cbc['haemoglobin']) <
                                              13 ||
                                          double.parse(cbc['haemoglobin']) > 17)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '13-17',
                                style: TextStyle(
                                  color: (double.parse(cbc['haemoglobin']) <
                                              13 ||
                                          double.parse(cbc['haemoglobin']) > 17)
                                      ? Colors.red
                                      : Colors.black,
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
                              Text(
                                'Hematocrit',
                                style: TextStyle(
                                  color: (double.parse(cbc['hematocrit']) <
                                              40 ||
                                          double.parse(cbc['hematocrit']) > 50)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                cbc['hematocrit'].toString(),
                                style: TextStyle(
                                  color: (double.parse(cbc['hematocrit']) <
                                              40 ||
                                          double.parse(cbc['hematocrit']) > 50)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '%',
                                style: TextStyle(
                                  color: (double.parse(cbc['hematocrit']) <
                                              40 ||
                                          double.parse(cbc['hematocrit']) > 50)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '40-50',
                                style: TextStyle(
                                  color: (double.parse(cbc['hematocrit']) <
                                              40 ||
                                          double.parse(cbc['hematocrit']) > 50)
                                      ? Colors.red
                                      : Colors.black,
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
                              Text(
                                'Red Cell Count\u00A0',
                                style: TextStyle(
                                  color: (double.parse(cbc['red_cell_count']) <
                                              4.5 ||
                                          double.parse(cbc['red_cell_count']) >
                                              6.2)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                cbc['red_cell_count'].toString(),
                                style: TextStyle(
                                  color: (double.parse(cbc['red_cell_count']) <
                                              4.5 ||
                                          double.parse(cbc['red_cell_count']) >
                                              6.2)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                'x10^6/uL',
                                style: TextStyle(
                                  color: (double.parse(cbc['red_cell_count']) <
                                              4.5 ||
                                          double.parse(cbc['red_cell_count']) >
                                              6.2)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '4.5-6.2',
                                style: TextStyle(
                                  color: (double.parse(cbc['red_cell_count']) <
                                              4.5 ||
                                          double.parse(cbc['red_cell_count']) >
                                              6.2)
                                      ? Colors.red
                                      : Colors.black,
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
                              Text(
                                'MCV\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0',
                                style: TextStyle(
                                  color: (double.parse(cbc['mcv']) < 78 ||
                                          double.parse(cbc['mcv']) > 96)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                cbc['mcv'].toString(),
                                style: TextStyle(
                                  color: (double.parse(cbc['mcv']) < 78 ||
                                          double.parse(cbc['mcv']) > 96)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                'fL',
                                style: TextStyle(
                                  color: (double.parse(cbc['mcv']) < 78 ||
                                          double.parse(cbc['mcv']) > 96)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '78-96',
                                style: TextStyle(
                                  color: (double.parse(cbc['mcv']) < 78 ||
                                          double.parse(cbc['mcv']) > 96)
                                      ? Colors.red
                                      : Colors.black,
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
                              Text(
                                'MCH\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0',
                                style: TextStyle(
                                  color: (double.parse(cbc['mch']) < 26 ||
                                          double.parse(cbc['mch']) > 32)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                cbc['mch'].toString(),
                                style: TextStyle(
                                  color: (double.parse(cbc['mch']) < 26 ||
                                          double.parse(cbc['mch']) > 32)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                'fL',
                                style: TextStyle(
                                  color: (double.parse(cbc['mch']) < 26 ||
                                          double.parse(cbc['mch']) > 32)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '26-32',
                                style: TextStyle(
                                  color: (double.parse(cbc['mch']) < 26 ||
                                          double.parse(cbc['mch']) > 32)
                                      ? Colors.red
                                      : Colors.black,
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
                              Text(
                                'MCHC\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0',
                                style: TextStyle(
                                  color: (double.parse(cbc['mchc']) < 31 ||
                                          double.parse(cbc['mchc']) > 36)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                cbc['mchc'].toString(),
                                style: TextStyle(
                                  color: (double.parse(cbc['mchc']) < 31 ||
                                          double.parse(cbc['mchc']) > 36)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                'pg',
                                style: TextStyle(
                                  color: (double.parse(cbc['mchc']) < 31 ||
                                          double.parse(cbc['mchc']) > 36)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '31-36',
                                style: TextStyle(
                                  color: (double.parse(cbc['mchc']) < 31 ||
                                          double.parse(cbc['mchc']) > 36)
                                      ? Colors.red
                                      : Colors.black,
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
                              Text(
                                'RDW\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0',
                                style: TextStyle(
                                  color: (double.parse(cbc['rdw']) < 11.5 ||
                                          double.parse(cbc['rdw']) > 14.5)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                cbc['rdw'].toString(),
                                style: TextStyle(
                                  color: (double.parse(cbc['rdw']) < 11.5 ||
                                          double.parse(cbc['rdw']) > 14.5)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                'g/dL',
                                style: TextStyle(
                                  color: (double.parse(cbc['rdw']) < 11.5 ||
                                          double.parse(cbc['rdw']) > 14.5)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '11.5-14.5',
                                style: TextStyle(
                                  color: (double.parse(cbc['rdw']) < 11.5 ||
                                          double.parse(cbc['rdw']) > 14.5)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 15, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Platelet Count',
                                style: TextStyle(
                                  color: (double.parse(cbc['platelet_count']) <
                                              150 ||
                                          double.parse(cbc['platelet_count']) >
                                              450)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                cbc['platelet_count'].toString(),
                                style: TextStyle(
                                  color: (double.parse(cbc['platelet_count']) <
                                              150 ||
                                          double.parse(cbc['platelet_count']) >
                                              450)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '%',
                                style: TextStyle(
                                  color: (double.parse(cbc['platelet_count']) <
                                              150 ||
                                          double.parse(cbc['platelet_count']) >
                                              450)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '150-450',
                                style: TextStyle(
                                  color: (double.parse(cbc['platelet_count']) <
                                              150 ||
                                          double.parse(cbc['platelet_count']) >
                                              450)
                                      ? Colors.red
                                      : Colors.black,
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
                              Text(
                                'T.L.C\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0',
                                style: TextStyle(
                                  color: (double.parse(cbc['tlc']) < 4 ||
                                          double.parse(cbc['tlc']) > 11)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                cbc['tlc'].toString(),
                                style: TextStyle(
                                  color: (double.parse(cbc['tlc']) < 4 ||
                                          double.parse(cbc['tlc']) > 11)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                'x10^3/uL',
                                style: TextStyle(
                                  color: (double.parse(cbc['tlc']) < 4 ||
                                          double.parse(cbc['tlc']) > 11)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '4-11',
                                style: TextStyle(
                                  color: (double.parse(cbc['tlc']) < 4 ||
                                          double.parse(cbc['tlc']) > 11)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 15, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Basophils\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0',
                                style: TextStyle(
                                  color: (double.parse(cbc['basophils']) < 0 ||
                                          double.parse(cbc['basophils']) > 1)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                cbc['basophils'].toString(),
                                style: TextStyle(
                                  color: (double.parse(cbc['basophils']) < 0 ||
                                          double.parse(cbc['basophils']) > 1)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                'x10^3/uL',
                                style: TextStyle(
                                  color: (double.parse(cbc['basophils']) < 0 ||
                                          double.parse(cbc['basophils']) > 1)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '0-1',
                                style: TextStyle(
                                  color: (double.parse(cbc['basophils']) < 0 ||
                                          double.parse(cbc['basophils']) > 1)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 25, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Eosinophils',
                                style: TextStyle(
                                  color: (double.parse(cbc['eosinophils']) <
                                              0 ||
                                          double.parse(cbc['eosinophils']) > 6)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                cbc['eosinophils'].toString(),
                                style: TextStyle(
                                  color: (double.parse(cbc['eosinophils']) <
                                              0 ||
                                          double.parse(cbc['eosinophils']) > 6)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '%',
                                style: TextStyle(
                                  color: (double.parse(cbc['eosinophils']) <
                                              0 ||
                                          double.parse(cbc['eosinophils']) > 6)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '0-6',
                                style: TextStyle(
                                  color: (double.parse(cbc['eosinophils']) <
                                              0 ||
                                          double.parse(cbc['eosinophils']) > 6)
                                      ? Colors.red
                                      : Colors.black,
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
                              Text(
                                'stab\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0',
                                style: TextStyle(
                                  color: (double.parse(cbc['stab']) < 0 ||
                                          double.parse(cbc['stab']) > 7)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                cbc['stab'].toString(),
                                style: TextStyle(
                                  color: (double.parse(cbc['stab']) < 0 ||
                                          double.parse(cbc['stab']) > 7)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '%',
                                style: TextStyle(
                                  color: (double.parse(cbc['stab']) < 0 ||
                                          double.parse(cbc['stab']) > 7)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '0-7',
                                style: TextStyle(
                                  color: (double.parse(cbc['stab']) < 0 ||
                                          double.parse(cbc['stab']) > 7)
                                      ? Colors.red
                                      : Colors.black,
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
                              Text(
                                'Segmented',
                                style: TextStyle(
                                  color: (double.parse(cbc['segmented']) < 40 ||
                                          double.parse(cbc['segmented']) > 75)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                cbc['segmented'].toString(),
                                style: TextStyle(
                                  color: (double.parse(cbc['segmented']) < 40 ||
                                          double.parse(cbc['segmented']) > 75)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '%',
                                style: TextStyle(
                                  color: (double.parse(cbc['segmented']) < 40 ||
                                          double.parse(cbc['segmented']) > 75)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '40-75',
                                style: TextStyle(
                                  color: (double.parse(cbc['segmented']) < 40 ||
                                          double.parse(cbc['segmented']) > 75)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 25, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Lymphocytes',
                                style: TextStyle(
                                  color: (double.parse(cbc['lymphocytes']) <
                                              20 ||
                                          double.parse(cbc['lymphocytes']) > 45)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                cbc['lymphocytes'].toString(),
                                style: TextStyle(
                                  color: (double.parse(cbc['lymphocytes']) <
                                              20 ||
                                          double.parse(cbc['lymphocytes']) > 45)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '%',
                                style: TextStyle(
                                  color: (double.parse(cbc['lymphocytes']) <
                                              20 ||
                                          double.parse(cbc['lymphocytes']) > 45)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '20-45',
                                style: TextStyle(
                                  color: (double.parse(cbc['lymphocytes']) <
                                              20 ||
                                          double.parse(cbc['lymphocytes']) > 45)
                                      ? Colors.red
                                      : Colors.black,
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
                              Text(
                                'Monocytes',
                                style: TextStyle(
                                  color: (double.parse(cbc['monocytes']) < 1 ||
                                          double.parse(cbc['monocytes']) > 10)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                cbc['monocytes'].toString(),
                                style: TextStyle(
                                  color: (double.parse(cbc['monocytes']) < 1 ||
                                          double.parse(cbc['monocytes']) > 10)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '%',
                                style: TextStyle(
                                  color: (double.parse(cbc['monocytes']) < 1 ||
                                          double.parse(cbc['monocytes']) > 10)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '1-10',
                                style: TextStyle(
                                  color: (double.parse(cbc['monocytes']) < 1 ||
                                          double.parse(cbc['monocytes']) > 10)
                                      ? Colors.red
                                      : Colors.black,
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
