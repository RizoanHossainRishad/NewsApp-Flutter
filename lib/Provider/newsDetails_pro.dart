import 'package:flutter/material.dart';

import '../Model_class/NewsModel.dart';

class NewsdetailsProvider extends ChangeNotifier{

  NewsModel? _aNews;
  NewsModel? get aNews=> _aNews;

  void setAnews(NewsModel news){
    _aNews=news;
    notifyListeners();
  }

  void clearAnews(){
    _aNews=null;
    notifyListeners();
  }
}