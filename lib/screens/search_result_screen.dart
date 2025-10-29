import 'package:flutter/material.dart';
import 'package:newsapp_first/Provider/screenValues.dart';
import 'package:provider/provider.dart';

import '../Effects/shimmermain.dart';
import '../Model_class/NewsModel.dart';
import '../Provider/searchPro.dart';
import 'Elements/NewsCard_all.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchPro= (context).watch<Searchpro>();
    final screenMeasure=(context).watch<screenValues>();
    double screenWidth=screenMeasure.screenWidth;
    return SafeArea(
      child: Scaffold(

        body: Column(
          children: [

            Container(
              height: MediaQuery.of(context).size.height*0.06,
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                backgroundBlendMode:BlendMode.darken,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWithpad(Icon(Icons.manage_search),searchPro.search!, screenWidth*0.04),
                  Padding(
                    padding: EdgeInsets.only(
                      right: screenWidth*0.04,
                    ),
                    child: InkWell(
                      onTap: (){
                        searchPro.clearSearchText;
                        searchPro.clearSearchList();
                        Navigator.pop(context);
                      },
                        child:Icon(Icons.cancel_outlined)),
                  ),
              
                ],
              ),
            ),
            Flexible(
              child: Consumer<Searchpro>(
                builder: (context, searchPro, child) {
                  return FutureBuilder<List<NewsModel>>(
                    future: searchPro.searchResult,
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
          padding: EdgeInsets.only(top: 10, bottom: 2, left: padLeftRight*0.6),
          child: Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
