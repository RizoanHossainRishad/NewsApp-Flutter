
import 'package:flutter/material.dart';
import 'package:newsapp_first/Provider/newsDetails_pro.dart';
import 'package:newsapp_first/Provider/screenValues.dart';
import 'package:newsapp_first/screens/Elements/news_details_elements/slvBoxes_content_button.dart';
import 'package:newsapp_first/screens/Elements/news_details_elements/slvBoxes_desc_author_date.dart';
import 'package:provider/provider.dart';

import 'news_details_elements/slAppbar_shareButton.dart';


class NewsReadScreen extends StatefulWidget {
  const NewsReadScreen({super.key});

  @override
  State<NewsReadScreen> createState() => _NewsReadScreenState();
}

class _NewsReadScreenState extends State<NewsReadScreen> {
  @override
  Widget build(BuildContext context) {
    final newsDetailsPro = Provider.of<NewsdetailsProvider>(context);
    final screenMeasure = (context).watch<screenValues>();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          sliverAppbarCustom(screenMeasure, context, newsDetailsPro),

         titleSliverBox(newsDetailsPro, screenMeasure),
          descSliverBox(newsDetailsPro, screenMeasure),
          contentSliverbox(newsDetailsPro, screenMeasure,context),
          fullImageSnacBar(context,newsDetailsPro.aNews!.urlToImage!,screenMeasure),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              color: Color(0xfffffffa),
            ),
          ),
        ],
      ),
    );
  }
}


