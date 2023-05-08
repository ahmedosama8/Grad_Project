// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:mobile_app/api/user.dart';



class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> _register() async {
    final url = Uri.parse('http://10.0.2.2:8080/patient/new');
    final response = await http.post(
      url,
      headers: {
    'Content-Type': 'application/json',},
      body:  json.encode( {
        'username': usernameController.text,
        'password': passwordController.text,
      },)
    );

    // Handle the API response here
    if (response.statusCode == 200) {
      Navigator.pushReplacementNamed(context, 'login',
          arguments: {'username': usernameController.text});
    } else {    
    final responseBody = response.body;
    if (responseBody.isNotEmpty) {
      try {
        final responseData = json.decode(responseBody);
        final errorMessage = responseData['error'] ?? 'Something went wrong!';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'username',
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (passwordController.text != confirmPasswordController.text) {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('Error'),
                      content: Text('Passwords do not match!'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                  return;
                }
                _register();
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> _login() async {
    final url = Uri.parse('http://10.0.2.2:8080/patient/login');
    final response = await http.post(
      url,
      headers: {
    'Content-Type': 'application/json',},
      body:  json.encode( {
        'username': usernameController.text,
        'password': passwordController.text,
      },)
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final int id = responseData['patient_id'];
      final String gender = responseData['gender'] ?? '';
      final String number = responseData['phone1'] ?? '';
      final String username = responseData['username'];
      final userIdProvider = Provider.of<UserIdProvider>(context, listen: false);
      userIdProvider.setId(id , username);
 
      Navigator.pushReplacementNamed(context, 'home',
          arguments: {'username': usernameController.text});
      print('dosh');
      print(id);
      print(username);
      print(number);
      print(gender);
    } else {    
    final responseBody = response.body;
    if (responseBody.isNotEmpty) {
      try {
        final responseData = json.decode(responseBody);
        final errorMessage = responseData['error'] ?? 'Something went wrong!';
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
    // Handle the API response here
    //print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'username',
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userIdProvider = Provider.of<UserIdProvider>(context);
    final id = userIdProvider.id;
    final username = userIdProvider.username;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ID: $id'),
            Text('Username: $username')
          ],
        ),
      ),
    );
  }
}





