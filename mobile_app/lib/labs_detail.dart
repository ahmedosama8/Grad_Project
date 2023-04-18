import 'package:flutter/material.dart';
import 'package:mobile_app/colors.dart';
import 'package:mobile_app/labs_data_model.dart';

class LabDetail extends StatelessWidget {
  final LabsDataModel labsDataModel;
  const LabDetail({Key? key, required this.labsDataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(labsDataModel.name),
      elevation: 0,
      backgroundColor: primary,),
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(labsDataModel.imageUrl),
            Text(labsDataModel.desc),
          ],
        ),
      ),
    );
  }
}