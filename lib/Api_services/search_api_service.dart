import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp_first/Model_class/NewsModel.dart';

class SearchApiService {



  String api3="";

  Future<List<NewsModel>> searchResult(String searchText) async{
    late var searchApicall =
        "https://newsapi.org/v2/everything?q=$searchText&sortBy=relevancy&apiKey=$api3";
    try{
      Response response= await http.get(Uri.parse(searchApicall));

      if(response.statusCode==200){
        Map<String,dynamic> json=jsonDecode(response.body);
        List<dynamic> body;
        List<dynamic> bodyLarge = json["articles"];
        if(bodyLarge.length >100){
          body=bodyLarge.sublist(0,100);
        }else {
          body = bodyLarge;
        }

        return body.map((news) => NewsModel.fromJson(news)).toList();
      }else{
        throw "Api error occured";
      }

    }catch(e){
      throw("API Limit reached 100/100??");
    }
  }



}