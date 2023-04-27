import 'package:flutter/material.dart';
import 'package:mobile_app/colors.dart';
import 'package:mobile_app/pages/welcome_page.dart';
import 'package:intl/intl.dart';

class Bookappoint extends StatefulWidget {
  const Bookappoint({super.key});

  @override
  State<Bookappoint> createState() => _BookappointState();
}

class _BookappointState extends State<Bookappoint> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _notesController = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  //final _dateController = TextEditingController();
  List<String> facilities = ['Dr.Ga3fr el 3omda', 'Nile Scan', 'Alfa lab'];
  String? selectedFacility;
  void facilityCallBack(String? selectedFacVal) {
    if (selectedFacVal is String) {
      setState(() {
        selectedFacility = selectedFacVal;
      });
    }
  }

  void submitButton() {
    if (_formKey.currentState!.validate()) {
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
              Text('Name :${_nameController.text}'),
              Text('Notes :${_notesController.text}'),
              Text('Facility :$selectedFacility'),
              Text('Data :${dateinput.text}'),
              //Text('Data :$  )
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WelcomePage()),
                    );
                  },
                  child: Text('Ok'))
              //Text('Date :${dateinput.text}'),
            ],
          ));
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
      appBar: AppBar(
        title: Text('Book now'),
        centerTitle: true,
        backgroundColor: primary,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                controller: _nameController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: Colors.greenAccent),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Full Name',
                    prefixIcon: Icon(Icons.person_2_outlined)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: DropdownButtonFormField(
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
                      .map<DropdownMenuItem<String>>((String selectedFacVal) {
                    return DropdownMenuItem<String>(
                      value: selectedFacVal,
                      child: Text(selectedFacVal),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a facility';
                    }
                  },
                  value: selectedFacility,
                  onChanged: facilityCallBack,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            dateBox(context),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                minLines: 1,
                maxLines: 5,
                controller: _notesController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: Colors.greenAccent),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Notes',
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 25.0, horizontal: 10.0),
                    prefixIcon: Icon(Icons.notes)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.greenAccent,
                        side: BorderSide(color: primary),
                        backgroundColor: primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0))),
                    onPressed: submitButton,
                    child: Text('Submit'),
                  ),
                ],
              ),
            )
          ],
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
          ),
        ));
  }
}