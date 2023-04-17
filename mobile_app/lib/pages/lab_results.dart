import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mobile_app/classes/All_menu.dart';

class lab_results extends StatefulWidget {
  const lab_results({super.key});

  @override
  State<lab_results> createState() => _lab_resultsState();
}

class _lab_resultsState extends State<lab_results> {
  List<All_menu> all_menu_items = [
    All_menu(
        exmination: 'complete blood culture', name: 'alfa lab', pic: 'lab.png'),
    All_menu(
        exmination: 'complete blood culture', name: 'alfa lab', pic: 'lab.png'),
    All_menu(
        exmination: 'complete blood culture', name: 'alfa lab', pic: 'lab.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lab results'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        shadowColor: Colors.greenAccent,
        elevation: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  controller: ScrollController(),
                  itemCount: all_menu_items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 1.0, horizontal: 4.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.greenAccent,
                          ),
                          borderRadius:
                              BorderRadius.circular(20.0), //<-- SEE HERE
                        ),
                        child: ListTile(
                          onTap: () {
                            print('${all_menu_items[index].exmination}');
                          },
                          title: Text(all_menu_items[index].exmination),
                          subtitle: Text(all_menu_items[index].name),
                          leading: CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/${all_menu_items[index].pic}')),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
