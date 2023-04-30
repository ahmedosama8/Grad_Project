import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mobile_app/colors.dart';
import 'package:mobile_app/labs_data_model.dart';
import 'package:mobile_app/pages/home.dart';
import 'package:mobile_app/pages/labs_detail.dart';

class LabList extends StatelessWidget {
  LabList({super.key});
  final List<LabsDataModel> labdata = List.generate(
      HomePage.labName.length,
      (index) => LabsDataModel(
          HomePage.labName[index],
          '${HomePage.pic[index]}',
          '${HomePage.labName[index]} Description....',
          '${HomePage.labWeb[index]}',
          '${HomePage.labPhone[index]}'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Labs & Centers'),
        backgroundColor: primary,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: labdata.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.greenAccent,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 0,
                  child: ListTile(
                    title: Text(labdata[index].name),
                    leading: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset('assets/${labdata[index].imageUrl}'),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              LabDetail(labsDataModel: labdata[index])));
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
