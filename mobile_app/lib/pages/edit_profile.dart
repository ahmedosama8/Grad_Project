import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app/colors.dart';
import 'dart:io';
import 'package:intl/intl.dart';

class EditProfilePage extends StatefulWidget {
  final String username;
  final String fullName;
  final String gender;
  final String dob;
  final String emergencyContactNumber;
  final String identityNumber;
  final String bloodType;
  final String chronicDisease;
  final String maritalStatus;
  final String allergies;
  final File? profileImage;

  EditProfilePage({
    required this.username,
    required this.fullName,
    required this.gender,
    required this.dob,
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
  late TextEditingController _usernameController;
  late TextEditingController _fullNameController;
  late TextEditingController _genderController;
  late TextEditingController _dobController;
  late TextEditingController _emergencyContactNumberController;
  late TextEditingController _identityNumberController;
  late TextEditingController _bloodTypeController;
  late TextEditingController _chronicDiseaseController;
  late TextEditingController _maritalStatusController;
  late TextEditingController _allergiesController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController(text: widget.username);
    _fullNameController = TextEditingController(text: widget.fullName);
    _genderController = TextEditingController(text: widget.gender);
    _dobController = TextEditingController(text: widget.dob);
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
    _usernameController.dispose();
    _fullNameController.dispose();
    _genderController.dispose();
    _dobController.dispose();
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
                        labelText: 'Username',
                      ),
                      controller: _usernameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a username';
                        }
                        return null;
                      },
                    ),
                    
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
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // TODO: Save the updated patient information to the database or some other storage
                            // For now, we can just print the information to the console
                            String username = _usernameController.text;
                            String fullName = _fullNameController.text;
                            String gender = _genderController.text;
                            String dateOfBirth = _dobController.text;
                            String emergencyContactNumber =
                                _emergencyContactNumberController.text;
                            String identityNumber =
                                _identityNumberController.text;
                            String bloodType = _bloodTypeController.text;
                            String chronicDisease =
                                _chronicDiseaseController.text;
                            String maritalStatus =
                                _maritalStatusController.text;
                            String allergies = _allergiesController.text;

                            // Print the updated values to the console
                            print('Username: $username');
                            print('Full Name: $fullName');
                            print('Gender: $gender');
                            print('Date of Birth: $dateOfBirth');
                            print(
                                'Emergency Contact Number: $emergencyContactNumber');
                            print('Identity Number: $identityNumber');
                            print('Blood Type: $bloodType');
                            print('Chronic Disease: $chronicDisease');
                            print('Marital Status: $maritalStatus');
                            print('Allergies: $allergies');
                            Navigator.pop(context);
                          }
                        },
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
