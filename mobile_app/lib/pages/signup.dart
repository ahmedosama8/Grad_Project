import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  String? GenderValue;
  TextEditingController dateinput = TextEditingController();
  final address = TextEditingController();
  final phonenumber = TextEditingController();
  bool _ishiddenpassword = true;
  final password = TextEditingController();
  final email = TextEditingController();
  bool emailfilled = false;
  bool passwordfilled = false;
  bool numberformatcheck = false;
  bool bod = false;
  final List<String> genderItems = [
    'Male',
    'Female',
  ];

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Sign up Form'),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  TextField(
                      controller: email,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                        prefixIcon: Icon(Icons.email),
                      ),
                      onChanged: (value) {
                        setState(() {
                          emailfilled = value.length >= 1 ? true : false;
                        });
                      }),
                  SizedBox(height: 20),
                  TextField(
                      controller: phonenumber,
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone number',
                        prefixIcon: Icon(Icons.phone),
                      ),
                      onChanged: (value) {
                        setState(() {
                          if (value.length >= 11 || value[0] == 0) {
                            numberformatcheck = true;
                          } else {
                            numberformatcheck = false;
                          }
                          print(numberformatcheck);
                        });
                      }),
                  SizedBox(height: 20),
                  TextField(
                      controller: password,
                      obscureText: _ishiddenpassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: InkWell(
                          onTap: toggleIcon,
                          child: Icon(
                            _ishiddenpassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        labelText: 'Password',
                      ),
                      onChanged: (value) {
                        setState(() {
                          passwordfilled = value.length >= 1 ? true : false;
                        });
                      }),
                  SizedBox(height: 20),
                  TextField(
                      controller: address,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.home),
                        labelText: 'Address',
                      ),
                      onChanged: (value) {}),
                  SizedBox(height: 20),
                  DropdownButtonFormField2(
                    decoration: InputDecoration(
                      //Add isDense true and zero Padding.
                      //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      //Add more decoration as you want here
                      //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                    ),
                    isExpanded: true,
                    hint: const Text(
                      'Select Your Gender',
                      style: TextStyle(fontSize: 14),
                    ),
                    items: genderItems
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select gender.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      GenderValue = value;
                    },
                    buttonStyleData: const ButtonStyleData(
                      height: 60,
                      padding: EdgeInsets.only(left: 20, right: 10),
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 30,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller:
                        dateinput, //editing controller of this TextField
                    decoration: InputDecoration(
                        icon: Icon(Icons.calendar_today), //icon of text field
                        labelText: "Enter date of birth" //label text of field
                        ),
                    readOnly:
                        true, //set it true, so that user will not able to edit text
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(
                              2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101));

                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        bod = true;

                        setState(() {
                          dateinput.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {
                        bod = false;
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 50, //height of button
                    width: 150,
                    child: ElevatedButton(
                      child: Text("Sign up ",
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        if (emailfilled == false ||
                            passwordfilled == false ||
                            numberformatcheck == false ||
                            bod == false ||
                            GenderValue == false) {
                          _onBasicAlertPressed(context);
                        } else {
                          printAll();
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void toggleIcon() {
    setState(() {
      _ishiddenpassword = !_ishiddenpassword;
    });
  }

  _onBasicAlertPressed(context) {
    Alert(
      context: context,
      title: "Sign-up Error",
      desc: "please fill up the required data or check the data ",
    ).show();
  }

  void printAll() {
    print(email.text);
    print(password.text);
    print(GenderValue);
    print(address.text);
    print(phonenumber.text);
    print(dateinput.text);
  }
}
