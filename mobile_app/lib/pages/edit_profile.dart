import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app/colors.dart';
import 'dart:io';

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
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      final pickedFile = await ImagePicker().pickImage(
                        source: ImageSource.gallery,
                      );
                      setState(() {
                        _imageFile = File(pickedFile!.path);
                      });
                    },
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('assets/elm3lm_ga3fr.png'),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Username'),
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
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Gender',
                    ),
                    controller: _genderController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a valid gender';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Date of Birth',
                    ),
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
                        return 'Please enter a valid emergency contact number';
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
                        return 'Please enter a valid identity number';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Blood Type',
                    ),
                    controller: _bloodTypeController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a valid blood type';
                      }
                      return null;
                    },
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
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Marital Status',
                    ),
                    controller: _maritalStatusController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a valid marital status';
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
                                String emergencyContactNumber = _emergencyContactNumberController.text;
                                String identityNumber = _identityNumberController.text;
                                String bloodType = _bloodTypeController.text;
                                String chronicDisease = _chronicDiseaseController.text;
                                String maritalStatus = _maritalStatusController.text;
                                
                                // Print the updated values to the console
                                print('Username: $username');
                                print('Full Name: $fullName');
                                print('Gender: $gender');
                                print('Date of Birth: $dateOfBirth');
                                print('Emergency Contact Number: $emergencyContactNumber');
                                print('Identity Number: $identityNumber');
                                print('Blood Type: $bloodType');
                                print('Chronic Disease: $chronicDisease');
                                print('Marital Status: $maritalStatus');
                              Navigator.pop(context);
                        }
                      },
                      child: Text('Save Changes')),
                ],
              ),
            ),
          ),
        ));
  }
}
