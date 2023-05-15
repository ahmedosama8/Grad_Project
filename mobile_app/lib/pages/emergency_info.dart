// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:mobile_app/api/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:mobile_app/colors.dart';
// ignore: unused_import
import 'package:multiselect_formfield/multiselect_formfield.dart';

class EmergencyInfoPage extends StatefulWidget {
  final String username;
  final String name;
  final String email;
  final String phone;
  final String password;

  EmergencyInfoPage(
      {required this.username,
      required this.name,
      required this.email,
      required this.phone,
      required this.password});

  @override
  State<EmergencyInfoPage> createState() => _EmergencyInfoPage();
}

class _EmergencyInfoPage extends State<EmergencyInfoPage> {
  List<String> items = ['Male', 'Female'];
  String? selectedGender;
  void dropDownCallBack(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        selectedGender = selectedValue;
      });
    }
  }

  List<String> bloodTypesItems = [
    'AB+',
    'AB-',
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-'
  ];
  String? selectedBlood;
  void bloodCallBack(String? selectedBloodVal) {
    if (selectedBloodVal is String) {
      setState(() {
        selectedBlood = selectedBloodVal;
      });
    }
  }

  List? selectedAllergy;
  List? selectedDiseases;
  late String selectedDiseasesResult;
  late String selectedAllergyResult;
  final _formKey = GlobalKey<FormState>();
  final emergencyController = TextEditingController();
  final identityNumberController = TextEditingController();
  final addressController = TextEditingController();
  final date = TextEditingController();
  TextEditingController dateinput = TextEditingController();

  //List<Map<String, String>> chronicDiseaseItems = ;

  List<String> martialItems = ['Single', 'Married', 'Divorced', 'Widowed'];
  String? selectedStatus;
  void martialCallBack(String? selectedStatusVal) {
    if (selectedStatusVal is String) {
      setState(() {
        selectedStatus = selectedStatusVal;
      });
    }
  }

  Future<void> _register(String username, String name, String email,
      String phone, String password) async {
    if (_formKey.currentState!.validate()) {
      selectedDiseasesResult = selectedDiseases.toString();
      selectedAllergyResult = selectedAllergy.toString();
      print(selectedDiseasesResult);
      print(selectedAllergyResult);
      print(selectedGender);
      final url = Uri.parse('http://10.0.2.2:8080/api/patient/new');
      final response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode(
            {
              'username': username,
              'password': password,
              'phone': phone,
              'name': name,
              'email': email,
              'gender': selectedGender,
              'marital_status': selectedStatus,
              'address': addressController.text,
              'national_id_number': identityNumberController.text,
              'emergency_contact': emergencyController.text,
              'blood_type': selectedBlood,
              'birth_date': dateinput.text,
              'chronic': selectedDiseases,
              'allergies':selectedAllergy
            },
          ));
        print(response.body);
      // Handle the API response here
      if (response.statusCode == 201) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          'login',
          arguments: {'username': username},
          (Route<dynamic> route) => false,
        );
      } else {
        final responseBody = response.body;
        if (responseBody.isNotEmpty) {
          try {
            final responseData = json.decode(responseBody);
            final errorMessage =
                responseData['error'] ?? 'Something went wrong!';
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text('Error'),
                content: Text(errorMessage),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('OK'),
                  ),
                ],
              ),
            );
          } catch (e) {
            print('Error parsing response: $e');
          }
        } else {
          print('Empty response body');
        }
      }
    }
  }

  void openSignInScreen() {
    Navigator.of(context).pushReplacementNamed('login');
  }

  //text editing controller for text field

  @override
  void initState() {
    dateinput.text = "";
    super.initState();
    selectedDiseases = [];
    selectedDiseasesResult = ''; //set the initial value of text field
  }

  @override
  void dispose() {
    emergencyController.dispose();
    addressController.dispose();
    identityNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // image
                  Image.asset(
                    'assets/logo2.png',
                    height: 120,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  // title
                  Text(
                    'Emergency Form',
                    style: GoogleFonts.robotoCondensed(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  // subtitle
                  Text(
                    'For Emergency cases please fill this form',
                    style: GoogleFonts.robotoCondensed(
                      fontSize: 18,
                    ),
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  //gender field
                  genderBox(),
                  SizedBox(
                    height: 10,
                  ),
                  // Date Text field
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: primary),
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          //borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a date';
                              }
                              return null;
                            },
                            controller: dateinput,
                            decoration: InputDecoration(
                              icon: Icon(Icons.calendar_month_outlined),
                              labelText: 'Enter your birth date',
                              border: InputBorder.none,
                            ),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime(1930),
                                firstDate: DateTime(1930),
                                lastDate: DateTime.now(),
                              );

                              if (pickedDate != null) {
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                setState(() {
                                  dateinput.text = formattedDate;
                                });
                              } else {
                                print("Date is not selected");
                              }
                            },
                          ),
                        ),
                      )),
                  //dateBox(context),
                  SizedBox(
                    height: 10,
                  ),
                  //Emergency number field
                  emergencyNoBox(),
                  SizedBox(
                    height: 10,
                  ),
                  // ssn text field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: primary),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please write your identity number';
                            } else if (value.length != 14) {
                              return "Write a true identity number";
                            } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                              return 'identity number must contain only digits';
                            }
                            return null;
                          },
                          controller: identityNumberController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Identity No',
                              icon: Icon(Icons.calendar_view_day)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //address
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: primary),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please write your address';
                            }
                            return null;
                          },
                          controller: addressController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Address',
                              icon: Icon(Icons.location_on)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  //Blood type text field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: primary),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            width: double.infinity,
                            child: DropdownButtonFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select your blood type';
                                }
                              },
                              decoration: InputDecoration(
                                  icon: Icon(Icons.bloodtype_rounded),
                                  border: InputBorder.none),
                              hint: Text('Please choose your blood type'),
                              isExpanded: true,
                              items: bloodTypesItems
                                  .map<DropdownMenuItem<String>>(
                                      (String selectedBloodVal) {
                                return DropdownMenuItem<String>(
                                  value: selectedBloodVal,
                                  child: Text(selectedBloodVal),
                                );
                              }).toList(),
                              value: selectedBlood,
                              onChanged: bloodCallBack,
                            ),
                          )),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  //disease text field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: primary),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            width: double.infinity,
                            child: MultiSelectFormField(
                              border: InputBorder.none,
                              fillColor: Color.fromARGB(255, 255, 255, 255),
                              autovalidate: AutovalidateMode.disabled,
                              dialogTextStyle:
                                  TextStyle(fontWeight: FontWeight.bold),
                              checkBoxActiveColor: Colors.greenAccent,
                              checkBoxCheckColor: Colors.white,
                              dialogShapeBorder: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0))),
                              title: Text('Select diseases'),
                              dataSource: const [
                                {
                                  'display': 'Hypertension',
                                  'value': 'hypertension'
                                },
                                {'display': 'Diabetes', 'value': 'diabetes'},
                                {'display': 'Asthma', 'value': 'asthma'},
                                {
                                  'display': 'Heart Disease',
                                  'value': 'heart_disease'
                                },
                                {'display': 'Cancer', 'value': 'cancer'},
                                {'display': 'Arthritis', 'value': 'arthritis'},
                                {
                                  'display': 'Depression',
                                  'value': 'depression'
                                },
                                {'display': 'Migraine', 'value': 'migraine'},
                                {
                                  'display': 'Kidney Disease',
                                  'value': 'kidney_disease'
                                },
                                {
                                  'display': 'Liver Disease',
                                  'value': 'liver_disease'
                                },
                                {
                                  'display': 'Thyroid Disease',
                                  'value': 'thyroid_disease'
                                },
                                {
                                  'display': 'Osteoporosis',
                                  'value': 'osteoporosis'
                                },
                                {'display': 'None', 'value': 'none'},
                                {'display': 'Other', 'value': 'other'},
                              ],
                              validator: (value) {
                                if (value == null || value.length == 0) {
                                  return 'Please select one or more options';
                                }
                                return null;
                              },
                              textField: 'display',
                              valueField: 'value',
                              okButtonLabel: 'OK',
                              cancelButtonLabel: 'CANCEL',
                              hintWidget:
                                  Text('Please select one or more diseases'),
                              initialValue: selectedDiseases,
                              onSaved: (value) {
                                if (value == null) return;
                                setState(() {
                                  selectedDiseases = value;
                                });
                              },
                            ),
                          )),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  //allergy text
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: primary),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            width: double.infinity,
                            child: MultiSelectFormField(
                              border: InputBorder.none,
                              fillColor: Color.fromARGB(255, 255, 255, 255),
                              autovalidate: AutovalidateMode.disabled,
                              dialogTextStyle:
                                  TextStyle(fontWeight: FontWeight.bold),
                              checkBoxActiveColor: Colors.greenAccent,
                              checkBoxCheckColor: Colors.white,
                              dialogShapeBorder: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0))),
                              title: Text('Select allergy'),
                              dataSource: const [
                                {
                                  'value': 'Penicillin',
                                  'display': 'Penicillin'
                                },
                                {'value': 'Sulfa', 'display': 'Sulfa'},
                                {'value': 'Shellfish', 'display': 'Shellfish'},
                                {'value': 'Peanuts', 'display': 'Peanuts'},
                                {'value': 'Eggs', 'display': 'Eggs'},
                                {'value': 'Milk', 'display': 'Milk'},
                                {'value': 'Other', 'display': 'Other'},
                              ],
                              validator: (value) {
                                if (value == null || value.length == 0) {
                                  return 'Please select one or more options';
                                }
                                return null;
                              },
                              textField: 'display',
                              valueField: 'value',
                              okButtonLabel: 'OK',
                              cancelButtonLabel: 'CANCEL',
                              hintWidget:
                                  Text('Please select one or more allergy'),
                              initialValue: selectedAllergy,
                              onSaved: (value) {
                                if (value == null) return;
                                setState(() {
                                  selectedAllergy = value;
                                });
                              },
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //martal status text field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: primary),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            width: double.infinity,
                            child: DropdownButtonFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please choose your status';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  icon: Icon(Icons.people_alt),
                                  border: InputBorder.none),
                              hint: Text('Martial status'),
                              isExpanded: true,
                              items: martialItems.map<DropdownMenuItem<String>>(
                                  (String selectedStatusVal) {
                                return DropdownMenuItem<String>(
                                  value: selectedStatusVal,
                                  child: Text(selectedStatusVal),
                                );
                              }).toList(),
                              value: selectedStatus,
                              onChanged: martialCallBack,
                            ),
                          )),
                    ),
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  // sign in button

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: GestureDetector(
                      onTap: () {
                        _register(widget.username, widget.name, widget.email,
                            widget.phone, widget.password);
                      },
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Color(0XFF66CA98),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                            child: Text(
                          'Sign up',
                          style: GoogleFonts.robotoCondensed(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  // sign up text
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text('Please fill your real data for your safety',
                        style: GoogleFonts.robotoCondensed(
                            fontWeight: FontWeight.bold)),
                  ])
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding emergencyNoBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: primary),
            color: Colors.white,
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please write your emergency';
              }
              return null;
            },
            controller: emergencyController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Emergency contact number',
                icon: Icon(Icons.contact_emergency_outlined)),
          ),
        ),
      ),
    );
  }

  Padding genderBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: primary),
            color: Colors.white,
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.supervisor_account_rounded),
                    border: InputBorder.none),
                hint: Text('Please select your gender'),
                isExpanded: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please select a gender';
                  }
                },
                items:
                    items.map<DropdownMenuItem<String>>((String selectedValue) {
                  return DropdownMenuItem<String>(
                    value: selectedValue,
                    child: Text(selectedValue),
                  );
                }).toList(),
                value: selectedGender,
                onChanged: dropDownCallBack,
              ),
            )),
      ),
    );
  }
}
