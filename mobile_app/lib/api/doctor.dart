import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_app/configure.dart';

Future<List<Doctor>> fetchDoctors() async {
  final response = await http.get(Uri.parse('${AppUrl.Base_Url}/entity/list'));

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
  final String phone;
  final String email;
  final String name;
  final String username;
  final String address;

  Doctor({
    required this.doctorId,
    required this.email,
    required this.phone,
    required this.username,
    required this.name,
    required this.address,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      doctorId: json['id'],
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      username: json['username'] ?? '',
      name: json['name'] ?? '',
      address: json['address'] ?? '',
    );
  }
}
