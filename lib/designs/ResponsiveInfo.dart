import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponsiveInfo{


 static bool isMobile(BuildContext context)
{

  bool a=false;
  double width = MediaQuery.of(context).size.shortestSide;

  if(width<600)
    {
      a=true;
    }
  else{
    a=false;
  }

  return a;

}

static bool isPortrait(BuildContext context)
{

  return MediaQuery.of(context).orientation == Orientation.portrait;
}


 static showAlertDialog(String title,String message) {

   Get.dialog(
     AlertDialog(
       title:  Text(title),
       content:  Text(message),
       actions: [
         TextButton(
           child:  Text("Close"),
           onPressed: () => Get.back(),
         ),
       ],
     ),
   );


 }



 static showProgressDialog() {

   Get.dialog(
     AlertDialog(
       title:  Text("Task"),
       content:  Padding(padding: EdgeInsets.all(10),

       child: Row(

         children: [

           Padding(padding: EdgeInsets.all(5),
           child: CircularProgressIndicator(),
           ),
           Padding(padding: EdgeInsets.all(5),
             child: Text("Loading...."),
           ),

         ],
       ),
       ),



       actions: [
         // TextButton(
         //   child:  Text("Close"),
         //   onPressed: () => Get.back(),
         // ),
       ],
     ),
   );


 }

 // static bool isTab(BuildContext context)
 // {
 //
 //   bool a=false;
 //   double width = MediaQuery.of(context).size.width;
 //
 //   if(width<1024)
 //   {
 //     a=true;
 //   }
 //   else{
 //     a=false;
 //   }
 //
 //   return a;
 //
 // }
 //
 //
 // static bool isSmallMobile(BuildContext context)
 // {
 //
 //   bool a=false;
 //   double width = MediaQuery.of(context).size.width;
 //
 //   if(width<=380)
 //   {
 //     a=true;
 //   }
 //   else{
 //     a=false;
 //   }
 //
 //   return a;
 //
 // }





}