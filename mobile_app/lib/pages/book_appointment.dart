import 'package:flutter/material.dart';
import 'package:mobile_app/colors.dart';
import 'package:mobile_app/pages/home.dart';

import 'emergency_info.dart';

class Bookappoint extends StatefulWidget {
  const Bookappoint({super.key});

  @override
  State<Bookappoint> createState() => _BookappointState();
}

class _BookappointState extends State<Bookappoint> {
  List<String> facilities = ['Dr.Ga3fr el 3omda', 'Nile Scan', 'Alfa lab'];
  String? selectedFacility;
  void facilityCallBack(String? selectedFacVal) {
    if (selectedFacVal is String) {
      setState(() {
        selectedFacility = selectedFacVal;
      });
    }
  }

  final _nameController = TextEditingController();
  final _notesController = TextEditingController();
  bool _btnActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book now'),
        centerTitle: true,
        backgroundColor: primary,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.greenAccent),
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
            height: 10,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: DatePickerField(labelText: 'Book now')),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              minLines: 1,
              maxLines: 5,
              controller: _notesController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.greenAccent),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Notes',
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 25.0, horizontal: 10.0),
                  prefixIcon: Icon(Icons.notes)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
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
                  onPressed: () {
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
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()),
                                  );
                                },
                                child: Text('Ok'))
                            //Text('Date :${dateinput.text}'),
                          ],
                        ));
                      },
                    );
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
