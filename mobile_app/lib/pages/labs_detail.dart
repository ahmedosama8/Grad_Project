import 'package:flutter/material.dart';
import 'package:mobile_app/colors.dart';
import 'package:mobile_app/labs_data_model.dart';
import 'package:url_launcher/url_launcher.dart';

class LabDetail extends StatelessWidget {
  final LabsDataModel labsDataModel;
  const LabDetail({Key? key, required this.labsDataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primary,
        title: Text(labsDataModel.name),
      ),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          AspectRatio(aspectRatio: 4/3,
          child: Image.network(labsDataModel.imageUrl,
          //fit: BoxFit.cover,
          ),
          ),
         
          SizedBox(
            height: 70,
            child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: primary,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: ListTile(
                    title: Text(labsDataModel.urlWeb),
                    leading: Icon(Icons.web_outlined,
                    size: 36,
                    color: primary,),
                    trailing: ElevatedButton(
                    onPressed: () async {
                    final url =labsDataModel.urlWeb;
                    final Uri uri= Uri(scheme: 'https',host: url);
                    if (!await launchUrl(uri, mode:
                    LaunchMode.externalApplication)) {
                      throw "Can not launch url";
                    }
                  }
                  ,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                  ),
                  child: Text('Go'),
                    
                  ),
                  
                  ),
                ),
          ),
    
            SizedBox(
              height: 70,
              child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: primary,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ListTile(
                      title: Text(labsDataModel.phone),
                      leading: Icon(Icons.call,
                      size: 36,
                      color: primary,),
                      trailing: ElevatedButton(
                      onPressed: () async {
                      final phoneNumber =labsDataModel.phone;
                      final Uri uri= Uri(scheme: 'tel',path: phoneNumber);
                      if (!await launchUrl(uri, mode:
                      LaunchMode.externalApplication)) {
                        throw "Can not launch url";
                      }
                    }
                    ,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                    ),
                    child: Text('Call'),
                      
                    ),
                    
                    
                                  )
                
              ),
            ),


          // Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       Icon(Icons.web_outlined,
          //       size: 36,
          //       color: primary,),
          //       SizedBox(width: 8,),
          //       SelectableText(item.urlWeb,style:GoogleFonts.robotoCondensed(
          //                 fontSize: 20,
          //                 fontWeight: FontWeight.bold
          //               ),
          //               ),
          
          //       SizedBox(width: 8,),        
          //       ElevatedButton(
          //         onPressed: () async {
          //         final url =item.urlWeb;
          //         final Uri uri= Uri(scheme: 'https',host: url);
          //         if (!await launchUrl(uri, mode:
          //         LaunchMode.externalApplication)) {
          //           throw "Can not launch url";
          //         }
          //       }
          //       ,
          //       style: ElevatedButton.styleFrom(
          //         backgroundColor: primary,
          //       ),
          //        child: Text('Go'),
                  
          //       ),
          //     ],
          //   ),
          // ),
            
            // Padding(
            //   padding: const EdgeInsets.all(10.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [              
            //     Icon(Icons.call,
            //     size: 36,
            //     color: primary,),
            //     SizedBox(width: 8,),
            //     SelectableText(item.phone,style:GoogleFonts.robotoCondensed(
            //               fontSize: 20,
            //               fontWeight: FontWeight.bold
            //     ),
            //     ),
            
            //     SizedBox(width: 8,),   
            
            //       ElevatedButton(onPressed: () async {
            //       final phoneNum =item.phone;
            //       final Uri uri= Uri(scheme: 'tel',path: phoneNum);
            //       if (!await launchUrl(uri, mode:
            //       LaunchMode.externalApplication)) {
            //         throw "Can not launch url";
            //       }
            //           }, 
            //           style: ElevatedButton.styleFrom(
            //       backgroundColor: primary,
            //           ), 
            //           child: Text('Call')),
            //     ],
            //   ),
            // )

        ],
      ),
    );
}
}