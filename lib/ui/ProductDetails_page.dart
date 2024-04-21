import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tasknew/ui/select_card.dart';


import '../constants/Constants.dart';
import '../data/photos.dart';
import '../data/product_list_entity.dart';
import '../designs/ResponsiveInfo.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetails_page extends StatefulWidget {


  ProductListEntity pl;
   ProductDetails_page(this.pl) ;

  @override
  _ProductDetails_pageState createState() => _ProductDetails_pageState(this.pl);
}

class _ProductDetails_pageState extends State<ProductDetails_page> {

  ProductListEntity pl;

  _ProductDetails_pageState(this.pl);



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {



    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,

        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black87),
            onPressed: () {
              Navigator.pop(context);
            }
        ),
        title: Text("",style: TextStyle(color: Colors.white,fontSize:ResponsiveInfo.isMobile(context)? 13:15),),
        centerTitle: false,




      ),

      body:

SingleChildScrollView(
  
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    
    children: [





              Stack(

                  children: [




                    Align(
                      alignment: FractionalOffset.topCenter,
                      child: Image.network(
                        pl.image!,
                        errorBuilder: (context, error, stackTrace) {
                          print(error);
                          return Container();//do something
                        },
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? (loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!)
                                  : null,
                            ),
                          );
                        },
                        width: double.infinity,
                        height: MediaQuery.of(context).size.shortestSide/1.5,
                        fit: BoxFit.fill,



                      ),
                    ),

                    Align(
                        alignment: FractionalOffset.topRight,
                        child: Container(
                            width:ResponsiveInfo.isMobile(context)? 30.0:35,
                            height: ResponsiveInfo.isMobile(context)? 30.0:35,
                            color: Colors.white,

                            child:GestureDetector(

                              child:    Padding(padding: EdgeInsets.all(ResponsiveInfo.isMobile(context)?5:8),

                                child:(!pl.isfavourite)? Icon(Icons.favorite_border,size: ResponsiveInfo.isMobile(context)?18:22,) :
                                Icon(Icons.favorite,size: ResponsiveInfo.isMobile(context)?18:22,color: Colors.red,),
                              ),
                              onTap: (){

                                setState(() {

                                  pl.isfavourite=true;
                                });

                              },
                            )



                        )





                    ),


                  ],
                )

                  ,



                Padding(padding: EdgeInsets.all(ResponsiveInfo.isMobile(context)?5:10),

                  child: Text(pl.title!.toString(),style: TextStyle(color: Colors.black,fontSize:ResponsiveInfo.isMobile(context)? 17:20,),maxLines: 4,overflow: TextOverflow.ellipsis),
                ),

                Padding(padding: EdgeInsets.all(ResponsiveInfo.isMobile(context)?5:10),

                  child:Row(

                    children: [
                      Padding(padding: EdgeInsets.all(ResponsiveInfo.isMobile(context)?5:10),

                        child: Text(pl.rating.rate!.toString(),style: TextStyle(color: Colors.black,fontSize:ResponsiveInfo.isMobile(context)? 14:17,),maxLines: 4,overflow: TextOverflow.ellipsis)
                      ),
                  Padding(padding: EdgeInsets.all(ResponsiveInfo.isMobile(context)?5:10),

                    child: RatingBar.builder(
                      initialRating: pl.rating.rate,
                      itemSize: ResponsiveInfo.isMobile(context)?16:19,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      ignoreGestures: false,

                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),

                      Padding(padding: EdgeInsets.all(ResponsiveInfo.isMobile(context)?5:10),

                          child: Icon(Icons.group,size: ResponsiveInfo.isMobile(context)?18:24,)
                      ),
                      Padding(padding: EdgeInsets.all(ResponsiveInfo.isMobile(context)?5:10),

                          child: Text(pl.rating.count!.toString(),style: TextStyle(color: Colors.black,fontSize:ResponsiveInfo.isMobile(context)? 14:17,),maxLines: 4,overflow: TextOverflow.ellipsis)
                      ),

                    ],
                  )






                ),

      Padding(padding: EdgeInsets.all(ResponsiveInfo.isMobile(context)?5:10),

        child: Text(pl.description!.toString(),style: TextStyle(color: Colors.black,fontSize:ResponsiveInfo.isMobile(context)? 14:17,),maxLines: 10,overflow: TextOverflow.ellipsis),
      ),

              ]


      ,
      

      

  ),
  
  
)


    );
  }



}
