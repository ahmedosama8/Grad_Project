// ignore_for_file: prefer_const_constructors, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:mobile_app/colors.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class MedicineDatabase {
  static Future<Database> open() async {
    final databasePath = await getDatabasesPath();
    final dbPath = path.join(databasePath, 'medicine.db');

    return openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE medicines(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            dose INTEGER,
            time TEXT
          )
        ''');
      },
    );
  }

  static Future<int> insertMedicine(Medicine medicine) async {
    final db = await open();
    final timeValues =
        medicine.times.map((time) => time.toIso8601String()).join(',');

    final result = await db.insert(
      'medicines',
      {
        'name': medicine.name,
        'dose': medicine.dose,
        'time': timeValues,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return result;
  }

    static Future<void> deleteMedicine(Medicine medicine) async {
    final db = await open();
    await db.delete(
      'medicines',
      where: 'name = ? AND dose = ?',
      whereArgs: [medicine.name, medicine.dose],
    );
  }

  

  static Future<List<Medicine>> getAllMedicines() async {
    final db = await open();

    final queryResult = await db.query('medicines');

    return queryResult.map((row) {
      final times = (row['time'] as String)
          .split(',')
          .map((value) => DateTime.parse(value))
          .toList();

      return Medicine(
        name: row['name'] as String,
        dose: row['dose'] as int,
        times: times,
      );
    }).toList();
  }
}

class Medicine {
  String name;
  int dose;
  List<DateTime> times;

  Medicine({required this.name, required this.dose, required this.times});
}

class MedicineReminderPage extends StatefulWidget {
  @override
  _MedicineReminderPageState createState() => _MedicineReminderPageState();
}

class _MedicineReminderPageState extends State<MedicineReminderPage> {
  List<Medicine> medicines = [];
  final nameController = TextEditingController();
  final doseController = TextEditingController();

  Future<void> _showNotification(
      String title, String body, DateTime scheduledDateTime) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: -1,
        channelKey: 'high_importance_channel',
        title: title,
        body: body,
      ),
      schedule: NotificationCalendar.fromDate(
          date: scheduledDateTime, allowWhileIdle: true, repeats: true),
    );
  }

  void _addMedicineTime() async {
    final name = nameController.text;
    final dose = int.tryParse(doseController.text);

    if (name.isEmpty) {
      _showValidationMessage('Please enter a medicine name');
      return;
    }

    if (dose == null || dose <= 0) {
      _showValidationMessage('Please enter a valid dose');
      return;
    }
    final existingMedicine = medicines.firstWhere(
      (medicine) => medicine.name == name && medicine.dose == dose,
      orElse: () => Medicine(name: name, dose: dose, times: []),
    );

    if (existingMedicine.times.length >= dose) {
      _showValidationMessage('You cannot add more times than the dose');
      return;
    }

    DatePicker.showTimePicker(
      context,
      showSecondsColumn: false,
      onConfirm: (time) async {
        setState(() {
          final existingMedicine = medicines.firstWhere(
            (medicine) => medicine.name == name && medicine.dose == dose,
            orElse: () => Medicine(name: name, dose: dose, times: []),
          );

          if (existingMedicine.times.any((existingTime) =>
              existingTime.hour == time.hour &&
              existingTime.minute == time.minute)) {
            // Do not add duplicate time for the same medicine and dose
            return;
          }

          existingMedicine.times.add(time);
          if (!medicines.contains(existingMedicine)) {
            medicines.add(existingMedicine);
          }
        });

        final scheduledDateTime = DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          time.hour,
          time.minute,
        );

        await _showNotification(
          'Medication Reminder',
          'A Reminder to take your $name dose',
          scheduledDateTime,
        );

        final newMedicine =
            Medicine(name: name, dose: dose, times: [scheduledDateTime]);
        await MedicineDatabase.insertMedicine(newMedicine);
      },
    );
  }

  Future<void> _removeMedicineTime(Medicine medicine, int index) async {
    setState(() {
      medicine.times.removeAt(index);

      if (medicine.times.isEmpty) {
        medicines.remove(medicine);
      }
    });
      await MedicineDatabase.deleteMedicine(medicine);

  }

  void _showValidationMessage(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Input Error'),
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

  @override
  void initState() {
    super.initState();
    _loadMedicines();
  }

  Future<void> _loadMedicines() async {
    final storedMedicines = await MedicineDatabase.getAllMedicines();

    setState(() {
      medicines = [];

      for (final storedMedicine in storedMedicines) {
        final existingMedicineIndex = medicines.indexWhere((medicine) =>
            medicine.name == storedMedicine.name &&
            medicine.dose == storedMedicine.dose);

        if (existingMedicineIndex != -1) {
          // Medicine with the same name and dose already exists
          medicines[existingMedicineIndex].times.addAll(storedMedicine.times);
        } else {
          // New medicine, add it to the list
          medicines.add(storedMedicine);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Medicine Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              controller: doseController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Dose',
              ),
            ),
          ),
          ElevatedButton(
            child: Text(
              'Add Time',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: _addMedicineTime,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: medicines.length,
              itemBuilder: (context, medicineIndex) {
                final medicine = medicines[medicineIndex];

                return ExpansionTile(
                  title: Text(medicine.name),
                  subtitle: Text('Dose: ${medicine.dose}'),
                  children: medicine.times.map((time) {
                    final timeIndex = medicine.times.indexOf(time);

                    return ListTile(
                      title: Text('Time: ${time.hour}:${time.minute}'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () =>
                            _removeMedicineTime(medicine, timeIndex),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


// // ignore_for_file: use_build_context_synchronously

// import 'package:flutter/material.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:mobile_app/colors.dart';
// import 'package:mobile_app/notifications_service.dart';

// class Medicine {
//   String name;
//   TimeOfDay time;
//   DateTime date;

//   Medicine({required this.name, required this.time, required this.date});
// }

// class MedicineReminderPage extends StatefulWidget {
//   @override
//   _MedicineReminderPageState createState() => _MedicineReminderPageState();
// }

// class _MedicineReminderPageState extends State<MedicineReminderPage> {
//   List<Medicine> medicines = [];
//   TextEditingController medicineController = TextEditingController();
//   TimeOfDay? selectedTime;
//   DateTime? selectedDate;
//   String? validationMessage;

//   showAlertDialog(BuildContext context, String title, String message) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(title),
//           content: Text(message),
//           actions: <Widget>[
//             TextButton(
//               child: Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Future<void> selectTime(BuildContext context) async {
//     final TimeOfDay? time = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );

//     if (time != null) {
//       setState(() {
//         selectedTime = time;
//       });
//     }
//   }

//   Future<void> selectDate(BuildContext context) async {
//     final DateTime? date = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//     );

//     if (date != null) {
//       setState(() {
//         selectedDate = date;
//       });
//     }
//   }

//   void addMedicine(String name, TimeOfDay time, DateTime date) {
//     if (name.isEmpty) {
//       setState(() {
//         validationMessage = 'Please enter a medicine name.';
//       });
//     } else {
//       setState(() {
//         medicines.add(Medicine(name: name, time: time, date: date));
//         medicineController.clear();
//         selectedTime = null;
//         selectedDate = null;
//       });
//     }
//   }

//   void deleteMedicine(Medicine medicine) {
//     setState(() {
//       medicines.remove(medicine);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           leading: BackButton(
//             onPressed: () => Navigator.of(context).pop(),
//             color: Colors.white,
//           ),
//           title: Text(
//             'Medicine Reminder',
//             style: TextStyle(color: Colors.white),
//           ),
//           backgroundColor: primary,
//         ),
//         body: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   TextFormField(
//                     controller: medicineController,
//                     decoration: InputDecoration(
//                       labelText: 'Medicine',
//                       labelStyle: TextStyle(color:primary),
//                       focusedBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(color:primary),
//                       ),
//                       enabledBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(color:primary),
//                       ),
//                       errorText: validationMessage,
//                       errorStyle: TextStyle(color: Colors.red),
//                     ),
//                     cursorColor:primary,
//                   ),
//                   SizedBox(height: 16.0),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           selectTime(context);
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: primary, // Background color
//                         ),
//                         child: Text(
//                           'Select Time',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 20,
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           selectDate(context);
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: primary, // Background color
//                         ),
//                         child: Text(
//                           'Select Date',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                   selectedTime != null
//                       ? Text('Selected Time: ${selectedTime!.format(context)}')
//                       : SizedBox(),
//                   selectedDate != null
//                       ? Text(
//                           'Selected Date: ${selectedDate!.toString().split(' ')[0]}')
//                       : SizedBox(),
//                   ElevatedButton(
//                     onPressed: () async {
//                       print(selectedTime!.format(context));
//                       print(selectedDate!.toString().split(' ')[0]);
//                       await NotficationService.showNotification(
//                         title: 'Medicine Reminder',
//                         body:
//                             'Its a reminder to take ${medicineController.text}.',
//                         scheduled: true,
//                         interval: 10, // Single notification, not repeating
//                         scheduledTime: selectedTime!
//                             .format(context), // Time in "1:40 PM" format
//                         scheduledDate: selectedDate!
//                             .toString()
//                             .split(' ')[0], // Date in "2023-05-26" format
//                       );
//                       if (selectedTime != null && selectedDate != null) {
//                         addMedicine(
//                           medicineController.text,
//                           selectedTime!,
//                           selectedDate!,
//                         );
//                       } else {
//                         showAlertDialog(context, 'Failed to add',
//                             'Please enter a medicine name.');
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: primary, // Background color
//                     ),
//                     child: Text(
//                       'Add',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: medicines.length,
//                 itemBuilder: (context, index) {
//                   final medicine = medicines[index];
//                   return ListTile(
//                     title: Text(medicine.name),
//                     subtitle: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('Time: ${medicine.time.format(context)}'),
//                         Text('Date: ${medicine.date.toString().split(' ')[0]}'),
//                       ],
//                     ),
//                     trailing: IconButton(
//                       icon: Icon(Icons.delete),
//                       onPressed: () {
//                         deleteMedicine(medicine);
//                       },
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
