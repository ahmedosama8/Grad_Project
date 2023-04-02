// ignore_for_file: prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:mobile_app/colors.dart';
import 'package:mobile_app/pages/login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AppModel{
  final String image;
  final String title;
  final String body;

  AppModel({
    required this.title,
    required this.image,
    required this.body,

  });


}

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  
  var homeScreenController = PageController();

  List<AppModel> pages= [
    AppModel(title: 'Manage your health and happy future', image: 'assets/background.png', body: 'On board 1 body'),
    AppModel(title: 'Emergency', image: 'assets/emergency.png', body: 'On board 2 body'),
    AppModel(title: 'All your data in your mobile', image: 'assets/emr.png', body: 'On board 3 body')

  ];
  bool isLast = false;

  void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, 
    MaterialPageRoute(builder: (context) => widget,),
    (route) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed:() {
            navigateAndFinish(context,Login());
          }, child: Text(
            'SKIP',
            style: TextStyle(
              color: Colors.black
            ),
          ))
        ],
        elevation: 0.0,
        ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
            physics: BouncingScrollPhysics(),  
            controller: homeScreenController,
            onPageChanged: (int index) {
              if (index == pages.length - 1) {
                setState(() {
                  isLast = true;
                });
              } else {
                setState(() {
                  isLast = false;
                });
              }

            },
            itemBuilder: (context, index) => buildAppScreenItem(pages[index]),
            itemCount: pages.length,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                SmoothPageIndicator(
                  controller: homeScreenController,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: primary,
                    dotHeight: 10,
                    expansionFactor: 4,
                    dotWidth: 10,
                    spacing: 5,  
                  ) , 
                  count:pages.length ),
                Spacer(),
                FloatingActionButton(onPressed:() {
                  if (isLast) {
                   navigateAndFinish(context,Login());
                  }
                  else{
                  homeScreenController.nextPage(duration: Duration(milliseconds: 750), curve: Curves.fastLinearToSlowEaseIn);
                  }
                },
                child: Icon(Icons.arrow_forward_ios),)
              ],
            ),
          )
      
      
      
        ],
      
      
      )
        
      );  



  }

  Widget buildAppScreenItem(AppModel model) =>   Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
                  height: 500,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('${model.image}'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              '${model.title} ',
              textAlign: TextAlign.center,
              style: TextStyle(
                 fontWeight: FontWeight.w600,
                  fontSize: 25.0,
                  color: Colors.black
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              '${model.body}',
              style: TextStyle(
                 fontWeight: FontWeight.w600,
                  fontSize: 15.0,
                  color: Colors.black
              ),)
        ],
      );  

}
 
 