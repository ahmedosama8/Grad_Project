import 'package:flutter/material.dart';
import 'package:mobile_app/colors.dart';

class UriTestpage extends StatelessWidget {
  final Map<String, dynamic> urine;
  const UriTestpage({Key? key, required this.urine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Urine Test'),
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
                            Text(urine['entityName'] ?? '')
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
                            Text(urine['referring_doctor'] ?? '')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 800,
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
                                  'Color',
                                  style: TextStyle(
                                    color: (urine['color'] != 'normal')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  urine['color'],
                                  style: TextStyle(
                                    color: (urine['color'] != 'normal')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '--',
                                  style: TextStyle(
                                    color: (urine['color'] != 'normal')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Amberyellow',
                                  style: TextStyle(
                                    color: (urine['color'] != 'normal')
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
                                  'Clarity',
                                  style: TextStyle(
                                    color: (urine['clarity'].toLowerCase() !=
                                            'clear')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  urine['clarity'],
                                  style: TextStyle(
                                    color: (urine['clarity'].toLowerCase() !=
                                            'clear')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '--',
                                  style: TextStyle(
                                    color: (urine['clarity'].toLowerCase() !=
                                            'clear')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Clear',
                                  style: TextStyle(
                                    color: (urine['clarity'].toLowerCase() !=
                                            'clear')
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
                                  'Specific\nGravity',
                                  style: TextStyle(
                                    color: (double.parse(
                                                    urine['specific_gravity']) <
                                                1.015 ||
                                            double.parse(
                                                    urine['specific_gravity']) >
                                                1.025)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  urine['specific_gravity'].toString(),
                                  style: TextStyle(
                                    color: (double.parse(
                                                    urine['specific_gravity']) <
                                                1.015 ||
                                            double.parse(
                                                    urine['specific_gravity']) >
                                                1.025)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '--',
                                  style: TextStyle(
                                    color: (double.parse(
                                                    urine['specific_gravity']) <
                                                1.015 ||
                                            double.parse(
                                                    urine['specific_gravity']) >
                                                1.025)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '1.015-1.025',
                                  style: TextStyle(
                                    color: (double.parse(
                                                    urine['specific_gravity']) <
                                                1.015 ||
                                            double.parse(
                                                    urine['specific_gravity']) >
                                                1.025)
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
                                  'PH',
                                  style: TextStyle(
                                    color: (double.parse(urine['ph']) < 4.5 ||
                                            double.parse(urine['ph']) > 6.5)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  urine['ph'].toString(),
                                  style: TextStyle(
                                    color: (double.parse(urine['ph']) < 4.5 ||
                                            double.parse(urine['ph']) > 6.5)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '--',
                                  style: TextStyle(
                                    color: (double.parse(urine['ph']) < 4.5 ||
                                            double.parse(urine['ph']) > 6.5)
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '4.5-6.5',
                                  style: TextStyle(
                                    color: (double.parse(urine['ph']) < 4.5 ||
                                            double.parse(urine['ph']) > 6.5)
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
                                  'Protein',
                                  style: TextStyle(
                                    color: (urine['protein'] != 'Negative')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  urine['protein'],
                                  style: TextStyle(
                                    color: (urine['protein'] != 'Negative')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '--',
                                  style: TextStyle(
                                    color: (urine['protein'] != 'Negative')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Negative',
                                  style: TextStyle(
                                    color: (urine['protein'] != 'Negative')
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
                                  'Glucose',
                                  style: TextStyle(
                                    color: (urine['glucose'] != 'Negative')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  urine['glucose'],
                                  style: TextStyle(
                                    color: (urine['glucose'] != 'Negative')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '--',
                                  style: TextStyle(
                                    color: (urine['glucose'] != 'Negative')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Negative',
                                  style: TextStyle(
                                    color: (urine['glucose'] != 'Negative')
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
                                  'Ketone',
                                  style: TextStyle(
                                    color: (urine['ketone'] != 'Negative')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  urine['ketone'],
                                  style: TextStyle(
                                    color: (urine['ketone'] != 'Negative')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '--',
                                  style: TextStyle(
                                    color: (urine['ketone'] != 'Negative')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Negative',
                                  style: TextStyle(
                                    color: (urine['ketone'] != 'Negative')
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
                                  'Urobilinogen',
                                  style: TextStyle(
                                    color: (urine['urobilinogen'] !=
                                            'Normal Trace')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  urine['urobilinogen'],
                                  style: TextStyle(
                                    color: (urine['urobilinogen'] !=
                                            'Normal Trace')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '--',
                                  style: TextStyle(
                                    color: (urine['urobilinogen'] !=
                                            'Normal Trace')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Normal Trace',
                                  style: TextStyle(
                                    color: (urine['urobilinogen'] !=
                                            'Normal Trace')
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
                                  'Bilirubin',
                                  style: TextStyle(
                                    color: (urine['bilirubin'] != 'Negative')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  urine['bilirubin'],
                                  style: TextStyle(
                                    color: (urine['bilirubin'] != 'Negative')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '--',
                                  style: TextStyle(
                                    color: (urine['bilirubin'] != 'Negative')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Negative',
                                  style: TextStyle(
                                    color: (urine['bilirubin'] != 'Negative')
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
                                  'Nitrite',
                                  style: TextStyle(
                                    color: (urine['nitrite'] != 'Negative')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  urine['nitrite'],
                                  style: TextStyle(
                                    color: (urine['nitrite'] != 'Negative')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '--',
                                  style: TextStyle(
                                    color: (urine['nitrite'] != 'Negative')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Negative',
                                  style: TextStyle(
                                    color: (urine['nitrite'] != 'Negative')
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
                                  'Pus Cells',
                                  style: TextStyle(
                                    color: (urine['pus_cells'] != '0:1')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  urine['pus_cells'].toString(),
                                  style: TextStyle(
                                    color: (urine['pus_cells'] != '0:1')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '/HBF',
                                  style: TextStyle(
                                    color: (urine['pus_cells'] != '0:1')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '0:1',
                                  style: TextStyle(
                                    color: (urine['pus_cells'] != '0:1')
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
                                  'Red Cells',
                                  style: TextStyle(
                                    color: (urine['red_cells'] != '0:1')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  urine['red_cells'].toString(),
                                  style: TextStyle(
                                    color: (urine['red_cells'] != '0:1')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '/HBF',
                                  style: TextStyle(
                                    color: (urine['red_cells'] != '0:1')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '0:1',
                                  style: TextStyle(
                                    color: (urine['red_cells'] != '0:1')
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
                                  'Epithelial',
                                  style: TextStyle(
                                    color: (urine['epithelial_cells'] !=
                                            'Negative')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  urine['epithelial_cells'],
                                  style: TextStyle(
                                    color: (urine['epithelial_cells'] !=
                                            'Negative')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '/HBF',
                                  style: TextStyle(
                                    color: (urine['epithelial_cells'] !=
                                            'Negative')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Negative',
                                  style: TextStyle(
                                    color: (urine['epithelial_cells'] !=
                                            'Negative')
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
                                  'Amorphous',
                                  style: TextStyle(
                                    color: (urine['amorphous'] != 'Negative')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  urine['amorphous'],
                                  style: TextStyle(
                                    color: (urine['amorphous'] != 'Negative')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '/HBF',
                                  style: TextStyle(
                                    color: (urine['amorphous'] != 'Negative')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Negative',
                                  style: TextStyle(
                                    color: (urine['amorphous'] != 'Negative')
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
                                  'Crystals',
                                  style: TextStyle(
                                    color: (urine['crystals'] != 'Negative')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  urine['crystals'],
                                  style: TextStyle(
                                    color: (urine['crystals'] != 'Negative')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '/HBF',
                                  style: TextStyle(
                                    color: (urine['crystals'] != 'Negative')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Negative',
                                  style: TextStyle(
                                    color: (urine['crystals'] != 'Negative')
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
                                  'Casts',
                                  style: TextStyle(
                                    color: (urine['casts'] != 'Negative')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  urine['casts'],
                                  style: TextStyle(
                                    color: (urine['casts'] != 'Negative')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '/HBF',
                                  style: TextStyle(
                                    color: (urine['casts'] != 'Negative')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Negative',
                                  style: TextStyle(
                                    color: (urine['casts'] != 'Negative')
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
                                  'Others',
                                  style: TextStyle(
                                    color: (urine['others'] != 'Negative')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  urine['others'],
                                  style: TextStyle(
                                    color: (urine['others'] != 'Negative')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '--',
                                  style: TextStyle(
                                    color: (urine['others'] != 'Negative')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Negative',
                                  style: TextStyle(
                                    color: (urine['others'] != 'Negative')
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
                            color: urine['comments'] != null
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
                            urine['comments'],
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
