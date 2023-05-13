
// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app/colors.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../api/user.dart';

class EditProfilePage extends StatefulWidget {
  final String? fullName;
  final String? email;
  final String? gender;
  final String? dob;
  final String? username;
  final String? address;
  final String? emergencyContactNumber;
  final String? identityNumber;
  final String? bloodType;
  final String? chronicDisease;
  final String? maritalStatus;
  final String? allergies;
  final File? profileImage;

  EditProfilePage({
    required this.fullName,
    required this.email,
    required this.gender,
    required this.dob,
    required this.username,
    required this.address,
    required this.emergencyContactNumber,
    required this.identityNumber,
    required this.bloodType,
    required this.chronicDisease,
    required this.maritalStatus,
    required this.allergies,
    this.profileImage,
  });

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  File? _imageFile;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _fullNameController;
  late TextEditingController _emailController;
  late TextEditingController _genderController;
  late TextEditingController _dobController;
  late TextEditingController _userNameController;
  late TextEditingController _addressController;
  late TextEditingController _emergencyContactNumberController;
  late TextEditingController _identityNumberController;
  late TextEditingController _bloodTypeController;
  late TextEditingController _chronicDiseaseController;
  late TextEditingController _maritalStatusController;
  late TextEditingController _allergiesController;

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

  Future<void> _update() async {
    if (_formKey.currentState!.validate()) {
      int userId = Provider.of<UserIdProvider>(context, listen: false).id!;
      final url = Uri.parse('http://10.0.2.2:8080/api/patient/$userId');
      final response = await http.put(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode(
            {
              'username': _userNameController.text,
              //'phone':phone,
              'name': _fullNameController.text,
              'email': _emailController.text,
              'gender': _genderController.text,
              'marital_status': _maritalStatusController.text,
              'address': _addressController.text,
              'national_id_number': _identityNumberController.text,
              'emergency_contact': _emergencyContactNumberController.text,
              'blood_type': _bloodTypeController.text,
              'birth_date': _dobController.text,
              //'medicalConditions':selectedDiseasesResult
            },
          ));

      // Handle the API response here
      if (response.statusCode == 200) {
        showAlertDialog(context, 'Profile updated successfully',
            'Please restart to see the changes');
      } else {
        final responseBody = response.body;
        if (responseBody.isNotEmpty) {
          try {
            final responseData = json.decode(responseBody);
            final errorMessage =
                responseData['error'] ?? 'Something went wrong!';
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text('Error'),
                content: Text(errorMessage),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('OK'),
                  ),
                ],
              ),
            );
          } catch (e) {
            print('Error parsing response: $e');
          }
        } else {
          print('Empty response body');
        }
      }
    }
  }

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      int userId = Provider.of<UserIdProvider>(context, listen: false).id!;
      final url = Uri.parse('http://10.0.2.2:8080/api/patient/$userId');
      final response = await http.put(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode(
            {
              'username': _userNameController.text,
              //'phone':phone,
              'name': _fullNameController.text,
              'email': _emailController.text,
              'gender': _genderController.text,
              'marital_status': _maritalStatusController.text,
              'address': _addressController.text,
              'national_id_number': _identityNumberController.text,
              'emergency_contact': _emergencyContactNumberController.text,
              'blood_type': _bloodTypeController.text,
              'birth_date': _dobController.text,
              //'medicalConditions':selectedDiseasesResult
            },
          ));

      // Handle the API response here
      if (response.statusCode == 200) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('Profile updated successfully!'),
            content: Text('Restart the app to see your latest updates!'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Ok'),
              ),
            ],
          ),
        );
      } else {
        final responseBody = response.body;
        if (responseBody.isNotEmpty) {
          try {
            final responseData = json.decode(responseBody);
            final errorMessage =
                responseData['error'] ?? 'Something went wrong!';
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text('Error'),
                content: Text(errorMessage),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('OK'),
                  ),
                ],
              ),
            );
          } catch (e) {
            print('Error parsing response: $e');
          }
        } else {
          print('Empty response body');
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController(text: widget.fullName);
    _emailController = TextEditingController(text: widget.email);
    _genderController = TextEditingController(text: widget.gender);
    _dobController = TextEditingController(text: widget.dob);
    _userNameController = TextEditingController(text: widget.username);
    _addressController = TextEditingController(text: widget.address);
    _emergencyContactNumberController =
        TextEditingController(text: widget.emergencyContactNumber);
    _identityNumberController =
        TextEditingController(text: widget.identityNumber);
    _bloodTypeController = TextEditingController(text: widget.bloodType);
    _chronicDiseaseController =
        TextEditingController(text: widget.chronicDisease);
    _maritalStatusController =
        TextEditingController(text: widget.maritalStatus);
    _allergiesController = TextEditingController(text: widget.allergies);
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _genderController.dispose();
    _userNameController.dispose();
    _dobController.dispose();
    _addressController.dispose();
    _emergencyContactNumberController.dispose();
    _identityNumberController.dispose();
    _bloodTypeController.dispose();
    _chronicDiseaseController.dispose();
    _maritalStatusController.dispose();
    _allergiesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primary,
          title: Text('Edit Profile'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Theme(
                data: ThemeData(primarySwatch: primary),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                      ),
                      controller: _fullNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid full name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                      controller: _emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Username',
                      ),
                      controller: _userNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please your username';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Address',
                      ),
                      controller: _addressController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid address';
                        }
                        return null;
                      },
                    ),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Gender',
                      ),
                      value: _genderController.text,
                      onChanged: (newValue) {
                        setState(() {
                          _genderController.text = newValue!;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please choose a gender';
                        }
                        return null;
                      },
                      items: ['Male', 'Female']
                          .map((label) => DropdownMenuItem(
                                value: label,
                                child: Text(label),
                              ))
                          .toList(),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Date of Birth',
                      ),
                      onTap: () async {
                        DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (selectedDate != null) {
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(selectedDate);
                          _dobController.text = formattedDate;
                        }
                      },
                      controller: _dobController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid date of birth';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Emergency Contact Number',
                      ),
                      keyboardType: TextInputType.number,
                      controller: _emergencyContactNumberController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please write emergency number';
                        } else if (value.length != 11) {
                          return "Write a true number";
                        } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return 'Phone number must contain only digits';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Identity Number',
                      ),
                      keyboardType: TextInputType.number,
                      controller: _identityNumberController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please write your identity number';
                        } else if (value.length != 14) {
                          return "Write a true identity number";
                        } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return 'identity number must contain only digits';
                        }
                        return null;
                      },
                    ),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Blood Type',
                      ),
                      value: _bloodTypeController.text,
                      onChanged: (newValue) {
                        setState(() {
                          _bloodTypeController.text = newValue!;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please choose a blood type';
                        }
                        return null;
                      },
                      items: [
                        'None',
                        'AB+',
                        'AB-',
                        'A+',
                        'A-',
                        'B+',
                        'B-',
                        'O+',
                        'O-'
                      ]
                          .map((label) => DropdownMenuItem(
                                value: label,
                                child: Text(label),
                              ))
                          .toList(),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Chronic Disease',
                      ),
                      controller: _chronicDiseaseController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid chronic disease';
                        }
                        return null;
                      },
                    ),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Marital Status',
                      ),
                      value: _maritalStatusController.text,
                      onChanged: (newValue) {
                        setState(() {
                          _maritalStatusController.text = newValue!;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid marital status';
                        }
                        return null;
                      },
                      items: ['Single', 'Married', 'Divorced', 'Widowed']
                          .map((label) => DropdownMenuItem(
                                value: label,
                                child: Text(label),
                              ))
                          .toList(),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Allergies',
                      ),
                      controller: _allergiesController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid allergy';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primary,
                        ),

                        onPressed: _register,
                        child: Text(
                          'Save Changes',
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
