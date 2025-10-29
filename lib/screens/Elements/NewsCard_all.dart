import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:newsapp_first/Model_class/NewsModel.dart';
import 'package:newsapp_first/Provider/newsDetails_pro.dart';
import 'package:provider/provider.dart';
import '../../Provider/screenValues.dart';
import 'news_read_screen.dart';

class NewscardAll extends StatefulWidget {
  NewsModel news;
  NewscardAll({super.key, required this.news});

  @override
  State<NewscardAll> createState() => _NewscardAllState();
}

class _NewscardAllState extends State<NewscardAll> {
  @override
  Widget build(BuildContext context) {
    final screenMeasure = (context).watch<screenValues>();
    final newsDetailsPro=(context).watch<NewsdetailsProvider>();
    double screenHeight = screenMeasure.screenHeight;
    double screenWidth = screenMeasure.screenWidth;
    double containerHeight=screenHeight*.40;
    double containerWidth=screenWidth*0.94;
    return Padding(
      padding: EdgeInsets.only(
        left: containerWidth * 0.02,
        right: containerWidth * 0.02,
        top: containerHeight * 0.001,
        bottom: containerHeight * 0.001,
      ),
      child: Container(
        height: screenHeight*0.44,
        width: containerWidth,
        margin: EdgeInsetsGeometry.only(
          left: containerWidth * 0.01,
          right: containerWidth * 0.01,
          top: containerHeight * 0.01,
          bottom: containerHeight * 0.01,
        ),


        decoration: BoxDecoration(
          color: Colors.white.withOpacity(1),
          borderRadius: BorderRadius.all(Radius.circular(screenWidth * 0.05)),
          boxShadow: [
            BoxShadow(color: Colors.black12, offset: Offset(0, 3)),
            BoxShadow(color: Colors.black12, offset: Offset(-1, 1)),
            BoxShadow(color: Colors.black12, offset: Offset(1, 1)),
          ],
        ),
        child: InkWell(
          onTap: (){
            newsDetailsPro.clearAnews();
            newsDetailsPro.setAnews(widget.news);
            Navigator.push(context,MaterialPageRoute(builder: (context)=>NewsReadScreen()));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(screenWidth * 0.05)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight:Radius.circular(12),
                    topLeft: Radius.circular(12),
                  ), // optional
                  child: Image.network(
                    widget.news.urlToImage ?? "",
                    height: containerHeight * 0.3,
                    width: containerWidth,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: containerHeight * 0.4,
                        width: containerWidth,
                        color: Colors.blue[300],
                        child: Icon(Icons.newspaper, size: 40, color: Colors.grey[700]),
                      );
                    },
                  ),
                ),
               // FittedBox(fit: BoxFit.scaleDown,child: SizedBox(height: containerHeight*0.001)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.04),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(screenWidth * 0.02),
                          ),
                          height: containerHeight*0.07,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: screenWidth * 0.03,
                                right: screenWidth * 0.03,
                              ),
                              child: Text(
                                widget.news.source!.name ?? "Hidden",
                                style: TextStyle(
                                  color: Colors.blue.shade900,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Padding(
                        padding: EdgeInsets.only(right: screenWidth * 0.04),
                        child: Text(
                          Jiffy.parse(widget.news.publishedAt!).format(pattern: "dd/MM/yyyy"),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //FittedBox(fit: BoxFit.scaleDown,child: SizedBox(height: containerHeight*0.000010)),
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.04,
                    right: screenWidth * 0.04,
                  ),
                  child: Text(
                    widget.news.title!,maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: screenHeight*0.02),
                  ),
                ),
               // FittedBox(fit: BoxFit.scaleDown,child: SizedBox(height: containerHeight*0.0001)),

                Padding(
                    padding: EdgeInsets.only(
                      left: screenWidth * 0.04,
                      right: screenWidth * 0.04,
                    ),
                    child: Text(widget.news.description ??"",maxLines: 2,overflow: TextOverflow.clip,softWrap: true,),
                  ),
                //FittedBox(fit: BoxFit.scaleDown,child: SizedBox(height: containerHeight*0.01)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.05),
                        child: Row(
                          children: [
                            if (widget.news.author != null && widget.news.author!.isNotEmpty) ...[
                             Icon(Icons.person_pin_circle_sharp, size:screenHeight*0.02),
                              SizedBox(width: 4), // small spacing
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                  child: Text((widget.news.author ?? "").characters.take(10).toString() ,softWrap: true,
                                    overflow: TextOverflow.ellipsis, // better for long text
                                    maxLines: 1,)),
                            ]
                          ],
                        ),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Padding(
                        padding: EdgeInsets.only(right: screenWidth * 0.04),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff065e99),
                            borderRadius: BorderRadius.circular(screenWidth * 0.02),
                          ),
                          height: containerHeight*0.07,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: screenWidth * 0.03,
                                right: screenWidth * 0.03,
                              ),
                              child: Text(
                                "Read More",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
               // FittedBox(fit: BoxFit.scaleDown,child: SizedBox(height: containerHeight*0.01)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
