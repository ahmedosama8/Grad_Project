import 'package:flutter/material.dart';
import 'package:mobile_app/api/user.dart';
import 'package:mobile_app/colors.dart';
import 'package:mobile_app/pages/edit_profile.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class PatientProfilePage extends StatefulWidget {
  @override
  _PatientProfilePageState createState() => _PatientProfilePageState();
}

class _PatientProfilePageState extends State<PatientProfilePage> {
  File? _image;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final userIdProvider = Provider.of<UserIdProvider>(context);
    final fullname = userIdProvider.fullname;
    final username = userIdProvider.username;
    final dob = userIdProvider.dob;
    final email = userIdProvider.email;
    final address = userIdProvider.address;
    final gender = userIdProvider.gender;
    final bloodType = userIdProvider.bloodType;
    final emergencyNumber = userIdProvider.emergencyNumber;
    final identityNumber = userIdProvider.identityNumber;
    final martialStatus = userIdProvider.maritalStatus;
    final chronicDisease = userIdProvider.chronicDisease;
    final allergies = userIdProvider.allergies;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: Center(child: Text('Profile')),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage:AssetImage('assets/pp.png'),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Full name',
                          contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        controller: TextEditingController(text: fullname),
                        enabled: false,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        controller: TextEditingController(text: email),
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
                          labelText: 'Username',
                          contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        controller: TextEditingController(text: username),
                        enabled: false,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Address',
                          contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        controller: TextEditingController(text: address),
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
                        controller: TextEditingController(text: gender),
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
                        controller: TextEditingController(text: dob),
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
                        controller: 

                        TextEditingController(text: emergencyNumber),
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
                        controller: TextEditingController(text: identityNumber),
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
                        controller: TextEditingController(text: bloodType),
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
                        controller: TextEditingController(text: chronicDisease),
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
                          labelText: 'Chronic Disease',
                          contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        controller: TextEditingController(text: allergies),
                        enabled: false,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Martial Status',
                          contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        controller: TextEditingController(text:  martialStatus),
                        enabled: false,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfilePage(
                            fullName: fullname,
                            email: email,
                            address: address,
                            username: username,
                            dob: dob,
                            gender: gender,
                            emergencyContactNumber: emergencyNumber,
                            profileImage: _image,
                            bloodType: bloodType,
                            chronicDisease: chronicDisease,
                            identityNumber: identityNumber,
                            maritalStatus: martialStatus,
                            allergies: allergies),
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
    PickedFile? pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);

  if (pickedImage != null) {

    setState(() {
      _image = File(pickedImage.path);
    });
  print(_image);
  }

}
}

