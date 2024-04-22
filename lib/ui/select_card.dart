import 'package:flutter/material.dart';
import 'package:tasknew/ui/ProductDetails_page.dart';

import '../data/photos.dart';
import '../data/product_list_entity.dart';
import '../designs/ResponsiveInfo.dart';
import 'full_screen_image_viewer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CardScreen extends StatefulWidget {

  ProductListEntity hts;
  CardScreen(this.hts, ) ;


  @override
  _CardState createState() => _CardState(this.hts);
}

class _CardState extends State<CardScreen> {

  ProductListEntity hts;
  _CardState(this.hts);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      
      child:  Card(

            child: Center(child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(child: Stack(

                children: [




              Align(
                alignment: FractionalOffset.topCenter,
                child: Image.network(
                  hts.image!,
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
                  height: double.infinity,
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

                          child:(!hts.isfavourite)? Icon(Icons.favorite_border,size: ResponsiveInfo.isMobile(context)?15:20,) :
                          Icon(Icons.favorite,size: ResponsiveInfo.isMobile(context)?15:20,color: Colors.red,),
                        ),
                        onTap: (){

                          setState(() {

                            hts.isfavourite=true;
                          });

                        },
                      )



                    )





                  ),


              ],
            )

                  ,flex: 3,),

                  Expanded(child: Center(

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(padding: EdgeInsets.all(ResponsiveInfo.isMobile(context)?2:5),

                          child: Text(hts.title!.toString(),style: TextStyle(color: Colors.black,fontSize:ResponsiveInfo.isMobile(context)? 13:15,),maxLines: 2,overflow: TextOverflow.ellipsis),
                        ),

                        Padding(padding: EdgeInsets.all(ResponsiveInfo.isMobile(context)?2:5),

                          child:RatingBar.builder(
                            initialRating: hts.rating.rate,
                            itemSize: ResponsiveInfo.isMobile(context)?12:17,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            ignoreGestures: false,

                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),



                        ),





                      ],
                    ),



                  ),flex: 2,),

                ]
            ),
            )
        )  ,




      
      onTap: (){

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetails_page(hts),
          ),
        );

      },
    )
      
      
     ;
  }
}
