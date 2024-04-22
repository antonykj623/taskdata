import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasknew/data/ProductlistStatus.dart';
import 'package:tasknew/data/product_list_entity.dart';
import 'package:tasknew/ui/profile.dart';
import 'package:tasknew/ui/select_card.dart';
import 'package:tasknew/web/ApiProvider.dart';

import '../designs/ResponsiveInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../designs/ResponsiveInfo.dart';
import '../constants/Constants.dart';
import 'package:get/get.dart';

import 'login.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen() ;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  List<ProductListEntity>ple=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.home, color: Colors.white),
            onPressed: () {

            }
        ),
        title: Text("Products",style: TextStyle(color: Colors.white,fontSize: 15),),
        backgroundColor: Colors.blue,
        elevation: 4.0,
        actions: [

          Padding(padding: EdgeInsets.all(15),

            child: GestureDetector(
              child: Icon(Icons.person,color: Colors.white,size: ResponsiveInfo.isMobile(context)?30:35),

              onTap: (){

                Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));

              },

            ),
          )

          ,



          Padding(padding: EdgeInsets.all(15),

            child: GestureDetector(
              child: Icon(Icons.exit_to_app,color: Colors.white,size: ResponsiveInfo.isMobile(context)?30:35),

              onTap: (){

                Widget okButton = TextButton(
                  child: Text("yes"),
                  onPressed: ()async {

                    final preferenceDataStorage = await SharedPreferences
                        .getInstance();
                    preferenceDataStorage.setString(AppConstants.token_key, "");


                    Navigator.pop(context);


                    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));



                  },
                );

                Widget okButton1 = TextButton(
                  child: Text("no"),
                  onPressed: () { },
                );

                // set up the AlertDialog
                AlertDialog alert = AlertDialog(
                  title: Text("Logout"),
                  content: Text("Do you want to logout now ?"),
                  actions: [
                    okButton,
                    okButton1
                  ],
                );

                // show the dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  },
                );
              },

            ),
          )


        ],
      ),
      body: Stack(
        children: [

          Align(
            alignment: FractionalOffset.topCenter,
            child:(ple.length>0)?GridView.count(
    crossAxisCount:ResponsiveInfo.isMobile(context)?2:3,
    crossAxisSpacing: 2.0,
    mainAxisSpacing: 2.0,
    padding: EdgeInsets.all(ResponsiveInfo.isMobile(context)?10:13),
    shrinkWrap: true,
    childAspectRatio: 0.8,

    scrollDirection: Axis.vertical,
    physics: ScrollPhysics(),
    children: List.generate(ple.length, (index) {
    return Center(
    child: new Column(
    children: [
    new Expanded(
    child: CardScreen( ple[index]),//your card wight
    ),
    ],
    ),
    ); }) ) : _buildLoading()
          )
        ],
      ),

    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());


getProductList()async
{
  new ApiProvider().getproducts().then((value) {



    setState(() {

      ple.addAll(value.plistentity);
    });


  });
}

}
