import 'package:flutter/material.dart';
import 'package:mobile_app/colors.dart';

class LipTestpage extends StatelessWidget {
  final Map<String, dynamic> lipid;
  const LipTestpage({Key? key, required this.lipid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  height: 2000,
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
                              ),
                              Expanded(
                                child: Text(
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
                              ),
                              Expanded(
                                child: Text(
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
                              ),
                              Expanded(
                                child: Text(
                                  'Desirable: < 200 mg/dL\nBorderline High: 200-239 mg/dl\nHigh: >= 240 mg/dL',
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
                                  'HDL-C',
                                  style: TextStyle(
                                    color: getHDLColor(
                                        double.parse(lipid['hdl_c'])),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  lipid['hdl_c'].toString(),
                                  style: TextStyle(
                                    color: getHDLColor(
                                        double.parse(lipid['hdl_c'])),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'mg/dL',
                                  style: TextStyle(
                                    color: getHDLColor(
                                        double.parse(lipid['hdl_c'])),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Low HDL: < 40 mg/dL\nBorderline Low: 40-60 mg/dL\nAcceptable: > 60 mg/dL\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0',
                                  style: TextStyle(
                                    color: getHDLColor(
                                        double.parse(lipid['hdl_c'])),
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
                                  'LDL-C',
                                  style: TextStyle(
                                    color: getLDLColor(
                                        double.parse(lipid['ldl_c'])),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  lipid['ldl_c'].toString(),
                                  style: TextStyle(
                                    color: getLDLColor(
                                        double.parse(lipid['ldl_c'])),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'mg/dL',
                                  style: TextStyle(
                                    color: getLDLColor(
                                        double.parse(lipid['ldl_c'])),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Desirable: < 100 mg/dL\nAbove Desirable: 100-129 mg/dL\nBorderline High: 130-159 mg/dL\nHigh: 160-189 mg/dL\nVery High: >= 190 mg/dL',
                                  style: TextStyle(
                                    color: getLDLColor(
                                        double.parse(lipid['ldl_c'])),
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
                                  'Triglycerides',
                                  style: TextStyle(
                                    color: getTriglyceridesColor(
                                        double.parse(lipid['triglycerides'])),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  lipid['triglycerides'].toString(),
                                  style: TextStyle(
                                    color: getTriglyceridesColor(
                                        double.parse(lipid['triglycerides'])),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'mg/dL',
                                  style: TextStyle(
                                    color: getTriglyceridesColor(
                                        double.parse(lipid['triglycerides'])),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '< 150: Desirable\n150-199: Border High Line\n200-499: High\n>= 500: Very High',
                                  style: TextStyle(
                                    color: getTriglyceridesColor(
                                        double.parse(lipid['triglycerides'])),
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
                                  'VLDL\ncholesterol',
                                  style: TextStyle(
                                    color:
                                        double.parse(lipid['vldl_cholestrol']) >
                                                32
                                            ? Colors.red
                                            : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  lipid['vldl_cholestrol'] ?? '',
                                  style: TextStyle(
                                    color:
                                        double.parse(lipid['vldl_cholestrol']) >
                                                32
                                            ? Colors.red
                                            : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'mg/dL',
                                  style: TextStyle(
                                    color:
                                        double.parse(lipid['vldl_cholestrol']) >
                                                32
                                            ? Colors.red
                                            : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'up to: 32',
                                  style: TextStyle(
                                    color:
                                        double.parse(lipid['vldl_cholestrol']) >
                                                32
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
                                  'Total lipids',
                                  style: TextStyle(
                                    color: double.parse(lipid['total_lipids']) >
                                            750
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  lipid['total_lipids'] ?? '',
                                  style: TextStyle(
                                    color: double.parse(lipid['total_lipids']) >
                                            750
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'mg/dL',
                                  style: TextStyle(
                                    color: double.parse(lipid['total_lipids']) >
                                            750
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'up to: 750',
                                  style: TextStyle(
                                    color: double.parse(lipid['total_lipids']) >
                                            750
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
                                  'Risk Ratio 1',
                                  style: TextStyle(
                                    color: double.parse(lipid['risk_ratio_1']) >
                                            5.5
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  lipid['risk_ratio_1'] ?? '',
                                  style: TextStyle(
                                    color: double.parse(lipid['risk_ratio_1']) >
                                            5.5
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '--',
                                  style: TextStyle(
                                    color: double.parse(lipid['risk_ratio_1']) >
                                            5.5
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'up to: 5.5',
                                  style: TextStyle(
                                    color: double.parse(lipid['risk_ratio_1']) >
                                            5.5
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
                                  'Oxidized LDL',
                                  style: TextStyle(
                                    color: double.parse(lipid['oxidized_ldl']) >
                                            117
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  lipid['oxidized_ldl'] ?? '',
                                  style: TextStyle(
                                    color: double.parse(lipid['oxidized_ldl']) >
                                            117
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'U/L',
                                  style: TextStyle(
                                    color: double.parse(lipid['oxidized_ldl']) >
                                            117
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '26 - 117',
                                  style: TextStyle(
                                    color: double.parse(lipid['oxidized_ldl']) >
                                            117
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
                                  'Risk Ratio II',
                                  style: TextStyle(
                                    color: _getRiskRatio2Color(
                                        double.parse(lipid['risk_ratio_2'])),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  lipid['risk_ratio_2'] ?? '',
                                  style: TextStyle(
                                    color: _getRiskRatio2Color(
                                        double.parse(lipid['risk_ratio_2'])),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '--',
                                  style: TextStyle(
                                    color: _getRiskRatio2Color(
                                        double.parse(lipid['risk_ratio_2'])),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '1/2 Average: < 3.9\nAverage: < 5.0\n2 Average: < 9.6\n3 Average: - < 23.4',
                                  style: TextStyle(
                                    color: _getRiskRatio2Color(
                                        double.parse(lipid['risk_ratio_2'])),
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
                                  'H-CRP',
                                  style: TextStyle(
                                    color: double.parse(lipid['h_crp']) <= 3.0
                                        ? Colors.black
                                        : Colors.red,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  lipid['h_crp'] ?? '',
                                  style: TextStyle(
                                    color: double.parse(lipid['h_crp']) <= 3.0
                                        ? Colors.black
                                        : Colors.red,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'mg/L',
                                  style: TextStyle(
                                    color: double.parse(lipid['h_crp']) <= 3.0
                                        ? Colors.black
                                        : Colors.red,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '0 - 3',
                                  style: TextStyle(
                                    color: double.parse(lipid['h_crp']) <= 3.0
                                        ? Colors.black
                                        : Colors.red,
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
                                  'Ratio',
                                  style: TextStyle(
                                    color: _getRatioColor(
                                        double.parse(lipid['ratio'])),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  lipid['ratio'] ?? '',
                                  style: TextStyle(
                                    color: _getRatioColor(
                                        double.parse(lipid['ratio'])),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '--',
                                  style: TextStyle(
                                    color: _getRatioColor(
                                        double.parse(lipid['ratio'])),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Non CAD: 0.2\nStable Angina > 0.7\nUnstable Angina > 4.3\nMyocardial Infarction > 7.5',
                                  style: TextStyle(
                                    color: _getRatioColor(
                                        double.parse(lipid['ratio'])),
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
                                  'Lipoprotein(a)',
                                  style: TextStyle(
                                    color: _getLipoproteinColor(
                                        double.parse(lipid['lipo_protein'])),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  lipid['lipo_protein'] ?? '',
                                  style: TextStyle(
                                    color: _getLipoproteinColor(
                                        double.parse(lipid['lipo_protein'])),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'mg/dL',
                                  style: TextStyle(
                                    color: _getLipoproteinColor(
                                        double.parse(lipid['lipo_protein'])),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Desirable < 20\nBorderline: 20-30\nHigh risk: 31-50\nVery high risk > 50',
                                  style: TextStyle(
                                    color: _getLipoproteinColor(
                                        double.parse(lipid['lipo_protein'])),
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
                                  'APOA',
                                  style: TextStyle(
                                    color: (double.parse(lipid['apoa']) >=
                                                1.08 &&
                                            double.parse(lipid['apoa']) <= 2.25)
                                        ? Colors.black
                                        : Colors.red,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  lipid['apoa'] ?? '',
                                  style: TextStyle(
                                    color: (double.parse(lipid['apoa']) >=
                                                1.08 &&
                                            double.parse(lipid['apoa']) <= 2.25)
                                        ? Colors.black
                                        : Colors.red,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'g/L',
                                  style: TextStyle(
                                    color: (double.parse(lipid['apoa']) >=
                                                1.08 &&
                                            double.parse(lipid['apoa']) <= 2.25)
                                        ? Colors.black
                                        : Colors.red,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '1.08 - 2.25',
                                  style: TextStyle(
                                    color: (double.parse(lipid['apoa']) >=
                                                1.08 &&
                                            double.parse(lipid['apoa']) <= 2.25)
                                        ? Colors.black
                                        : Colors.red,
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
                                  'APOB',
                                  style: TextStyle(
                                    color: (double.parse(lipid['apob']) >=
                                                0.5 &&
                                            double.parse(lipid['apob']) <= 1.3)
                                        ? Colors.black
                                        : Colors.red,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  lipid['apob'] ?? '',
                                  style: TextStyle(
                                    color: (double.parse(lipid['apob']) >=
                                                0.5 &&
                                            double.parse(lipid['apob']) <= 1.3)
                                        ? Colors.black
                                        : Colors.red,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'g/L',
                                  style: TextStyle(
                                    color: (double.parse(lipid['apob']) >=
                                                0.5 &&
                                            double.parse(lipid['apob']) <= 1.3)
                                        ? Colors.black
                                        : Colors.red,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '0.5 - 1.3',
                                  style: TextStyle(
                                    color: (double.parse(lipid['apob']) >=
                                                0.5 &&
                                            double.parse(lipid['apob']) <= 1.3)
                                        ? Colors.black
                                        : Colors.red,
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
                              Expanded(child: Text('APOA/APOB')),
                              Expanded(
                                  child:
                                      Text(lipid['apoa_divided_apob'] ?? '')),
                              Expanded(child: Text('--')),
                              Expanded(child: Text('--')),
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
