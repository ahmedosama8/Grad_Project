import 'package:flutter/material.dart';
import 'package:mobile_app/colors.dart';
import 'package:mobile_app/pages/login.dart';
import 'package:mobile_app/pages/pharmacy.dart';
import 'package:mobile_app/pages/reminder.dart';

class Hub extends StatelessWidget {
  const Hub({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primary,
        title: Center(
          child: Text(
            'Medical Hub',
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MedicineListPage()),
                );
              },
              child: CardWidget(
                title: 'Our Pharmacy',
                description: 'You can order from our pharmacy what you need',
                icon: Icons.local_pharmacy_outlined,
                color: primary,
              ),
            ),
            CardWidget(
              title: 'My medications',
              description: 'View your medications written by your doctors',
              icon: Icons.medical_services_outlined,
              color: primary,
            ),
            InkWell(
                              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MedicineReminderPage()),
                );
              },
              child: CardWidget(
                title: 'Medication reminders',
                description: 'You can add your medecines to remember your doses',
                icon: Icons.add_alarm_outlined,
                color: primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  CardWidget({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Icon(
                icon,
                size: 40,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
