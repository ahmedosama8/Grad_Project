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
  File? _imageFile;
  final _formKey = GlobalKey<FormState>();
  String _username = "JohnDoe"; // default username
  String _fullName = "John Doe"; // default full name
  String _gender = "Male"; // default gender
  String _dob = "01/01/1970"; // default date of birth
  String _emergencyContactNumber =
      "+1 123-456-7890"; // default emergency contact number
  String _identityNumber = "123456789"; // default identity number
  String _bloodType = "O+"; // default blood type
  String _chronicDisease = "None"; // default chronic disease
  String _maritalStatus = "Single"; // default marital status

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: Center(child: Text('Patient Profile')),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Center(
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
                SizedBox(height: 30.0),
                Text(
                  'Username: $_username',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Full Name: $_fullName',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Gender: $_gender',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Date of Birth: $_dob',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Emergency Contact Number: $_emergencyContactNumber',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Identity Number: $_identityNumber',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Blood Type: $_bloodType',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Chronic Disease: $_chronicDisease',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Marital Status: $_maritalStatus',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
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
                            profileImage: _imageFile,
                            bloodType: _bloodType,
                            chronicDisease: _chronicDisease,
                            identityNumber: _identityNumber,
                            maritalStatus: _maritalStatus),
                      ),
                    );
                  },
                  child: Text('Edit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
