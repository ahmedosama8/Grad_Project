import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_template/flutter_login_template.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:mobile_app/Widgets/SignupWidget.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Login> {
  bool _ishiddenpassword = true;
  final password = TextEditingController();
  final email = TextEditingController();
  bool emailfilled = false;
  bool passwordfilled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              //3ashan el keyboard lma kan yetl3 kan bytl3 errors
              child: Padding(
                  padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage('assets/lotus.png'),
                          radius: 40.0,
                        ),
                      ),
                      SizedBox(height: 50),
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
                      SizedBox(
                        height: 20.0,
                      ),
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
                      SizedBox(height: 20.0),
                      Center(
                        child: SizedBox(
                          height: 50, //height of button
                          width: 150,
                          child: ElevatedButton(
                            child: Text("log in ",
                                style: TextStyle(color: Colors.white)),
                            onPressed: () {
                              if (passwordfilled == false ||
                                  emailfilled == false) {
                                _onBasicAlertPressed(context);
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 70),
                      Center(child: buildSignupBtn(context))
                    ],
                  )),
            )));
  }

  void toggleIcon() {
    setState(() {
      _ishiddenpassword = !_ishiddenpassword;
    });
  }

  _onBasicAlertPressed(context) {
    Alert(
      context: context,
      title: "Log-in Error",
      desc: "please fill the data to log in ",
    ).show();
  }
}
