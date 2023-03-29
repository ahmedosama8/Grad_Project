import 'package:flutter/material.dart';
import 'package:mobile_app/Widgets/MenuBarWidget.dart';

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(218, 245, 245, 245),
      bottomNavigationBar: menubar(context),
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                elevation: 0,
                child: SizedBox(
                    width: double.infinity,
                    height: 175,
                    child: Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://st.depositphotos.com/1779253/5140/v/450/depositphotos_51405259-stock-illustration-male-avatar-profile-picture-use.jpg"),
                            radius: 50,
                          ),
                          SizedBox(width: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('NAME',
                                  style: TextStyle(
                                      color: Colors.grey, letterSpacing: 2.0)),
                              SizedBox(height: 20),
                              Text('Address',
                                  style: TextStyle(
                                      color: Colors.grey, letterSpacing: 2.0)),
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
