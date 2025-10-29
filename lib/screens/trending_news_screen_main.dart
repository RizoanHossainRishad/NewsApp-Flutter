import 'package:flutter/material.dart';
import 'package:newsapp_first/Provider/trending_news_provider.dart';
import 'package:provider/provider.dart';

import '../Effects/shimmermain.dart';
import '../Model_class/NewsModel.dart';
import '../Provider/screenValues.dart';
import 'Elements/NewsCard_all.dart';

class TrendingNewsScreen extends StatefulWidget {
  const TrendingNewsScreen({super.key});

  @override
  State<TrendingNewsScreen> createState() => _TrendingNewsScreenState();
}

class _TrendingNewsScreenState extends State<TrendingNewsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final trendingPro = Provider.of<TrendingNewsProvider>(
      context,
      listen: false,
    );
    trendingPro.getLatestNews();
  }

  @override
  Widget build(BuildContext context) {
    final screenMeasure = (context).watch<screenValues>();
    double screenHeight = screenMeasure.screenHeight;
    double screenWidth = screenMeasure.screenWidth;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: TextWithpad(
                    Icon(
                      Icons.local_fire_department,
                      color: Colors.deepOrange,
                      size: screenWidth * 0.06,
                    ),
                    "Top News",
                    screenWidth * 0.04,
                  ),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 2, right: screenWidth*0.04),
                    child: Container(
                      color: Colors.green.withOpacity(0.1),
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.green,
                            size: screenWidth * 0.02,
                          ),
                          Text(
                            " Live Updates",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: screenHeight*0.015,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: SizedBox(
                height: 2,
                width: screenWidth * 0.96,
                child: Container(color: Colors.grey),
              ),
            ),

            Flexible(
              child: Consumer<TrendingNewsProvider>(
                builder: (context, trendNewsPro, child) {
                  return FutureBuilder<List<NewsModel>>(
                    future: trendNewsPro.trendingNews,
                    builder:
                        (
                          BuildContext context,
                          AsyncSnapshot<List<NewsModel>> snapshot,
                        ) {
                          if (!snapshot.hasData) {
                            return Shimmermain(child: 2, ratio: 1);
                          }
                          return snapshot.data!.isEmpty
                              ? Shimmermain(child: 2, ratio: 1)
                              : ListView(
                                  scrollDirection: Axis.vertical,
                                  children: snapshot.data!.map((news) {
                                    return NewscardAll(news: news);
                                  }).toList(),
                                );
                        },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget TextWithpad(Icon icon, String name, double padLeftRight) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 2, left: padLeftRight),
          child: icon,
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 2, left: padLeftRight*0.5),
          child: Text(
            "$name",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
