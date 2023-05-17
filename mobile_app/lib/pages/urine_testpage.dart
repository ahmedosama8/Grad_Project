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
                SizedBox(
                  height: 770,
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
                              Text(
                                  'Test\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0'),
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
                                'Color\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0',
                                style: TextStyle(
                                  color: (urine['color'] != 'normal')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                urine['color'],
                                style: TextStyle(
                                  color: (urine['color'] != 'normal')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '--',
                                style: TextStyle(
                                  color: (urine['color'] != 'normal')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                'Amberyellow',
                                style: TextStyle(
                                  color: (urine['color'] != 'normal')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 30, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Clarity\u00A0\u00A0\u00A0',
                                style: TextStyle(
                                  color: (urine['clarity'].toLowerCase() !=
                                          'clear')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                urine['clarity'],
                                style: TextStyle(
                                  color: (urine['clarity'].toLowerCase() !=
                                          'clear')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '--',
                                style: TextStyle(
                                  color: (urine['clarity'].toLowerCase() !=
                                          'clear')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                'Clear',
                                style: TextStyle(
                                  color: (urine['clarity'].toLowerCase() !=
                                          'clear')
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
                                'Specific\nGravity\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0',
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
                              Text(
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
                              Text(
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
                              Text(
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
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'PH\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0',
                                style: TextStyle(
                                  color: (double.parse(urine['ph']) < 4.5 ||
                                          double.parse(urine['ph']) > 6.5)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                urine['ph'].toString(),
                                style: TextStyle(
                                  color: (double.parse(urine['ph']) < 4.5 ||
                                          double.parse(urine['ph']) > 6.5)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '--',
                                style: TextStyle(
                                  color: (double.parse(urine['ph']) < 4.5 ||
                                          double.parse(urine['ph']) > 6.5)
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '4.5-6.5',
                                style: TextStyle(
                                  color: (double.parse(urine['ph']) < 4.5 ||
                                          double.parse(urine['ph']) > 6.5)
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
                                'Protein\u00A0\u00A0\u00A0\u00A0\u00A0',
                                style: TextStyle(
                                  color: (urine['protein'] != 'Negative')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                urine['protein'],
                                style: TextStyle(
                                  color: (urine['protein'] != 'Negative')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '--',
                                style: TextStyle(
                                  color: (urine['protein'] != 'Negative')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                'Negative',
                                style: TextStyle(
                                  color: (urine['protein'] != 'Negative')
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
                                'Glucose',
                                style: TextStyle(
                                  color: (urine['glucose'] != 'Negative')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                urine['glucose'],
                                style: TextStyle(
                                  color: (urine['glucose'] != 'Negative')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '--',
                                style: TextStyle(
                                  color: (urine['glucose'] != 'Negative')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                'Negative',
                                style: TextStyle(
                                  color: (urine['glucose'] != 'Negative')
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
                                'Ketone\u00A0\u00A0\u00A0\u00A0\u00A0',
                                style: TextStyle(
                                  color: (urine['ketone'] != 'Negative')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                urine['ketone'],
                                style: TextStyle(
                                  color: (urine['ketone'] != 'Negative')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '--',
                                style: TextStyle(
                                  color: (urine['ketone'] != 'Negative')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                'Negative',
                                style: TextStyle(
                                  color: (urine['ketone'] != 'Negative')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(1, 15, 30, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Urobilinogen',
                                style: TextStyle(
                                  color:
                                      (urine['urobilinogen'] != 'Normal Trace')
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                urine['urobilinogen'],
                                style: TextStyle(
                                  color:
                                      (urine['urobilinogen'] != 'Normal Trace')
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                '--',
                                style: TextStyle(
                                  color:
                                      (urine['urobilinogen'] != 'Normal Trace')
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                'Normal Trace',
                                style: TextStyle(
                                  color:
                                      (urine['urobilinogen'] != 'Normal Trace')
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
                                'Bilirubin\u00A0\u00A0\u00A0\u00A0',
                                style: TextStyle(
                                  color: (urine['bilirubin'] != 'Negative')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                urine['bilirubin'],
                                style: TextStyle(
                                  color: (urine['bilirubin'] != 'Negative')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '--',
                                style: TextStyle(
                                  color: (urine['bilirubin'] != 'Negative')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                'Negative',
                                style: TextStyle(
                                  color: (urine['bilirubin'] != 'Negative')
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
                                'Nitrite\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0',
                                style: TextStyle(
                                  color: (urine['nitrite'] != 'Negative')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                urine['nitrite'],
                                style: TextStyle(
                                  color: (urine['nitrite'] != 'Negative')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '--',
                                style: TextStyle(
                                  color: (urine['nitrite'] != 'Negative')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                'Negative',
                                style: TextStyle(
                                  color: (urine['nitrite'] != 'Negative')
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
                                'Pus Cells',
                                style: TextStyle(
                                  color: (urine['pus_cells'] != '0:1')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                urine['pus_cells'].toString(),
                                style: TextStyle(
                                  color: (urine['pus_cells'] != '0:1')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '/HBF',
                                style: TextStyle(
                                  color: (urine['pus_cells'] != '0:1')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '0:1',
                                style: TextStyle(
                                  color: (urine['pus_cells'] != '0:1')
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
                                'Red Cells',
                                style: TextStyle(
                                  color: (urine['red_cells'] != '0:1')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                urine['red_cells'].toString(),
                                style: TextStyle(
                                  color: (urine['red_cells'] != '0:1')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '/HBF',
                                style: TextStyle(
                                  color: (urine['red_cells'] != '0:1')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '0:1',
                                style: TextStyle(
                                  color: (urine['red_cells'] != '0:1')
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
                                'Epithelial\u00A0\u00A0\u00A0\u00A0',
                                style: TextStyle(
                                  color:
                                      (urine['epithelial_cells'] != 'Negative')
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                urine['epithelial_cells'],
                                style: TextStyle(
                                  color:
                                      (urine['epithelial_cells'] != 'Negative')
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                '/HBF',
                                style: TextStyle(
                                  color:
                                      (urine['epithelial_cells'] != 'Negative')
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                'Negative',
                                style: TextStyle(
                                  color:
                                      (urine['epithelial_cells'] != 'Negative')
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
                                'Amorphous',
                                style: TextStyle(
                                  color: (urine['amorphous'] != 'Negative')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                urine['amorphous'],
                                style: TextStyle(
                                  color: (urine['amorphous'] != 'Negative')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '/HBF',
                                style: TextStyle(
                                  color: (urine['amorphous'] != 'Negative')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                'Negative',
                                style: TextStyle(
                                  color: (urine['amorphous'] != 'Negative')
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
                                'Crystals\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0',
                                style: TextStyle(
                                  color: (urine['crystals'] != 'Negative')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                urine['crystals'],
                                style: TextStyle(
                                  color: (urine['crystals'] != 'Negative')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '/HBF',
                                style: TextStyle(
                                  color: (urine['crystals'] != 'Negative')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                'Negative',
                                style: TextStyle(
                                  color: (urine['crystals'] != 'Negative')
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
                                'Casts\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0',
                                style: TextStyle(
                                  color: (urine['casts'] != 'Negative')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                urine['casts'],
                                style: TextStyle(
                                  color: (urine['casts'] != 'Negative')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '/HBF',
                                style: TextStyle(
                                  color: (urine['casts'] != 'Negative')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                'Negative',
                                style: TextStyle(
                                  color: (urine['casts'] != 'Negative')
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
                                'Others',
                                style: TextStyle(
                                  color: (urine['others'] != 'Negative')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                urine['others'],
                                style: TextStyle(
                                  color: (urine['others'] != 'Negative')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                '--',
                                style: TextStyle(
                                  color: (urine['others'] != 'Negative')
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                'Negative',
                                style: TextStyle(
                                  color: (urine['others'] != 'Negative')
                                      ? Colors.red
                                      : Colors.black,
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
