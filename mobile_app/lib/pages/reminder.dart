// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:mobile_app/colors.dart';
import 'package:mobile_app/notifications_service.dart';

class Medicine {
  String name;
  TimeOfDay time;
  DateTime date;

  Medicine({required this.name, required this.time, required this.date});
}

class MedicineReminderPage extends StatefulWidget {
  @override
  _MedicineReminderPageState createState() => _MedicineReminderPageState();
}

class _MedicineReminderPageState extends State<MedicineReminderPage> {
  List<Medicine> medicines = [];
  TextEditingController medicineController = TextEditingController();
  TimeOfDay? selectedTime;
  DateTime? selectedDate;
  String? validationMessage;

  showAlertDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      setState(() {
        selectedTime = time;
      });
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  void addMedicine(String name, TimeOfDay time, DateTime date) {
    if (name.isEmpty) {
      setState(() {
        validationMessage = 'Please enter a medicine name.';
      });
    } else {
      setState(() {
        medicines.add(Medicine(name: name, time: time, date: date));
        medicineController.clear();
        selectedTime = null;
        selectedDate = null;
      });
    }
  }

  void deleteMedicine(Medicine medicine) {
    setState(() {
      medicines.remove(medicine);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(),
            color: Colors.white,
          ),
          title: Text(
            'Medicine Reminder',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: primary,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: medicineController,
                    decoration: InputDecoration(
                      labelText: 'Medicine',
                      labelStyle: TextStyle(color:primary),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color:primary),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color:primary),
                      ),
                      errorText: validationMessage,
                      errorStyle: TextStyle(color: Colors.red),
                    ),
                    cursorColor:primary,
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          selectTime(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primary, // Background color
                        ),
                        child: Text(
                          'Select Time',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          selectDate(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primary, // Background color
                        ),
                        child: Text(
                          'Select Date',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  selectedTime != null
                      ? Text('Selected Time: ${selectedTime!.format(context)}')
                      : SizedBox(),
                  selectedDate != null
                      ? Text(
                          'Selected Date: ${selectedDate!.toString().split(' ')[0]}')
                      : SizedBox(),
                  ElevatedButton(
                    onPressed: () async {
                      print(selectedTime!.format(context));
                      print(selectedDate!.toString().split(' ')[0]);
                      await NotficationService.showNotification(
                        title: 'Medicine Reminder',
                        body:
                            'Its a reminder to take ${medicineController.text}.',
                        scheduled: true,
                        interval: 10, // Single notification, not repeating
                        scheduledTime: selectedTime!
                            .format(context), // Time in "1:40 PM" format
                        scheduledDate: selectedDate!
                            .toString()
                            .split(' ')[0], // Date in "2023-05-26" format
                      );
                      if (selectedTime != null && selectedDate != null) {
                        addMedicine(
                          medicineController.text,
                          selectedTime!,
                          selectedDate!,
                        );
                      } else {
                        showAlertDialog(context, 'Failed to add',
                            'Please enter a medicine name.');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary, // Background color
                    ),
                    child: Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: medicines.length,
                itemBuilder: (context, index) {
                  final medicine = medicines[index];
                  return ListTile(
                    title: Text(medicine.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Time: ${medicine.time.format(context)}'),
                        Text('Date: ${medicine.date.toString().split(' ')[0]}'),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        deleteMedicine(medicine);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
