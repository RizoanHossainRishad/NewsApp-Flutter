import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/searchPro.dart';
import '../search_result_screen.dart';

Widget SearchUi(
    TextEditingController searchController,
    double screenHeight,
    double screenWidth,
    FocusNode _focusNode,
    BuildContext context,
    ) {
  final searchProv = (context).watch<Searchpro>();
  return Padding(
    padding: EdgeInsets.only(
      left: screenWidth * 0.02,
      top: screenWidth * 0.02,
      right: screenWidth * 0.04,
      bottom: screenWidth * 0.02,
    ),
    child: Container(
      height: screenHeight * 0.06,
      width: screenWidth,
      decoration: BoxDecoration(
        color: Colors.lightGreen.withOpacity(0.2),
        borderRadius: BorderRadius.circular(screenWidth * 0.02),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: screenWidth * 0.02,
          right: screenWidth * 0.02,
          top: screenHeight * 0.008,
        ),
        child: TextField(
          focusNode: _focusNode,
          maxLines: 1,
          style: TextStyle(color: Colors.black),

          decoration: InputDecoration(
            hintText: "Search for news eg. esports or war",
            hintStyle: TextStyle(color: Colors.grey),
            prefixIconColor: Colors.grey,
            suffixIcon: InkWell(
              onTap: () async {
                searchProv.setSearchText(searchController.text);
                var result = await searchProv.setSearchList(
                  searchController.text,
                );

                if (!result.isNegative) {
                  if (searchProv.search!.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchResultScreen(),
                      ),
                    );
                  }
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Nothing to Search!!"),
                        content: Text(
                          "You need to input your desired keyword of max 20 characters in the input field above",
                        ),
                        actions: [
                          TextButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Icon(Icons.arrow_circle_right),
            ),
            suffixIconColor: Colors.green,
            prefixIcon: Icon(Icons.search),
            disabledBorder: InputBorder.none,
            border: InputBorder.none,
          ),
          controller: searchController,
        ),
      ),
    ),
  );
}