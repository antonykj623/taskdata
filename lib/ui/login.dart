import 'package:flutter/material.dart';

import 'package:tasknew/models/login_response.dart';
import 'package:tasknew/ui/home_screen.dart';
import 'package:tasknew/ui/registration.dart';
import 'package:tasknew/web/ApiProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../designs/ResponsiveInfo.dart';
import '../constants/Constants.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {

  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   Login() ;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfff1f5f9),
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
                  'Log in',
                  style: TextStyle(color: Colors.white, fontSize: ResponsiveInfo.isMobile(context) ? 12 : 14),
                ),
                onPressed: () async {
                  // Call a function to authenticate user
                   authenticateUser();
                },
              ),
            ),
          ),
          SizedBox(
            height: ResponsiveInfo.isMobile(context) ? 20 : 25,
          ),
          Container(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: ResponsiveInfo.isMobile(context) ? 5.0 : 7.0),
                    child: Text('Don\'t you have an account? ', style: TextStyle(color: Colors.black87, fontSize: ResponsiveInfo.isMobile(context) ? 14 : 17)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: ResponsiveInfo.isMobile(context) ? 1.0 : 3.0),
                    child: InkWell(
                      onTap: () {
                        print('hello');
                        Get.to(() =>  Registration());
                       // Navigator.push(context, MaterialPageRoute(builder: (context) => Registration()));
                      },
                      child: Text('Register', style: TextStyle(fontSize: ResponsiveInfo.isMobile(context) ? 14 : 17, color: Colors.blue)),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> authenticateUser() async {

ApiProvider ap=new ApiProvider();
if(userController.text.isNotEmpty)
  {
    if(passwordController.text.isNotEmpty)
    {

      ResponsiveInfo.showProgressDialog();

      LoginResponse lr=await ap.authenticate(userController.text,passwordController.text);

Get.back();
      print(lr.token);

      if(lr.token!.isNotEmpty)
        {
          if(!lr.token!.contains("No data found"))
            {


              final preferenceDataStorage = await SharedPreferences
                  .getInstance();
               preferenceDataStorage.setString(AppConstants.token_key,lr.token!);
              preferenceDataStorage.setString(
                  AppConstants.profilekey, AppConstants.profiledata);
                // SqlHelper.createItem(AppConstants.profiledata).then((value) {
                //
                //   Get.to(() =>  HomeScreen());
                // });





            }
          else{
            ResponsiveInfo.showAlertDialog("Authentication", "User Authentication Failed");
          }

        }
      else{

        ResponsiveInfo.showAlertDialog("Authentication", "User Authentication Failed");
      }


    }
    else{

      ResponsiveInfo.showAlertDialog("Authentication", "Enter Password");
    }


  }
else{

ResponsiveInfo.showAlertDialog("Authentication", "Enter Username");
}



  }
}
