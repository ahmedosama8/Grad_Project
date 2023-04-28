import 'package:flutter/material.dart';
import 'package:mobile_app/colors.dart';

class PatientSchedule {
  final String doctorName;
  final String facility;
  final String bookedDate;
  final String notes;

  PatientSchedule({
    required this.doctorName,
    required this.facility,
    required this.bookedDate,
    required this.notes,
  });
}


class PatientScheduleTable extends StatefulWidget {
  final List<PatientSchedule> schedules;

  PatientScheduleTable({required this.schedules});

  @override
  _PatientScheduleTableState createState() => _PatientScheduleTableState();
}

class _PatientScheduleTableState extends State<PatientScheduleTable> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: Text('My schedule'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                'Doctor Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Facility',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Booked Date',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Notes',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
          rows: widget.schedules
              .map(
                (schedule) => DataRow(
                  cells: <DataCell>[
                    DataCell(Text(schedule.doctorName)),
                    DataCell(Text(schedule.facility)),
                    DataCell(Text(schedule.bookedDate)),
                    DataCell(Text(schedule.notes)),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
