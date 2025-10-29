import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Provider/newsDetails_pro.dart';
import '../../../Provider/screenValues.dart';

Widget contentSliverbox(
  NewsdetailsProvider newsDetailsPro,
  screenValues screenMeasure,
  BuildContext context,
) {
  return SliverToBoxAdapter(
    child: Container(
      decoration: BoxDecoration(
        color: Color(0xfffffffa),
        border: BoxBorder.fromLTRB(),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: screenMeasure.screenHeight * 0.00,
          bottom: screenMeasure.screenHeight * 0.02,
          left: screenMeasure.screenWidth * 0.06,
          right: screenMeasure.screenWidth * 0.06,
        ),
        child: RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            children: [
              TextSpan(
                text: formatContent(newsDetailsPro.aNews!.content!),
                style: GoogleFonts.merriweather(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontSize: screenMeasure.screenHeight * 0.023,
                ),
              ),
              TextSpan(
                text: "Read more !!",
                style: GoogleFonts.redHatDisplay(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic,
                  color: Colors.blue,
                  fontSize: screenMeasure.screenHeight * 0.024,
                ),

                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    final url = Uri.parse(newsDetailsPro.aNews!.url!);
                    if (await canLaunchUrl(url)) {
                      await launchUrl(
                        url,
                        mode: LaunchMode.externalApplication,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Can't Open URL",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          backgroundColor: Colors.redAccent.shade100,
                        ),
                      );
                    }
                  },
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget fullImageSnacBar(BuildContext context,String ImageUrl,screenValues screenMeasure) {
  return SliverToBoxAdapter(
    child: InkWell(
      onTap: () {
        showDialog(

            context: context, builder: (context) {

          return AlertDialog(backgroundColor: Colors.black87,content: Image.network(ImageUrl,width: screenMeasure.screenWidth,));
        });

      },

      child: Container(
        decoration: BoxDecoration(
          color: Color(0xfffffffa),
          border: BoxBorder.fromLTRB(
            bottom: BorderSide(
              color: Colors.cyan.withOpacity(0.1),
              width: 2,
            ),
              top:BorderSide(
                color: Colors.cyan.withOpacity(0.1),
                width: 2,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.image_outlined,color: Color(0xff007a1d).withOpacity(0.6),),
              SizedBox(width: screenMeasure.screenWidth*0.02,),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                 "View the full image",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.merienda(
                      fontWeight: FontWeight.normal,
                      color: Colors.lightBlue,
                      fontSize: screenMeasure.screenHeight*0.023
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

String formatContent(String? content) {
  final content1 = content ?? "No content Found!!!";

  // Check if there's a bracket
  final bracketIndex = content1.indexOf('[');

  if (bracketIndex != -1) {
    // Return substring before bracket
    return content1.substring(0, bracketIndex);
  } else {
    // No bracket: Return full
    return content1;
  }
}
