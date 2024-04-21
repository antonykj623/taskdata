import 'dart:async';

import 'package:flutter/material.dart';

class FullScreenImageViewer extends StatefulWidget {


  String imageurl;

   FullScreenImageViewer(this.imageurl);

  @override
  _FullScreenImageViewerState createState() => _FullScreenImageViewerState(this.imageurl);
}

class _FullScreenImageViewerState extends State<FullScreenImageViewer> {
  String imageurl;

  bool showfirst=true;

  _FullScreenImageViewerState(this.imageurl);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: const Text(''),
        ),

      body:


      Container(
      width: double.infinity,
      height: double.infinity,
      child: AnimatedCrossFade(
          duration: const Duration(seconds: 3),
          firstChild:  Container(width: double.infinity,height: double.infinity,

          color: Colors.white54,
          ),

          crossFadeState: (showfirst)? CrossFadeState.showFirst: CrossFadeState.showSecond,





          secondChild: Image.network(
       imageurl,
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



     ) ),

    ));
  }

  changePage()
  {
    Timer(
      const Duration(seconds: 1),
          () {

        setState(() {
          showfirst=false;
        });

          }

    );
  }
}
