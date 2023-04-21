import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mobile_app/pharm_data_model.dart';

class PharmPage extends StatelessWidget {
final CardItem item;

  const PharmPage({
    Key? key,
    required this.item,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          AspectRatio(aspectRatio: 4/3,
          child: Image.network(item.urlImage,
          //fit: BoxFit.cover,
          ),
          ),
          const SizedBox(height: 10,),
          Text(item.title)

        ],
      ),
    );
  }
}