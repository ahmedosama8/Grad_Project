import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mobile_app/api/doctor.dart';
import 'package:mobile_app/colors.dart';
// ignore: unused_import
import 'package:mobile_app/pages/welcome_page.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../api/user.dart';
import '../configure.dart';

class Bookappoint extends StatefulWidget {
  const Bookappoint({super.key});

  @override
  State<Bookappoint> createState() => _BookappointState();
}

class _BookappointState extends State<Bookappoint> {
  List<String> appointmentTypes = [
    'General Check-up',
    'Specialist Consultation',
    'Follow-up Appointment',
    'Diagnostic Test Appointment',
    'Vaccination Appointment',
    'Therapy or Counseling Session',
    'Surgical Procedure',
    'Maternity or Prenatal Appointment',
    'Dental or Oral Health Appointment',
    'Physical Therapy Appointment',
  ];

  Future<void> createAppointment(
      String appointmentDate, String appointmentType, int userId) async {
    final Uri apiUrl = Uri.parse(
        '${AppUrl.Base_Url}/appointment/$userId/new?lab=${selectedfacility?.doctorId}');

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    final Map<String, dynamic> data = {
      'appointment_date': appointmentDate,
      'appointment_type': appointmentType,
      'appointment_status': "on going",
      'patient_id': userId,
      'entity_id': selectedfacility?.doctorId
    };

    final String body = json.encode(data);

    final http.Response response =
        await http.post(apiUrl, headers: headers, body: body);

    if (response.statusCode != 201) {
      throw Exception('Failed to create appointment.');
    } else {
      print(body);
    }
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController dateinput = TextEditingController();
  late List<Doctor> facilities = []; //de hakhodha mn backend wla laa
  Doctor? selectedfacility;
  @override
  void initState() {
    super.initState();
    fetchDoctors().then((data) {
      setState(() {
        facilities = data;
      });
    });
  }

  String? selectedAppointmentType;
  void submitButton() {
    if (_formKey.currentState!.validate()) {
      int userId = Provider.of<UserIdProvider>(context, listen: false).id!;
      //print(selectedfacility?.doctorId);
      createAppointment(dateinput.text, selectedAppointmentType!, userId);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              //position
              mainAxisSize: MainAxisSize.min,
              // wrap content in flutter
              children: <Widget>[
                Text('your booking details'),
                SizedBox(
                  height: 5,
                ),
                Text('Type :$selectedAppointmentType'),
                Text('Facility :${selectedfacility?.name}'),
                Text('Date :${dateinput.text}'),
//walahy el 3azeeeem shaghalaaaaa
                //Text('Data :$  )
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      'home',
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: Text('Ok'),
                )
                //Text('Date :${dateinput.text}'),
              ],
            ),
          );
        },
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Book now'),
        centerTitle: true,
        backgroundColor: primary,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Theme(
            data: ThemeData(primarySwatch: primary),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: MediaQuery.of(context).size.height * 0.02,
                  ),
                  child: DropdownButtonFormField(
                    value: selectedAppointmentType,
                    onChanged: (value) {
                      setState(() {
                        selectedAppointmentType = value!;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a valid Type';
                      }
                      return null;
                    },
                    items: appointmentTypes.map((String appointmentType) {
                      return DropdownMenuItem<String>(
                        value: appointmentType,
                        child: Text(appointmentType),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.local_hospital_outlined),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: 'Appointment Type',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  child: SizedBox(
                    width: double.infinity,
                    child: DropdownButtonFormField<Doctor>(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.local_hospital_outlined),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.greenAccent),
                            borderRadius: BorderRadius.circular(12),
                          )),
                      hint: Text('Facility'),
                      isExpanded: true,
                      items: facilities
                          .map<DropdownMenuItem<Doctor>>((Doctor doctor) {
                        return DropdownMenuItem<Doctor>(
                          value: doctor,
                          child: Text(doctor.name),
                        );
                      }).toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a facility';
                        }
                      },
                      value: selectedfacility,
                      onChanged: (Doctor? newValue) {
                        setState(() {
                          selectedfacility = newValue;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                dateBox(context),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                      vertical: MediaQuery.of(context).size.height * 0.02),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                      vertical: MediaQuery.of(context).size.height * 0.02),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shadowColor: Colors.greenAccent,
                          side: BorderSide(color: primary),
                          backgroundColor: primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0))),
                      onPressed: () {
                        submitButton();
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding dateBox(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid date';
              }
              return null;
            },
            controller: dateinput,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.calendar_month_outlined),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.greenAccent),
                  borderRadius: BorderRadius.circular(12),
                ),
                labelText: 'Book now',
                border: InputBorder.none),
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2024));

              if (pickedDate != null) {
                // print(
                //     pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                // print(
                //     formattedDate); //formatted date output using intl package =>  2021-03-16
                //you can implement different kind of Date Format here according to your requirement

                setState(() {
                  dateinput.text =
                      formattedDate; //set output date to TextField value.
                });
              } else {}
            },
          ),
        ));
  }
}
