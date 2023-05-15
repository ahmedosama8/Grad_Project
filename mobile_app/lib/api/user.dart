import 'package:flutter/material.dart';

class UserIdProvider with ChangeNotifier {
  int? _id;
  String? _username;
  String? _fullname;
  String? _email;
  String? _address;
  String? _gender;
  String? _dob;
  String? _bloodType;
  String? _emergencyNumber;
  String? _identityNumber;
  String? _phoneNumber;
  String? _maritalStatus;
  String?_allergies;
  String?_chronicDisease;




  int? get id => _id;
  String? get username => _username;
  String? get fullname => _fullname;
  String? get email => _email;
  String? get address => _address;
  String? get gender => _gender;
  String? get dob => _dob;
  String? get bloodType => _bloodType;
  String? get emergencyNumber => _emergencyNumber;
  String? get identityNumber => _identityNumber;
  String? get phoneNumber => _phoneNumber;
  String? get maritalStatus => _maritalStatus;
  String? get allergies => _allergies;
  String? get chronicDisease => _chronicDisease;
  
  void setId(int? id) {
    _id = id;
    notifyListeners();
  }

  void setNames(String username, String fullname){
    _username = username;
    _fullname = fullname;
    notifyListeners();
  }
   void setData(String dob,
   String email,
   String address,
   String gender,
   String bloodType,
   String emergencyNumber,
   String identityNumber,
   String phoneNumber,
   String maritalStatus,
    String allergies,
    String chronicDisease
   ) 
   
   {
    _dob = dob;
    _email = email;
    _address = address;
    _gender = gender;
    _bloodType = bloodType;
    _emergencyNumber = emergencyNumber;
    _identityNumber = identityNumber;
    _phoneNumber = phoneNumber;
    _maritalStatus = maritalStatus;
    _allergies = allergies;
    _chronicDisease = chronicDisease; 
    notifyListeners();
  }
}
















