import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:tasknew/data/user_profile.dart';

import '../constants/Constants.dart';
import '../designs/ResponsiveInfo.dart';
import 'login.dart';


class Profile extends StatefulWidget {
   Profile() ;

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  String name="";
  String email="";
  String image="";
  String phone="";
  String address="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   getDbData();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1f5f9),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {

              Navigator.pop(context);

            }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        title: Text(
          "Profile",
          style: TextStyle(
              color: Colors.black,
              fontSize:ResponsiveInfo.isMobile(context)? 15 :18,
              fontFamily: 'poppins',
              fontWeight: FontWeight.normal),
        ),


      ),
      body: Stack(

        children: [

          Align(
            alignment: FractionalOffset.topCenter,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,

              children: [

                Padding(padding:  EdgeInsets.all(ResponsiveInfo.isMobile(context)?12:14),


                    child: (image.isNotEmpty)?


                    CircleAvatar(
                      radius: 55.0,
                      backgroundImage:
                      NetworkImage(image),
                      backgroundColor: Colors.transparent,
                    ) : Container(

                      child: Icon(Icons.account_circle,color: Colors.black54,size: 110,),


                    )             ),

                Padding(padding:  EdgeInsets.all(ResponsiveInfo.isMobile(context)?8:12),

                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        Expanded(child: Text( "Name : ", style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,
                            fontSize: ResponsiveInfo.isMobile(context)?16:19)),flex: 1,)
                        
                        
                        ,
    Expanded(child:  Text( name, style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,
                            
                            fontSize: ResponsiveInfo.isMobile(context)?16:19)),flex:1)

                      ],

                    )

                ),

                Padding(padding:  EdgeInsets.all(ResponsiveInfo.isMobile(context)?8:12),

                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [

                      Expanded(child:
                        Text( "Email : ", style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,
                            fontSize: ResponsiveInfo.isMobile(context)?16:19)),flex:1),
    Expanded(child:  Text( email, style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,
                            fontSize: ResponsiveInfo.isMobile(context)?16:19)),flex:1)

                      ],

                    )

                ),

                Padding(padding:  EdgeInsets.all(ResponsiveInfo.isMobile(context)?8:12),

                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
    Expanded(child:  Text( "Phone : ", style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,
                            fontSize: ResponsiveInfo.isMobile(context)?16:19)),flex:1),
    Expanded(child:  Text( phone, style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,
                            fontSize: ResponsiveInfo.isMobile(context)?16:19)),flex:1)

                      ],

                    )

                ),

                Padding(padding:  EdgeInsets.all(ResponsiveInfo.isMobile(context)?8:12),

                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                      Expanded(child:  Text( "Address : ", style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,
                            fontSize: ResponsiveInfo.isMobile(context)?16:19)),flex:1),
    Expanded(child: Text( address, style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,
                            fontSize: ResponsiveInfo.isMobile(context)?16:19)),flex:1)

                      ],

                    )

                ),

              ],

            ) ,
          )
        ],
      )






    );
  }




getDbData()async
{
  final preferenceDataStorage = await SharedPreferences
      .getInstance();
  String? a= preferenceDataStorage.getString(
      AppConstants.profilekey);


       var parseddata=json.decode(a.toString());
      setState(() {

        name=parseddata['name'].toString();
        address=parseddata['Address'].toString();
        phone=parseddata['phone'].toString();
        email=parseddata['email'].toString();
        image=parseddata['image'].toString();

      });
  //
  //
  //   }
  //
  // });
}


}
