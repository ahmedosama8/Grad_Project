import 'package:flutter/material.dart';
import 'package:mobile_app/colors.dart';

class Medicine {
  String name;
  String time;

  Medicine({required this.name, required this.time});
}

class MedicineReminderPage extends StatefulWidget {
  @override
  _MedicineReminderPageState createState() => _MedicineReminderPageState();
}

class _MedicineReminderPageState extends State<MedicineReminderPage> {
  List<Medicine> medicines = [];
  TextEditingController medicineController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  void addMedicine(String name, String time) {
    setState(() {
      medicines.add(Medicine(name: name, time: time));
      medicineController.clear();
      timeController.clear();
    });
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
        primarySwatch: primary,
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
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: medicineController,
                      decoration: InputDecoration(
                        labelText: 'Medicine',
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: TextFormField(
                      controller: timeController,
                      decoration: InputDecoration(
                        labelText: 'Time',
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      addMedicine(medicineController.text, timeController.text);
                    },
                    child: Text('Add', style: TextStyle(color: Colors.white)),
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
                    subtitle: Text('Time: ${medicine.time}'),
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
