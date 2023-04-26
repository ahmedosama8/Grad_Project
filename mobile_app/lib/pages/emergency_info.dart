// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app/colors.dart';

class EmergencyInfoPage extends StatefulWidget {
  const EmergencyInfoPage({super.key});

  @override
  State<EmergencyInfoPage> createState() => _EmergencyInfoPage();
}

class _EmergencyInfoPage extends State<EmergencyInfoPage> {
  List<String> items = ['Male', 'Female'];
  String? selectedItem;
  void dropDownCallBack(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        selectedItem = selectedValue;
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

  List<String> chronicDiseaseItems = [
    'I dont have any chronic diseases',
    'Heart Disease',
    'Cancer',
    'Lung Disease',
    'Stroke',
    'Alzheimer',
    'Diabetes',
    'kidney Disease',
    'Other'
  ];
  String? selectedDisease;
  void diseaseCallBack(String? selectedDiseaseVal) {
    if (selectedDiseaseVal is String) {
      setState(() {
        selectedDisease = selectedDiseaseVal;
      });
    }
  }

  List<String> martialItems = [
    'Married',
    'Divorced',
    'Separeted or Widowed',
    'Single'
  ];
  String? selectedStatus;
  void martialCallBack(String? selectedStatusVal) {
    if (selectedStatusVal is String) {
      setState(() {
        selectedStatus = selectedStatusVal;
      });
    }
  }

  void signUpButton() {
    Navigator.of(context).pushNamed('/');
  }

  void openSignInScreen() {
    Navigator.of(context).pushReplacementNamed('login');
  }

  TextEditingController dateinput = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
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
                  child: DatePickerField(labelText: 'Enter your birth date')
                ),
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
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
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
                //Blood type text field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          width: double.infinity,
                          child: DropdownButtonFormField(
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
                //Blood type text field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          width: double.infinity,
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                                icon: Icon(Icons.sick_rounded),
                                border: InputBorder.none),
                            hint: Text('Do you have any chronic disease?'),
                            isExpanded: true,
                            items: chronicDiseaseItems
                                .map<DropdownMenuItem<String>>(
                                    (String selectedDiseaseVal) {
                              return DropdownMenuItem<String>(
                                value: selectedDiseaseVal,
                                child: Text(selectedDiseaseVal),
                              );
                            }).toList(),
                            value: selectedDisease,
                            onChanged: diseaseCallBack,
                          ),
                        )),
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
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          width: double.infinity,
                          child: DropdownButtonFormField(
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
                    onTap: signUpButton,
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
                  Text('You can skip this stage by pressing sign up ',
                      style: GoogleFonts.robotoCondensed(
                          fontWeight: FontWeight.bold)),
                ])
              ],
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
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
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

  Padding dateBox(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: dateinput,
              decoration: InputDecoration(
                  icon: Icon(Icons.calendar_month_outlined),
                  labelText: 'Enter your birth date',
                  border: InputBorder.none),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1930),
                    lastDate: DateTime.now());

                if (pickedDate != null) {
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                  //you can implement different kind of Date Format here according to your requirement

                  setState(() {
                    dateinput.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else {
                  print("Date is not selected");
                }
              },
            )),
      ),
    );
  }

  Padding genderBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
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
                items:
                    items.map<DropdownMenuItem<String>>((String selectedValue) {
                  return DropdownMenuItem<String>(
                    value: selectedValue,
                    child: Text(selectedValue),
                  );
                }).toList(),
                value: selectedItem,
                onChanged: dropDownCallBack,
              ),
            )),
      ),
    );
  }
}


class DatePickerField extends StatefulWidget {
  final String labelText;

  const DatePickerField({Key? key, required this.labelText}) : super(key: key);

  @override
  _DatePickerFieldState createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  final dateinput = TextEditingController();

  @override
  void dispose() {
    dateinput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: primary),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        //borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          controller: dateinput,
          decoration: InputDecoration(
            icon: Icon(Icons.calendar_month_outlined),
            labelText: widget.labelText,
            border: InputBorder.none,
          ),
          readOnly: true,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1930),
              lastDate: DateTime.now(),
            );

            if (pickedDate != null) {
              String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
              setState(() {
                dateinput.text = formattedDate;
              });
            } else {
              print("Date is not selected");
            }
          },
        ),
      ),
    );
  }
}
