import 'package:flutter/cupertino.dart';
import 'package:newsapp_first/Api_services/all_news_api.dart';

import '../Model_class/NewsModel.dart';

class Allnewsprovider extends ChangeNotifier{




    AllNewsApi allnews=AllNewsApi();


    // Lists for different categories
    List<NewsModel> _alltechnews = [];
    Future<List<NewsModel>> get alltechnews async=> _alltechnews;

    List<NewsModel> _allpoliticalnews = [];
    Future<List<NewsModel>> get allpoliticalnews async=> _allpoliticalnews;

    List<NewsModel> _alleconomynews = [];
    Future<List<NewsModel>> get alleconomynews async=> _alleconomynews;

    List<NewsModel> _allSportsnews = [];
    Future<List<NewsModel>> get allSportsnews async=> _allSportsnews;

    List<NewsModel> _allentertainmentnews = [];
    Future<List<NewsModel>> get allentertainmentnews async=> _allentertainmentnews;

    List<NewsModel> _allsciencenews = [];
    Future<List<NewsModel>> get allsciencenews async=> _allsciencenews;

    List<NewsModel> _allmedicalnews = [];
    Future<List<NewsModel>> get allmedicalnews async=> _allmedicalnews;

    List<NewsModel> _allcrimenews = [];
    Future<List<NewsModel>> get allcrimenews async=> _allcrimenews;

    List<NewsModel> _alleducationnews = [];
    Future<List<NewsModel>> get alleducationnews async=> _alleducationnews;


   /* Future<void> getAllnews() async {
      _alltechnews = await allnews.allTech();
      _allpoliticalnews = await allnews.allPolitics();
      _alleconomynews = await allnews.allEconomy();
      _allSportsnews = await allnews.allSports();
      _allentertainmentnews = await allnews.allEntertainment();
      _allsciencenews = await allnews.allScience();
      _allmedicalnews = await allnews.allMedical();
      _allcrimenews = await allnews.allCrime();
      _alleducationnews = await allnews.allEducation();
      notifyListeners();
    }*/

    Future<void> getAllTech() async {
      _alltechnews = await allnews.allTech();
      notifyListeners();
    }

    Future<void> getAllEducation() async {
      _alleducationnews = await allnews.allEducation();
      notifyListeners();
    }

    Future<void> getAllSports() async {
      _allSportsnews = await allnews.allSports();
      notifyListeners();
    }

    Future<void> getAllPolitics() async {
      _allpoliticalnews = await allnews.allPolitics();
      notifyListeners();
    }

    Future<void> getAllEconomy() async {
      _alleconomynews = await allnews.allEconomy();
      notifyListeners();
    }



    Future<void> getAllEntertainment() async {
      _allentertainmentnews = await allnews.allEntertainment();
      notifyListeners();
    }

    Future<void> getAllScience() async {
      _allsciencenews = await allnews.allScience();
      notifyListeners();
    }

    Future<void> getAllMedical() async {
      _allmedicalnews = await allnews.allMedical();
      notifyListeners();
    }

    Future<void> getAllCrime() async {
      _allcrimenews = await allnews.allCrime();
      notifyListeners();
    }


}