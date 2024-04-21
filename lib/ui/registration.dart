import 'package:flutter/material.dart';
import 'package:tasknew/data/SqlHelper.dart';
import 'package:tasknew/data/registration_response.dart';
import 'package:tasknew/ui/home_screen.dart';
import 'package:tasknew/web/ApiProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../designs/ResponsiveInfo.dart';
import '../constants/Constants.dart';
import 'package:get/get.dart';

import '../models/login_response.dart';
class Registration extends StatelessWidget {


  TextEditingController userController = TextEditingController();

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   Registration() ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Get.back();
            }
        ),
        title: Text("Registration",style: TextStyle(color: Colors.white,fontSize: ResponsiveInfo.isMobile(context)? 15:17),),
        backgroundColor: Colors.blue,
        elevation: 4.0,

      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          Padding(
            padding: EdgeInsets.all(ResponsiveInfo.isMobile(context) ? 10 : 15),
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'Email',
              ),
              controller: emailcontroller,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(ResponsiveInfo.isMobile(context) ? 10 : 15),
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
                hintText: 'Username',
              ),
              controller: userController,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(ResponsiveInfo.isMobile(context) ? 10 : 15),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Enter secure password',
              ),
              controller: passwordController,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(ResponsiveInfo.isMobile(context) ? 10 : 15),
            child: Container(
              width: double.infinity,
              height: ResponsiveInfo.isMobile(context) ? 50 : 65,
              decoration: BoxDecoration(
                color: Color(0xff255eab),
                border: Border.all(color: Color(0xff255eab)),
                borderRadius: BorderRadius.all(Radius.circular(ResponsiveInfo.isMobile(context) ? 10 : 15)),
              ),
              child: TextButton(
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white, fontSize: ResponsiveInfo.isMobile(context) ? 12 : 14),
                ),
                onPressed: () async {
                  // Call a function to authenticate user
                  authenticateUser();
                },
              ),
            ),
          ),

        ],
      ),
    );
  }

  Future<void> authenticateUser() async {

    ApiProvider ap=new ApiProvider();

   if(emailcontroller.text.isNotEmpty) {
     if(isValidEmail(emailcontroller.text)) {
       if (userController.text.isNotEmpty) {
         if (passwordController.text.isNotEmpty) {
           if (passwordController.text.length >= 6) {
             ResponsiveInfo.showProgressDialog();

             var m = Map();
             m['email'] = passwordController.text;
             m['username'] = userController.text;
             m['password'] = passwordController.text;


             RegistrationResponse lr = await ap.register(
                 m);

             Get.back();
             print(lr.id);

             if (lr.id!.toString().isNotEmpty) {
               if (!lr.id.toString().contains("0")) {
                 final preferenceDataStorage = await SharedPreferences
                     .getInstance();
                 preferenceDataStorage.setString(
                     AppConstants.token_key, lr.id.toString());
                 SqlHelper.createItem(AppConstants.profiledata).then((value) {

                   Get.to(() =>  HomeScreen());
                 });


               }
               else {
                 ResponsiveInfo.showAlertDialog(
                     "Registration", "User Registration Failed");
               }
             }
             else {
               ResponsiveInfo.showAlertDialog(
                   "Registration", "User Registration Failed");
             }
           }
           else {
             ResponsiveInfo.showAlertDialog(
                 "Registration", "Password should have atleast 6 characters");
           }
         }
         else {
           ResponsiveInfo.showAlertDialog("Authentication", "Enter Password");
         }
       }
       else {
         ResponsiveInfo.showAlertDialog("Register", "Enter Username");
       }
     }
     else{

       ResponsiveInfo.showAlertDialog("Register", "Enter valid email");
     }
   }
   else{

     ResponsiveInfo.showAlertDialog("Register", "Enter email");
   }

  }

  bool isValidEmail(String email) {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }
}
