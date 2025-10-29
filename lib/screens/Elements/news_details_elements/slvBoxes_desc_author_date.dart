import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:newsapp_first/Provider/newsDetails_pro.dart';
import 'package:newsapp_first/Provider/screenValues.dart';

Widget titleSliverBox(NewsdetailsProvider newsDetailsPro,screenValues screenMeasure){

  return SliverToBoxAdapter(
    child: Container(
      decoration: BoxDecoration(
        color: Color(0xfffffffa),
        border: BoxBorder.fromLTRB(
            top:BorderSide(
              color: Colors.cyan,
              width: 3,
            )
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            top: screenMeasure.screenHeight*0.02,
            bottom: screenMeasure.screenHeight*0.02,
            left: screenMeasure.screenWidth*0.04,
            right:screenMeasure.screenWidth*0.04
        ),
        child: Text(
          newsDetailsPro.aNews!.title!,
          textAlign: TextAlign.center,
          style: GoogleFonts.merriweather(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: screenMeasure.screenHeight*0.03
          ),
        ),
      ),
    ),
  );
}

Widget descSliverBox(NewsdetailsProvider newsDetailsPro,screenValues screenMeasure){
  return SliverToBoxAdapter(
    child: Container(
      decoration: BoxDecoration(
        color: Color(0xfffffffa),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            bottom: screenMeasure.screenHeight*0.02,
            left: screenMeasure.screenWidth*0.03,
            right:screenMeasure.screenWidth*0.03
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xfff7f7d7).withOpacity(0.5),
              borderRadius: BorderRadius.circular(screenMeasure.screenWidth*0.05),
              border: BoxBorder.all(
                  color: Colors.black.withOpacity(0.2),
                  width: 2
              )
          ),
          child: Padding(
            padding: EdgeInsets.all(14.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(

                      left: screenMeasure.screenWidth*0.02,
                      right:screenMeasure.screenWidth*0.02,
                      bottom: screenMeasure.screenWidth*0.01
                  ),
                  child: Text(
                    newsDetailsPro.aNews!.description!,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.redHatDisplay(
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                        fontSize: screenMeasure.screenHeight*0.026
                    ),
                  ),
                ),

                SizedBox(
                  height: screenMeasure.screenHeight*0.004,
                ),
                SizedBox(
                  height: screenMeasure.screenHeight*0.001,
                  child: Container(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: screenMeasure.screenHeight*0.006,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        FittedBox(fit: BoxFit.scaleDown,child: CircleAvatar(backgroundColor:Colors.blue ,child: Icon(Icons.person,color: Colors.white,))),
                        SizedBox(
                          width: screenMeasure.screenWidth*0.02,
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:"Author: ",
                                    style: GoogleFonts.redHatDisplay(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.black,
                                        fontSize: screenMeasure.screenHeight*0.013
                                    ),
                                  ),
                                  TextSpan(
                                    text: formatAuthor(newsDetailsPro.aNews!.author),
                                    style: GoogleFonts.redHatDisplay(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal,
                                        decoration:TextDecoration.underline,
                                        color: Colors.black,
                                        fontSize: screenMeasure.screenHeight*0.013
                                    ),
                                  ),
                                ]
                              )),

                              RichText(text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:"Published: ",
                                      style: GoogleFonts.redHatDisplay(
                                          fontWeight: FontWeight.normal,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.black,
                                          fontSize: screenMeasure.screenHeight*0.013
                                      ),
                                    ),
                                    TextSpan(
                                      text: Jiffy.parse(newsDetailsPro.aNews!.publishedAt?? "99-12-9999").format(pattern: "dd-MM-yyyy"),
                                      style: GoogleFonts.redHatDisplay(
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black,
                                          fontSize: screenMeasure.screenHeight*0.013
                                      ),
                                    ),
                                  ]
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),

                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.cyan.shade50,
                              borderRadius: BorderRadius.circular( screenMeasure.screenWidth * 0.02),
                              border: BoxBorder.all(
                                color: Colors.grey
                              )
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                 left:screenMeasure.screenWidth*0.02,
                                  right: screenMeasure.screenWidth*0.02,
                                  top: screenMeasure.screenWidth*0.02,
                                  bottom: screenMeasure.screenWidth*0.02
                                ),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    newsDetailsPro.aNews!.source!.name ?? "Anonymous",
                                    style: TextStyle(
                                      color: Colors.blue.shade900,
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenMeasure.screenHeight*0.015
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ),


                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

String formatAuthor(String? author) {
  final name = author ?? "Anonymous";

  // Check if there's a comma
  final commaIndex = name.indexOf(',');

  if (commaIndex != -1) {
    // Return substring before comma
    return name.substring(0, commaIndex);
  } else {
    // No comma: check length
    return name.length <= 15 ? name : name.substring(0, 15);
  }
}
