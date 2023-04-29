import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class BarCode extends StatelessWidget {
  const BarCode({Key? key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double cardHeight = size.height * 0.25;
    final double qrSize = size.width * 0.6;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: cardHeight,
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
                '659485-9857498-122',
                style: TextStyle(fontSize: size.width * 0.05),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Center(
              child: QrImage(
                data: 'https://jsonplaceholder.typicode.com/posts/4',
                version: QrVersions.auto,
                size: qrSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
