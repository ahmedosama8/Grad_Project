// ignore_for_file: use_build_context_synchronously
<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:mobile_app/colors.dart';
// ignore: unused_import
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:mobile_app/pages/welcome_page.dart';

class EmergencyInfoPage extends StatefulWidget {
  const EmergencyInfoPage({super.key});

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
  final formKey = GlobalKey<FormState>();

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

  void signUpButton() {
    var form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      setState(() {
        selectedDiseasesResult = selectedDiseases.toString();
        selectedAllergyResult = selectedAllergy.toString();
        print(selectedDiseasesResult);
        print(selectedAllergyResult);
        print(selectedGender);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => WelcomePage(),
          ),
        );
      });
    }
  }

  void openSignInScreen() {
    Navigator.of(context).pushReplacementNamed('login');
  }

  TextEditingController dateinput = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    dateinput.text = "";
    super.initState();
    selectedDiseases = [];
    selectedDiseasesResult = ''; //set the initial value of text field
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
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
                      child:
                          DatePickerField(labelText: 'Enter your birth date')),
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
                          border: Border.all(color: primary),
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
                          border: Border.all(color: primary),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            width: double.infinity,
                            child: MultiSelectFormField(
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
                                {'value': 'Other', 'display': 'Other'}
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
            labelText: widget.labelText,
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
    );
  }
}
