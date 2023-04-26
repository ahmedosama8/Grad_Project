import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mobile_app/colors.dart';
import './emergency_info.dart';

class Book_appoint extends StatefulWidget {
  const Book_appoint({super.key});

  @override
  State<Book_appoint> createState() => _Book_appointState();
}

class _Book_appointState extends State<Book_appoint> {
  List<String> facilities = ['Ga3fr el 3omda', 'Nile Scan', 'Alfa lab'];
  String? selectedStatus;
  void facilityCallBack(String? selectedStatusVal) {
    if (selectedStatusVal is String) {
      setState(() {
        selectedStatus = selectedStatusVal;
      });
    }
  }

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
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.greenAccent),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Full Name',
                  prefixIcon: Icon(Icons.person_2_outlined)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please write your full name ';
                } else if (value.length < 4) {
                  return "Too short write your full name";
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SizedBox(
              width: double.infinity,
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.people_alt),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: Colors.greenAccent),
                      borderRadius: BorderRadius.circular(12),
                    )),
                hint: Text('Facility'),
                isExpanded: true,
                items: facilities
                    .map<DropdownMenuItem<String>>((String selectedStatusVal) {
                  return DropdownMenuItem<String>(
                    value: selectedStatusVal,
                    child: Text(selectedStatusVal),
                  );
                }).toList(),
                value: selectedStatus,
                onChanged: facilityCallBack,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
