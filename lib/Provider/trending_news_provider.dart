import 'package:flutter/cupertino.dart';
import 'package:newsapp_first/Api_services/trending_news_api.dart';
import 'package:newsapp_first/Model_class/NewsModel.dart';

class TrendingNewsProvider extends ChangeNotifier{

  trendingNewsApi latestNewsApiServ=trendingNewsApi();

  List<NewsModel> _trendingNews=[];

  Future<List<NewsModel>> get trendingNews async=>  _trendingNews;


  Future<bool> getLatestNews() async{
    _trendingNews=await latestNewsApiServ.fetchTrendingNews();
    notifyListeners();
    return true;
  }



}