import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Self Care',
            ),
            centerTitle: true,
            backgroundColor: Color(0XFF66CA98),
          ),
          backgroundColor: Color(0XFFF4F6F5),
          body: Column(
            children: [
              Container(
                height: 400,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/background.png'),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Manage your health and happy future' , style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 25.0,
                color: Colors.black
              ),
              textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed:() {
                    Navigator.pushNamed(context, '/login');
                  }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0XFF66CA98),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                  ), 
                  
                  child: Text('GET STARTED'),),
                ],
              )

            ],
          ),
        ));
  }
}