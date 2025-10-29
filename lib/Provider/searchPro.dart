import 'package:flutter/cupertino.dart';
import 'package:newsapp_first/Api_services/search_api_service.dart';
import 'package:newsapp_first/Model_class/NewsModel.dart';

class Searchpro extends ChangeNotifier{
  //Search part
  SearchApiService searchServApi=SearchApiService();

  String _search="";
  String? get search=>_search;

  List<NewsModel> _searchResult=[];
  Future<List<NewsModel>> get searchResult async=>_searchResult;

  void setSearchText(String text){
    _search=text;
    notifyListeners();
  }

  void clearSearchText(){
    _search="";
    notifyListeners();
  }

  void clearSearchList(){
    if(_searchResult.isNotEmpty){
      _searchResult.clear();
      notifyListeners();
    }
  }

  Future<int> setSearchList(String text) async{
    if(_search.isNotEmpty){
      _searchResult=await searchServApi.searchResult(text);
      notifyListeners();
    }else{
      return -1;
    }
    return 1;
  }




}