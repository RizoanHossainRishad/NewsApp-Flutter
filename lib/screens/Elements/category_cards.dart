import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/searchPro.dart';
import '../search_result_screen.dart';

Widget onTapStack(
    double screenWidth, double screenHeight,String imageURL,String title,BuildContext context
    ){
  final searchProv=(context).watch<Searchpro>();
  return InkWell(
    onTap: () async{
      searchProv.setSearchText(title);
       await searchProv.setSearchList(
        title.toLowerCase(),
      );
      if(searchProv.search!.isNotEmpty){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchResultScreen(),
          ),
        );
      }
    },
    child: returnStack(screenWidth, screenHeight,imageURL,title),
  );
}
Widget returnStack(double screenWidth, double screenHeight,String imageURL,String title){
  return Stack(
    alignment:AlignmentGeometry.centerLeft,
    children: [
      FittedBox(
        fit: BoxFit.scaleDown,
        child: Padding(
          padding: EdgeInsets.only(
            left: screenWidth*0.04,
            right: screenWidth*0.04,
            top: screenHeight*0.01,

          ),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(color: Colors.black12, offset: Offset(0, 3)),
                  BoxShadow(color: Colors.black12, offset: Offset(-1, 1)),
                  BoxShadow(color: Colors.black12, offset: Offset(1, 1)),
                ]
            ),
            height: screenHeight * 0.15,
            width: screenWidth,
            child: CachedNetworkImage(
              imageUrl: imageURL,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      colorFilter:
                      ColorFilter.mode(Colors.transparent, BlendMode.colorBurn)),
                ),
              ),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
      ),

      Center(
        child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Container(
                width: screenWidth*.9,
                height: screenHeight*0.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(colors: [Colors.grey.withOpacity(0.2),
                      Colors.green.withOpacity(0.2)
                    ],)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Padding(
                        padding:EdgeInsets.only(
                            left: screenWidth*0.05
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(title ,style: TextStyle(
                              fontSize: screenWidth*0.06,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),
                    ),
                    FittedBox(fit: BoxFit.scaleDown,child: Icon(Icons.search,size: screenWidth*0.06,color: Colors.white,))
                  ],
                ))),
      )
    ],
  );
}