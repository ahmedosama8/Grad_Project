import 'package:flutter/material.dart';
import 'package:mobile_app/colors.dart';

class LipTestpage extends StatelessWidget {
  final Map<String, dynamic> lipid;
  const LipTestpage({Key? key, required this.lipid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color getHDLColor(double hdl) {
      if (hdl < 40) {
        return Colors.red;
      } else if (hdl >= 40 && hdl <= 60) {
        return Color.fromARGB(255, 235, 187, 42);
      } else {
        return Colors.black;
      }
    }

    Color getTriglyceridesColor(double triglycerides) {
      if (triglycerides < 150) {
        return Colors.black;
      } else if (triglycerides >= 150 && triglycerides <= 199) {
        return Color.fromARGB(255, 235, 187, 42);
      } else if (triglycerides >= 200 && triglycerides <= 499) {
        return Colors.orange;
      } else {
        return Colors.red;
      }
    }

    Color getLDLColor(double ldl) {
      if (ldl < 100) {
        return Colors.black;
      } else if (ldl >= 100 && ldl <= 129) {
        return Colors.amber;
      } else if (ldl >= 130 && ldl <= 159) {
        return Colors.orange;
      } else if (ldl >= 160 && ldl <= 189) {
        return Colors.red;
      } else {
        return Colors.purple;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Lipid Profile Test'),
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
                            Text(lipid['entityName'] ?? '')
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
                            Text(lipid['referring_doctor'] ?? '')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1000,
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
                              Text('Test\u00A0\u00A0\u00A0\u00A0\u00A0'),
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
                                'Cholesterol',
                                style: TextStyle(
                                  color: (double.parse(lipid['cholesterol']) <
                                          200)
                                      ? Colors.black
                                      : (double.parse(lipid['cholesterol']) >=
                                                  200 &&
                                              double.parse(
                                                      lipid['cholesterol']) <
                                                  240)
                                          ? Colors.orange
                                          : Colors.red,
                                ),
                              ),
                              Text(
                                lipid['cholesterol'].toString(),
                                style: TextStyle(
                                  color: (double.parse(lipid['cholesterol']) <
                                          200)
                                      ? Colors.black
                                      : (double.parse(lipid['cholesterol']) >=
                                                  200 &&
                                              double.parse(
                                                      lipid['cholesterol']) <
                                                  240)
                                          ? Colors.orange
                                          : Colors.red,
                                ),
                              ),
                              Text(
                                'mg/dL',
                                style: TextStyle(
                                  color: (double.parse(lipid['cholesterol']) <
                                          200)
                                      ? Colors.black
                                      : (double.parse(lipid['cholesterol']) >=
                                                  200 &&
                                              double.parse(
                                                      lipid['cholesterol']) <
                                                  240)
                                          ? Colors.orange
                                          : Colors.red,
                                ),
                              ),
                              Text(
                                'Desirable: < 200 mg/dL\nBorderline High: 200-239 mg/dl\nHigh: > or = 240 mg/dL',
                                style: TextStyle(
                                  color: (double.parse(lipid['cholesterol']) <
                                          200)
                                      ? Colors.black
                                      : (double.parse(lipid['cholesterol']) >=
                                                  200 &&
                                              double.parse(
                                                      lipid['cholesterol']) <
                                                  240)
                                          ? Colors.orange
                                          : Colors.red,
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
                                'HDL-C',
                                style: TextStyle(
                                  color:
                                      getHDLColor(double.parse(lipid['hdl_c'])),
                                ),
                              ),
                              Text(
                                lipid['hdl_c'].toString(),
                                style: TextStyle(
                                  color:
                                      getHDLColor(double.parse(lipid['hdl_c'])),
                                ),
                              ),
                              Text(
                                'mg/dL',
                                style: TextStyle(
                                  color:
                                      getHDLColor(double.parse(lipid['hdl_c'])),
                                ),
                              ),
                              Text(
                                'Low HDL: < 40 mg/dL\nBorderline Low: 40-60 mg/dL\nAcceptable: > 60 mg/dL',
                                style: TextStyle(
                                  color:
                                      getHDLColor(double.parse(lipid['hdl_c'])),
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
                                'LDL-C',
                                style: TextStyle(
                                  color:
                                      getLDLColor(double.parse(lipid['ldl_c'])),
                                ),
                              ),
                              Text(
                                lipid['ldl_c'].toString(),
                                style: TextStyle(
                                  color:
                                      getLDLColor(double.parse(lipid['ldl_c'])),
                                ),
                              ),
                              Text(
                                'mg/dL',
                                style: TextStyle(
                                  color:
                                      getLDLColor(double.parse(lipid['ldl_c'])),
                                ),
                              ),
                              Text(
                                'Desirable: < 100 mg/dL\nAbove Desirable: 100-129 mg/dL\nBorderline High: 130-159 mg/dL\nHigh: 160-189 mg/dL\nVery High: >= 190 mg/dL',
                                style: TextStyle(
                                  color:
                                      getLDLColor(double.parse(lipid['ldl_c'])),
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
                                'Triglycerides',
                                style: TextStyle(
                                  color: getTriglyceridesColor(
                                      double.parse(lipid['triglycerides'])),
                                ),
                              ),
                              Text(
                                lipid['triglycerides'].toString(),
                                style: TextStyle(
                                  color: getTriglyceridesColor(
                                      double.parse(lipid['triglycerides'])),
                                ),
                              ),
                              Text(
                                'mg/dL',
                                style: TextStyle(
                                  color: getTriglyceridesColor(
                                      double.parse(lipid['triglycerides'])),
                                ),
                              ),
                              Text(
                                '< 150: Desirable\n150-199: Border High Line\n200-499: High\n>= 500: Very High',
                                style: TextStyle(
                                  color: getTriglyceridesColor(
                                      double.parse(lipid['triglycerides'])),
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
                                'VLDL\ncholesterol',
                                style: TextStyle(
                                  color:
                                      double.parse(lipid['vldl_cholestrol']) >
                                              32
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                lipid['vldl_cholestrol'],
                                style: TextStyle(
                                  color:
                                      double.parse(lipid['vldl_cholestrol']) >
                                              32
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                'mg/dL',
                                style: TextStyle(
                                  color:
                                      double.parse(lipid['vldl_cholestrol']) >
                                              32
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                'up to: 32',
                                style: TextStyle(
                                  color:
                                      double.parse(lipid['vldl_cholestrol']) >
                                              32
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
                                'Total lipids',
                                style: TextStyle(
                                  color:
                                      double.parse(lipid['total_lipids']) > 750
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                lipid['total_lipids'],
                                style: TextStyle(
                                  color:
                                      double.parse(lipid['total_lipids']) > 750
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                'mg/dL',
                                style: TextStyle(
                                  color:
                                      double.parse(lipid['total_lipids']) > 750
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                'up to: 750',
                                style: TextStyle(
                                  color:
                                      double.parse(lipid['total_lipids']) > 750
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 20, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Risk Ratio 1',
                                style: TextStyle(
                                  color:
                                      double.parse(lipid['risk_ratio_1']) > 5.5
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                lipid['risk_ratio_1'],
                                style: TextStyle(
                                  color:
                                      double.parse(lipid['risk_ratio_1']) > 5.5
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                '--',
                                style: TextStyle(
                                  color:
                                      double.parse(lipid['risk_ratio_1']) > 5.5
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                'up to: 5.5',
                                style: TextStyle(
                                  color:
                                      double.parse(lipid['risk_ratio_1']) > 5.5
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
                                'Oxidized LDL',
                                style: TextStyle(
                                  color:
                                      double.parse(lipid['oxidized_ldl']) > 117
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                lipid['oxidized_ldl'],
                                style: TextStyle(
                                  color:
                                      double.parse(lipid['oxidized_ldl']) > 117
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                'U/L',
                                style: TextStyle(
                                  color:
                                      double.parse(lipid['oxidized_ldl']) > 117
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                '26 - 117',
                                style: TextStyle(
                                  color:
                                      double.parse(lipid['oxidized_ldl']) > 117
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
                                'Risk Ratio II',
                                style: TextStyle(
                                  color: _getRiskRatio2Color(
                                      double.parse(lipid['risk_ratio_2'])),
                                ),
                              ),
                              Text(
                                lipid['risk_ratio_2'],
                                style: TextStyle(
                                  color: _getRiskRatio2Color(
                                      double.parse(lipid['risk_ratio_2'])),
                                ),
                              ),
                              Text(
                                '--',
                                style: TextStyle(
                                  color: _getRiskRatio2Color(
                                      double.parse(lipid['risk_ratio_2'])),
                                ),
                              ),
                              Text(
                                '1/2 Average: < 3.9\nAverage: < 5.0\n2 Average: < 9.6\n3 Average: - < 23.4',
                                style: TextStyle(
                                  color: _getRiskRatio2Color(
                                      double.parse(lipid['risk_ratio_2'])),
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
                                'H-CRP',
                                style: TextStyle(
                                  color: double.parse(lipid['h_crp']) <= 3.0
                                      ? Colors.black
                                      : Colors.red,
                                ),
                              ),
                              Text(
                                lipid['h_crp'],
                                style: TextStyle(
                                  color: double.parse(lipid['h_crp']) <= 3.0
                                      ? Colors.black
                                      : Colors.red,
                                ),
                              ),
                              Text(
                                'mg/L',
                                style: TextStyle(
                                  color: double.parse(lipid['h_crp']) <= 3.0
                                      ? Colors.black
                                      : Colors.red,
                                ),
                              ),
                              Text(
                                '0 - 3',
                                style: TextStyle(
                                  color: double.parse(lipid['h_crp']) <= 3.0
                                      ? Colors.black
                                      : Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 1, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ratio',
                                style: TextStyle(
                                  color: _getRatioColor(
                                      double.parse(lipid['ratio'])),
                                ),
                              ),
                              Text(
                                lipid['ratio'],
                                style: TextStyle(
                                  color: _getRatioColor(
                                      double.parse(lipid['ratio'])),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '--',
                                style: TextStyle(
                                  color: _getRatioColor(
                                      double.parse(lipid['ratio'])),
                                ),
                              ),
                              Text(
                                'Non CAD: 0.2\nStable Angina > 0.7\nUnstable Angina > 4.3\nMyocardial Infarction > 7.5',
                                style: TextStyle(
                                  color: _getRatioColor(
                                      double.parse(lipid['ratio'])),
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
                                'Lipoprotein(a)',
                                style: TextStyle(
                                  color: _getLipoproteinColor(
                                      double.parse(lipid['lipo_protein'])),
                                ),
                              ),
                              Text(
                                lipid['lipo_protein'],
                                style: TextStyle(
                                  color: _getLipoproteinColor(
                                      double.parse(lipid['lipo_protein'])),
                                ),
                              ),
                              Text(
                                'mg/dL',
                                style: TextStyle(
                                  color: _getLipoproteinColor(
                                      double.parse(lipid['lipo_protein'])),
                                ),
                              ),
                              Text(
                                'Desirable < 20\nBorderline: 20-30\nHigh risk: 31-50\nVery high risk > 50',
                                style: TextStyle(
                                  color: _getLipoproteinColor(
                                      double.parse(lipid['lipo_protein'])),
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
                                'APOA',
                                style: TextStyle(
                                  color: (double.parse(lipid['apoa']) >= 1.08 &&
                                          double.parse(lipid['apoa']) <= 2.25)
                                      ? Colors.black
                                      : Colors.red,
                                ),
                              ),
                              Text(
                                lipid['apoa'],
                                style: TextStyle(
                                  color: (double.parse(lipid['apoa']) >= 1.08 &&
                                          double.parse(lipid['apoa']) <= 2.25)
                                      ? Colors.black
                                      : Colors.red,
                                ),
                              ),
                              Text(
                                'g/L',
                                style: TextStyle(
                                  color: (double.parse(lipid['apoa']) >= 1.08 &&
                                          double.parse(lipid['apoa']) <= 2.25)
                                      ? Colors.black
                                      : Colors.red,
                                ),
                              ),
                              Text(
                                '1.08 - 2.25',
                                style: TextStyle(
                                  color: (double.parse(lipid['apoa']) >= 1.08 &&
                                          double.parse(lipid['apoa']) <= 2.25)
                                      ? Colors.black
                                      : Colors.red,
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
                                'APOB',
                                style: TextStyle(
                                  color: (double.parse(lipid['apob']) >= 0.5 &&
                                          double.parse(lipid['apob']) <= 1.3)
                                      ? Colors.black
                                      : Colors.red,
                                ),
                              ),
                              Text(
                                lipid['apob'],
                                style: TextStyle(
                                  color: (double.parse(lipid['apob']) >= 0.5 &&
                                          double.parse(lipid['apob']) <= 1.3)
                                      ? Colors.black
                                      : Colors.red,
                                ),
                              ),
                              Text(
                                'g/L',
                                style: TextStyle(
                                  color: (double.parse(lipid['apob']) >= 0.5 &&
                                          double.parse(lipid['apob']) <= 1.3)
                                      ? Colors.black
                                      : Colors.red,
                                ),
                              ),
                              Text(
                                '0.5 - 1.3',
                                style: TextStyle(
                                  color: (double.parse(lipid['apob']) >= 0.5 &&
                                          double.parse(lipid['apob']) <= 1.3)
                                      ? Colors.black
                                      : Colors.red,
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
                              Text('APOA/APOB'),
                              Text(lipid['apoa_divided_apob']),
                              Text('--'),
                              Text('--'),
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
                            color: lipid['comments'] != null
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
                            lipid['comments'] ?? '',
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

Color _getRiskRatio2Color(double value) {
  if (value < 3.9) {
    return Colors.black;
  } else if (value < 5.0) {
    return Color.fromARGB(255, 235, 187, 42);
  } else if (value < 9.6) {
    return Colors.orange;
  } else {
    return Colors.red;
  }
}

Color _getRatioColor(double ratio) {
  if (ratio < 0.2) {
    return Colors.green;
  } else if (ratio > 0.7 && ratio <= 4.3) {
    return Color.fromARGB(255, 235, 187, 42);
  } else if (ratio > 4.3 && ratio <= 7.5) {
    return Colors.orange;
  } else {
    return Colors.red;
  }
}

Color _getLipoproteinColor(double value) {
  if (value < 20) {
    return Colors.green;
  } else if (value >= 20 && value <= 30) {
    return Color.fromARGB(255, 235, 187, 42);
  } else if (value > 30 && value <= 50) {
    return Colors.orange;
  } else {
    return Colors.red;
  }
}
