import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_app/configure.dart';

Future<List<Doctor>> fetchDoctors() async {
  final response = await http.get(Uri.parse('${AppUrl.Base_Url}/doctor/list'));
  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    final List<Doctor> doctors =
        data.map((item) => Doctor.fromJson(item)).toList();
    return doctors;
  } else {
    throw Exception('Failed to fetch doctors');
  }
}

class Doctor {
  final int doctorId;
  final String gender;
  final String phone1;
  final String mail;
  final String name;
  final String city;
  final String street;

  Doctor({
    required this.doctorId,
    required this.gender,
    required this.phone1,
    required this.mail,
    required this.name,
    required this.city,
    required this.street,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      doctorId: json['doctor_id'],
      gender: json['gender'],
      phone1: json['phone1'],
      mail: json['mail'],
      name: json['name'],
      city: json['city'],
      street: json['street'],
    );
  }
}
