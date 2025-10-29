import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp_first/Model_class/NewsModel.dart';
import 'package:http/http.dart';
import 'package:jiffy/jiffy.dart';

class AllNewsApi {
  String? todayStr = Jiffy.now().format(pattern: 'YYYY-MM-dd');
  String? twoDaysAgo = Jiffy.now()
      .subtract(days: 2)
      .format(pattern: 'yyyy-MM-dd');
  String api = "";//Personal
  String api2=""; //@gmail.com
  String api3=""; //@gmail.com
  String api4=""; //@gmail.com
  String api5=""; //@gmail.com
  String api6=""; //@gmail.com
  String api7=""; //@gmail.com
  String api8=""; //@gmail.com
  String api9=""; //@gmail.com

  late var techNews =
      "https://newsapi.org/v2/everything?q=computer science OR software OR software engineering OR artificial intelligence OR AI OR machine learning OR ML OR data science OR blockchain OR cryptocurrency OR crypto OR cyber security OR hacking OR cloud computing OR tech companies OR tech interviews OR DSA OR programming OR coding OR operating systems OR big data OR web development OR mobile apps OR app development OR engineering innovation OR algorithms OR data structures OR flutter OR javascript OR angular OR python OR nlp&sortBy=relevancy&lang=en&from=$twoDaysAgo&to=$todayStr&apiKey=$api2";
  late var political =
      "https://newsapi.org/v2/everything?q=politics OR government OR international politics OR world OR elections OR politician OR current affairs&sortBy=relevancy&from=$twoDaysAgo&to=$todayStr&lang=en&apiKey=$api3";

  late var economy =
      "https://newsapi.org/v2/everything?q=business OR economy OR market OR stock OR trading OR crypto OR startups OR finance OR banking OR cryptocurrency OR inflation OR GDP&sortBy=relevancy&from=$twoDaysAgo&to=$todayStr&lang=en&apiKey=$api4";

  late var sports =
      "https://newsapi.org/v2/everything?q=sports OR football OR soccer OR cricket OR tennis OR badminton OR esports OR athletes OR olymics OR fifa OR icc OR ronaldo OR messi OR kohli OR premier league OR laliga OR seriA &sortBy=relevancy&from=$twoDaysAgo&to=$todayStr&lang=en&apiKey=$api5";

  late var entertainment =
      "https://newsapi.org/v2/everything?q=entertainment OR movies OR tv OR drama OR celebrities OR music OR fashion OR culture OR travel OR food OR lifestyle OR actors OR singers OR pop OR tvshow OR tvseries OR netflix&sortBy=relevancy&from=$twoDaysAgo&to=$todayStr&lang=en&apiKey=$api6";

  late var science =
      "https://newsapi.org/v2/everything?q=technology OR devices OR artificial intelligence OR ai OR machine learning OR deep learning OR ai model OR gadgets OR computers OR climate change OR space OR nasa OR spacex OR astronomoy OR deep learning OR robots OR innovation OR researchs&sortBy=relevancy&from=$twoDaysAgo&to=$todayStr&lang=en&apiKey=$api7";

  late var medical =
      "https://newsapi.org/v2/everything?q=health OR medical OR hospital OR mental health OR diseases OR pandemic OR fitness OR wellbeing OR medicine OR medical research OR new disease OR health concern OR nurses OR doctor OR patient OR icu OR therapy OR cure&sortBy=relevancy&from=$twoDaysAgo&to=$todayStr&lang=en&apiKey=$api8";

  late var crime =
      "https://newsapi.org/v2/everything?q=crime OR murder OR rape OR assault OR homicide OR manslaughter OR scams OR fraud OR accident OR legal OR court OR lawsuit OR cybersecurity OR hack OR phish OR extort OR gang OR weapon violence&sortBy=relevancy&from=$twoDaysAgo&to=$todayStr&lang=en&apiKey=$api9";

  late var education =
      "https://newsapi.org/v2/everything?q=education OR school OR college OR bsc OR engineer OR mbbs OR university OR phd OR research paper OR social issues OR human rights OR community news OR religion OR scientists OR books OR library&sortBy=relevancy&from=$twoDaysAgo&to=$todayStr&lang=en&apiKey=$api2";

  Future<List<NewsModel>> fetchNews(String url) async {
    try {
      Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);

        List<dynamic> body;
        List<dynamic> bodyLarge = json["articles"];
        if(bodyLarge.length >500){
          body=bodyLarge.sublist(0,500);
        }else {
          body = bodyLarge;
        }
        return body.map((news) => NewsModel.fromJson(news)).toList();
      } else {
        throw ("API ERROR OCCURRED!");
      }
    } catch (e) {
      throw("API Limit reached 100/100??");
    }
  }

  Future<List<NewsModel>> allTech() async => await fetchNews(techNews);

  Future<List<NewsModel>> allPolitics() async => await fetchNews(political);

  Future<List<NewsModel>> allEconomy() async => await fetchNews(economy);

  Future<List<NewsModel>> allSports() async => await fetchNews(sports);

  Future<List<NewsModel>> allEntertainment() async =>
      await fetchNews(entertainment);

  Future<List<NewsModel>> allScience() async => await fetchNews(science);

  Future<List<NewsModel>> allMedical() async => await fetchNews(medical);

  Future<List<NewsModel>> allCrime() async => await fetchNews(crime);

  Future<List<NewsModel>> allEducation() async => await fetchNews(education);
}
