import 'package:flutter/material.dart';
import 'package:mobile_app/colors.dart';
import 'package:mobile_app/pages/edit_profile.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PatientProfilePage extends StatefulWidget {
  @override
  _PatientProfilePageState createState() => _PatientProfilePageState();
}

class _PatientProfilePageState extends State<PatientProfilePage> {
  File? _image;
  final _formKey = GlobalKey<FormState>();
  String _username = "JohnDoe"; // default username
  String _fullName = "John Doe"; // default full name
  String _gender = "Male"; // default gender
  String _dob = "01/01/1970"; // default date of birth
  String _emergencyContactNumber = "01117880524"; // default emergency contact number
  String _identityNumber = "12345678912345"; // default identity number
  String _bloodType = "O+"; // default blood type
  String _chronicDisease = "None"; // default chronic disease
  String _maritalStatus = "Single"; // default marital status
  String _allergies = "None"; // default allergies status
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: Center(child: Text('Patient Profile')),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Stack(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      CircleAvatar(
                        radius: 60.0,
                        backgroundImage: _image == null ? null : FileImage(_image!),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: pickImage,
                          child: Icon(
                            Icons.edit,
                            color: primary,
                          ),
                        ),
                      ),
                    ]),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Username',
                          contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        controller: TextEditingController(text: _username),
                        enabled: false,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Full name',
                          contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        controller: TextEditingController(text: _fullName),
                        enabled: false,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Gender',
                          contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        controller: TextEditingController(text: _gender),
                        enabled: false,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Date of birth',
                          contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        controller: TextEditingController(text: _dob),
                        enabled: false,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Emergency Contact Number',
                          contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        controller: TextEditingController(
                            text: _emergencyContactNumber),
                        enabled: false,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Identity Number',
                          contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        controller:
                            TextEditingController(text: _identityNumber),
                        enabled: false,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Blood Type',
                          contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        controller: TextEditingController(text: _bloodType),
                        enabled: false,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Chronic Disease',
                          contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        controller:
                            TextEditingController(text: _chronicDisease),
                        enabled: false,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Martial Status',
                          contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        controller: TextEditingController(text: _maritalStatus),
                        enabled: false,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Allergies',
                          contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        controller: TextEditingController(text: _allergies),
                        enabled: false,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfilePage(
                            username: _username,
                            fullName: _fullName,
                            dob: _dob,
                            gender: _gender,
                            emergencyContactNumber: _emergencyContactNumber,
                            profileImage: _image,
                            bloodType: _bloodType,
                            chronicDisease: _chronicDisease,
                            identityNumber: _identityNumber,
                            maritalStatus: _maritalStatus,
                            allergies: _allergies),
                      ),
                    );
                  },
                  child: Text('Edit your data'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

void pickImage() async {
  // ignore: deprecated_member_use
  PickedFile? pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);

  if (pickedImage != null) {
    setState(() {
      _image = File(pickedImage.path);
    });
  }
}
}

