
import 'package:flutter/material.dart';

class UserIdProvider with ChangeNotifier {
  int? _id;
  String? _username;
  int? get id => _id;
  String? get username => _username;

  void setId(int id, String username) {
    _id = id;
    _username = username;
    notifyListeners();
  }
}






















// import 'dart:convert';

// List<Patient> patientFromJson(String str) => List<Patient>.from(json.decode(str).map((x) => Patient.fromJson(x)));

// String patientToJson(List<Patient> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Patient {
//     int patientId;
//     String username;
//     String password;
//     String gender;
//     String phone1;
//     String phone2;
//     String mail;
//     String bloodType;
//     List<Allergy> allergies;
//     List<MedicalCondition> medicalConditions;
//     int age;
//     String firstName;
//     DateTime birthDate;
//     String nationalIdNumber;
//     String city;



//     Patient({
//         required this.patientId,
//         required this.username,
//         required this.password,
//         required this.gender,
//         required this.phone1,
//         required this.phone2,
//         required this.mail,
//         required this.bloodType,
//         required this.allergies,
//         required this.medicalConditions,
//         required this.age,
//         required this.firstName,
//         required this.birthDate,
//         required this.nationalIdNumber,
//         required this.city,

//     });

//     factory Patient.fromJson(Map<String, dynamic> json) => Patient(
//         patientId: json["patient_id"],
//         username: json["username"],
//         password: json["password"],
//         gender: json["gender"],
//         phone1: json["phone1"],
//         phone2: json["phone2"],
//         mail: json["mail"],
//         bloodType: json["bloodType"],
//         allergies: List<Allergy>.from(json["allergies"].map((x) => Allergy.fromJson(x))),
//         medicalConditions: List<MedicalCondition>.from(json["medicalConditions"].map((x) => MedicalCondition.fromJson(x))),
//         age: json["age"],
//         firstName: json["firstName"],
//         birthDate: DateTime.parse(json["birthDate"]),
//         nationalIdNumber: json["nationalIdNumber"],
//         city: json["city"],
//     );

//     Map<String, dynamic> toJson() => {
//         "patient_id": patientId,
//         "username": username,
//         "password": password,
//         "gender": gender,
//         "phone1": phone1,
//         "phone2": phone2, 
//         "mail": mail,
//         "bloodType": bloodType,
//         "allergies": List<dynamic>.from(allergies.map((x) => x.toJson())),
//         "medicalConditions": List<dynamic>.from(medicalConditions.map((x) => x.toJson())),
//         "age": age,
//         "firstName": firstName,
//         "birthDate": "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
//         "nationalIdNumber": nationalIdNumber,
//         "city": city,
//     };
// }

// class Allergy {
//     int allergyId;
//     String patient;
//     String allergyName;
//     String allergySeverity;
//     DateTime allergyOnsetDate;

//     Allergy({
//         required this.allergyId,
//         required this.patient,
//         required this.allergyName,
//         required this.allergySeverity,
//         required this.allergyOnsetDate,
//     });

//     factory Allergy.fromJson(Map<String, dynamic> json) => Allergy(
//         allergyId: json["allergyId"],
//         patient: json["patient"],
//         allergyName: json["allergyName"],
//         allergySeverity: json["allergySeverity"],
//         allergyOnsetDate: DateTime.parse(json["allergyOnsetDate"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "allergyId": allergyId,
//         "patient": patient,
//         "allergyName": allergyName,
//         "allergySeverity": allergySeverity,
//         "allergyOnsetDate": "${allergyOnsetDate.year.toString().padLeft(4, '0')}-${allergyOnsetDate.month.toString().padLeft(2, '0')}-${allergyOnsetDate.day.toString().padLeft(2, '0')}",
//     };
// }

// class MedicalCondition {
//     int medicalConditionId;
//     String patient;
//     String conditionName;
//     String conditionSeverity;
//     String conditionOnsetDate;

//     MedicalCondition({
//         required this.medicalConditionId,
//         required this.patient,
//         required this.conditionName,
//         required this.conditionSeverity,
//         required this.conditionOnsetDate,
//     });

//     factory MedicalCondition.fromJson(Map<String, dynamic> json) => MedicalCondition(
//         medicalConditionId: json["medicalConditionId"],
//         patient: json["patient"],
//         conditionName: json["conditionName"],
//         conditionSeverity: json["conditionSeverity"],
//         conditionOnsetDate: json["conditionOnsetDate"],
//     );

//     Map<String, dynamic> toJson() => {
//         "medicalConditionId": medicalConditionId,
//         "patient": patient,
//         "conditionName": conditionName,
//         "conditionSeverity": conditionSeverity,
//         "conditionOnsetDate": conditionOnsetDate,
//     };
// }