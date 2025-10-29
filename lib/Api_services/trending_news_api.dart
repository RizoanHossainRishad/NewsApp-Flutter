import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:newsapp_first/Model_class/NewsModel.dart';

class trendingNewsApi{

  //  String api = ""; // personal
  String api2=""; //@gmail.com
  String api3=""; //@gmail.com
  String api4=""; //@gmail.com
  String api5="";//@gmail.com
  String api6=""; //@gmail.com
  String api7="";//@gmail.com
  String api8="";//@gmail.com
  String api9=""; //@gmail.com



  late var technology = "https://newsapi.org/v2/top-headlines?category=technology&apiKey=$api9";

  late var politics="https://newsapi.org/v2/top-headlines?category=politics&apiKey=$api2";

  late var business="https://newsapi.org/v2/top-headlines?category=business&apiKey=$api3";

  late var entertainment="https://newsapi.org/v2/top-headlines?category=entertainment&apiKey=$api4";

  late var general="https://newsapi.org/v2/top-headlines?category=general&apiKey=$api5";

  late var science="https://newsapi.org/v2/top-headlines?category=science&apiKey=$api6";

  late var health="https://newsapi.org/v2/top-headlines?category=health&apiKey=$api7";

  late var sports="https://newsapi.org/v2/top-headlines?category=sports&apiKey=$api8";
  Map<String, List<NewsModel>> categorizedNews = {};
  Future<List<NewsModel>> fetchTrendingNews() async{
      List<NewsModel> fullJson=[];
    try{
      List<String> endpoints = [
        technology, politics, business, entertainment,
        general, science, health, sports
      ];
      // Sequential
      for (String endpoint in endpoints) {
        Response response = await http.get(Uri.parse(endpoint));
        if(response.statusCode==200){
          Map<String,dynamic> json=jsonDecode(response.body);
          List<dynamic> body=json["articles"];
          List<NewsModel> newsList = body.map((news) => NewsModel.fromJson(news)).toList();
          categorizedNews[endpoint] = newsList;
          fullJson.addAll(body.map((news) => NewsModel.fromJson(news)).toList());
        }else{
          print("API DATA NOT FOUND ON TRENDING");
          return [];
        }
      }
      return fullJson;
    }catch(e){
        throw("API Limit reached 100/100??");
    }
  }

  List<NewsModel> statusCheck(Response response){
      if(response.statusCode==200){
        Map<String,dynamic> json=jsonDecode(response.body);
        List<dynamic> body=json["articles"];
        return body.map((news) => NewsModel.fromJson(news)).toList();
      }else{
        print("API DATA NOT FOUND ON TRENDING");
        return [];
      }
  }

}