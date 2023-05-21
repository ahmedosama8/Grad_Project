// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/api/user.dart';
import 'package:mobile_app/colors.dart';
import 'package:mobile_app/configure.dart';
import 'package:provider/provider.dart';

class AppointmentDetailsPage extends StatefulWidget {
  @override
  _AppointmentDetailsPageState createState() => _AppointmentDetailsPageState();
}

class _AppointmentDetailsPageState extends State<AppointmentDetailsPage> {
  List<dynamic> appointmentdetails = [];

  Future<void> fetchData() async {
    int userId = Provider.of<UserIdProvider>(context, listen: false).id!;
    final response = await http.get(
        Uri.parse('http://10.0.2.2:8080/api/patient/$userId/appointments'));
    if (response.statusCode == 200) {
      final List<dynamic> appointmentJsondetails = jsonDecode(response.body);
      final List<Map<String, dynamic>> appointmentdetails = [];
      for (final aptJson in appointmentJsondetails) {
        appointmentdetails.add(Map<String, dynamic>.from(aptJson));
// Fetch entity by ID and update the glucoseList with the entity name
        final entityData = await fetcEntityById(aptJson['entity_id']);
        final entityName = entityData['name'] ?? 'not specified';

        appointmentdetails.last['entityName'] = entityName;
      }
      setState(() {
        this.appointmentdetails = appointmentdetails;
      });
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<Map<String, dynamic>> fetcEntityById(int entityId) async {
    final response =
        await http.get(Uri.parse('${AppUrl.Base_Url}/entity/$entityId'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to fetch doctor');
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
        body: appointmentdetails.isEmpty
            ? Center(
                child: Text(
                'You dont have any appoinments',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ))
            : ListView.builder(
                itemCount: appointmentdetails.length,
                itemBuilder: (context, index) {
                  final appointment = appointmentdetails[index];
                  final doctorName = appointment['entityName'] ?? '';
                  final appointmentDate = appointment['appointment_date'] ?? '';
                  final appointmentType = appointment['appointment_type'] ?? [];
                  final appointmentStatus =
                      appointment['appointment_status'] ?? '';
                  final paymentMethod = appointment['payment_method'] ?? '';

                  return Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Doctor Name: $doctorName'),
                        Text('Appointment Date: $appointmentDate'),
                        Text('Appointment Type:'),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: appointmentType.length,
                          itemBuilder: (context, typeIndex) {
                            final type = appointmentType[typeIndex];
                            return Padding(
                              padding: EdgeInsets.only(left: 16.0),
                              child: Text(type),
                            );
                          },
                        ),
                        Text('Appointment Status: $appointmentStatus'),
                        Text('Payment method : $paymentMethod')
                      ],
                    ),
                  );
                },
              ));
  }
}
