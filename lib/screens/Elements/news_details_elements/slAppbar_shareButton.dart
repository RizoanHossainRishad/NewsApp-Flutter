import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsapp_first/Provider/newsDetails_pro.dart';
import 'package:newsapp_first/Provider/screenValues.dart';

Widget sliverAppbarCustom(
  screenValues screenMeasure,
  BuildContext context,
  NewsdetailsProvider newsDetailsPro,
) {
  String noImage =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFWQCxahSDmS6JbJtxnlV5ORiHwcTbxkegYA&s";

  return SliverAppBar(

    expandedHeight: screenMeasure.screenHeight * 0.23,
    backgroundColor: Colors.green.shade200,
    pinned: false,
    snap: true,
    floating: true,
    iconTheme: IconThemeData(
      color: Colors.white,
      size: screenMeasure.screenWidth * 0.08,
      shadows: [
        Shadow(
          // bottomLeft
          offset: Offset(-1, -1),
          color: Colors.black87,
        ),
        Shadow(
          // bottomRight
          offset: Offset(1, -1),
          color: Colors.black87,
        ),
        Shadow(
          // topRight
          offset: Offset(1, 1),
          color: Colors.black87,
        ),
        Shadow(
          // topLeft
          offset: Offset(-1, 1),
          color: Colors.black87,
        ),
      ],
    ),
    leading: InkWell(
      onTap: () async {
        Navigator.pop(context);
      },
      child: Icon(Icons.keyboard_double_arrow_left),
    ),
    flexibleSpace: FlexibleSpaceBar(
      background: Image.network(
        newsDetailsPro.aNews?.urlToImage ?? noImage,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Image.network(noImage,fit: BoxFit.cover,);
        },
      ),
    ),
    actions: <Widget>[
      Padding(
        padding: EdgeInsets.only(right: screenMeasure.screenWidth * 0.04),
        child: IconButton(
          icon: Icon(Icons.share, size: screenMeasure.screenWidth * 0.07),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Row(
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Icon(
                          Icons.newspaper,
                          size: screenMeasure.screenWidth * 0.06,
                          color: Color(0xff065899),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SizedBox(
                          width: screenMeasure.screenWidth * 0.02,
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Share News",
                          style: TextStyle(
                            color: Color(0xff021f36),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: screenMeasure.screenHeight * .15,
                          width: screenMeasure.screenWidth * .4,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: SingleChildScrollView(
                                child: Text(
                                  newsDetailsPro.aNews!.url!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SizedBox(
                          width: screenMeasure.screenWidth * 0.07,
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: InkWell(
                          onTap: () async {
                            await Clipboard.setData(
                              ClipboardData(text: newsDetailsPro.aNews!.url!),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Copied to clipboard',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                backgroundColor:
                                    Colors.lightGreenAccent.shade100,
                              ),
                            );
                          },
                          child: Icon(Icons.copy),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    ],
  );
}
