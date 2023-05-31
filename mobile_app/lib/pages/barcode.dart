import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_app/colors.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:provider/provider.dart';
import 'package:mobile_app/api/user.dart';
import 'package:mobile_app/configure.dart';
import 'package:http/http.dart' as http;

class BarCode extends StatelessWidget {
  const BarCode({Key? key});
  Future<void> orderedCard(int patientId) async {
    final data = {
      'image': 'ordered a card'
    }; // Create a Map with the updated name

    final response = await http.put(
        Uri.parse('${AppUrl.Base_Url}/patient/$patientId'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data));

    if (response.statusCode == 200) {
      // Request successful
      print('ordered a card');
    } else {
      // Request failed
      print('Failed to order');
    }
  }

  @override
  Widget build(BuildContext context) {
    int id = Provider.of<UserIdProvider>(context, listen: false).id!;
    final fullname =
        Provider.of<UserIdProvider>(context, listen: false).fullname;
    final address = Provider.of<UserIdProvider>(context, listen: false).address;

    final Size size = MediaQuery.of(context).size;
    final double qrSize = size.width * 0.6;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                clipBehavior: Clip.antiAlias,
                shadowColor: Colors.greenAccent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('assets/pp.png'),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 230,
                        child: Center(
                          child: Text(
                            '$fullname',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Center(
              child: Text(
                'Medical ID', //Da el patient ID
                style: TextStyle(fontSize: size.width * 0.1),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Center(
              child: Text(
                '$id',
                style: TextStyle(fontSize: size.width * 0.05),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Center(
              child: QrImageView(
                data: "${AppUrl.front_Url}patient-info/$id",
                version: QrVersions.auto,
                size: qrSize,
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.greenAccent,
                  side: BorderSide(color: primary),
                  backgroundColor: primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0))),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                          'Please confirm your order to proceed with the purchase.'),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        //position
                        mainAxisSize: MainAxisSize.min,
                        // wrap content in flutter

                        children: [
                          Text('Name :$fullname'),
                          Text('Address :$address'),
                        ],
                      ),
                      actions: [
                        TextButton(
                          child: Text('Confirm'),
                          onPressed: () {
                            orderedCard(id);
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Order Placed'),
                                    content: Text(
                                        'Your order has been placed. We will contact you to confirm your purchase.'),
                                    actions: [
                                      TextButton(
                                        child: Text('Close'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  );
                                });
                          },
                        ),
                        TextButton(
                          child: Text('Close'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Order Self-Care card'),
            ),
          ],
        ),
      ),
    );
  }
}
