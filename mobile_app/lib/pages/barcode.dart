import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class BarCode extends StatelessWidget {
  const BarCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Card(
                clipBehavior: Clip.antiAlias,
                shadowColor: Colors.greenAccent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('assets/elm3lm_ga3fr.png'),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      SizedBox(
                        width: 230,
                        child: Text(
                          'جعفر العمدة',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                'Medical ID', //Da el patient ID
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                '659485-9857498-122',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Center(
              child: QrImage(
                data: 'https://jsonplaceholder.typicode.com/posts/4',
                version: QrVersions.auto,
                size: 300.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
