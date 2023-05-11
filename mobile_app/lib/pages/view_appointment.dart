// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/api/user.dart';
import 'package:mobile_app/colors.dart';
import 'package:provider/provider.dart';

class AppointmentDetailsPage extends StatefulWidget {
  @override
  _AppointmentDetailsPageState createState() => _AppointmentDetailsPageState();
}

class _AppointmentDetailsPageState extends State<AppointmentDetailsPage> {
  List<dynamic> appointments = [];

  Future<void> fetchData() async {
    int userId = Provider.of<UserIdProvider>(context, listen: false).id!;
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/appointment/patient/$userId'));
    if (response.statusCode == 200) {
      setState(() {
        appointments = json.decode(response.body);
      });
    } else {
      print('Failed to fetch data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment Details'),
        backgroundColor: primary,
      ),
      body: appointments.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                final appointment = appointments[index];
                final doctorName = appointment['doctor']['name'];
                final appointmentDate = appointment['appointmentDate'];
                final appointmentType = appointment['appointmentType'];
                final appointmentStatus = appointment['appointmentStatus'];
                final appointmentNotes = appointment['appointmentNotes'];

                return  Padding(
                  padding: EdgeInsets.all(16.0),
                  child: DataTable(
                    columnSpacing: 16.0,
                    columns: [
                      DataColumn(label: Text('Details')),
                      DataColumn(label: Text('Value')),
                    ],
                    rows: [
                      DataRow(
                        cells: [
                          DataCell(Text('Doctor')),
                          DataCell(Text(doctorName)),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text('Appointment Date')),
                          DataCell(Text(appointmentDate)),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text('Appointment Type')),
                          DataCell(Text(appointmentType)),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text('Appointment Status')),
                          DataCell(Text(appointmentStatus)),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text('Appointment Notes')),
                          DataCell(Text(appointmentNotes ?? 'N/A')),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
