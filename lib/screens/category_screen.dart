import 'package:flutter/material.dart';
import 'package:newsapp_first/Provider/screenValues.dart';
import 'package:provider/provider.dart';
import 'Elements/category_cards.dart';
import 'Elements/catname_catimage.dart';
import 'Elements/searchui_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  TextEditingController searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode(); // To stop auto focusing

  @override
  void dispose() {
    searchController.dispose();
    _focusNode.dispose();
    super.dispose();
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
            FittedBox(
              fit: BoxFit.scaleDown,
              child: SearchUi(searchController, screenHeight, screenWidth,_focusNode,context),
            ),
            Center(
              child: SizedBox(
                height: 2,
                width: screenWidth * 0.96,
                child: Container(color: Colors.grey),
              ),
            ),


            Flexible(child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context,index){
                  return onTapStack(screenWidth,screenHeight,imageURL[index],endpoints[index],context);
                }
            )
            )
            

          ],
        ),
      ),
    );
  }



}
