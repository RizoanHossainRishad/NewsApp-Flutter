import 'package:flutter/material.dart';
import 'package:newsapp_first/Effects/shimmermain.dart';
import 'package:newsapp_first/Model_class/NewsModel.dart';
import 'package:newsapp_first/Provider/screenValues.dart';
import 'package:newsapp_first/auth_services/auth_service.dart';
import 'package:newsapp_first/screens/Auth_screens/welcome_screen.dart';
import 'package:newsapp_first/screens/Elements/NewsCard_all.dart';
import 'package:provider/provider.dart';
import '../Provider/allnewsProvider.dart';
import '../main.dart';
import 'bottomNav/splash_screen.dart';


class AllNewsScreen extends StatefulWidget {
  const AllNewsScreen({super.key});

  @override
  State<AllNewsScreen> createState() => _AllNewsScreenState();
}

class _AllNewsScreenState extends State<AllNewsScreen> {
  int count=0;
  final auth=AuthService();
  @override
  void initState() {
    super.initState();
    final allnewsPro = Provider.of<Allnewsprovider>(context, listen: false);

    /*allnewsPro.getAllnews();*/
    allnewsPro.getAllTech();
    allnewsPro.getAllPolitics();
    allnewsPro.getAllCrime();
    allnewsPro.getAllEconomy();
    allnewsPro.getAllEducation();
    allnewsPro.getAllEntertainment();
    allnewsPro.getAllMedical();
    allnewsPro.getAllScience();
    allnewsPro.getAllSports();

  }

  @override
  Widget build(BuildContext context) {
    final allnewsPro=(context).watch<Allnewsprovider>();
    final screenMeasure = (context).watch<screenValues>();
    double screenHeight = screenMeasure.screenHeight;
    double screenWidth = screenMeasure.screenWidth;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff012330),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("NewsApp",style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),
            InkWell(
              onTap: () async {
                await auth.signOut();

                navigatorKey.currentState?.pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const AuthWrapper()),
                      (route) => false, // remove all previous routes
                );
              },
              child: const Icon(Icons.logout, color: Colors.red),
            )
          ],
        ),
        leading: Icon(Icons.newspaper,color: Colors.grey,),
        
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children:[

          TextWithpad(
              Icon(
            Icons.rocket_launch,
            color: Color(0xff592c04),
            size: screenWidth * 0.04,
          ),"Technology",screenWidth*0.02),
          newsList(screenHeight*0.90,allnewsPro.alltechnews),
          SizedBox(height: 3,),
          Center(child: SizedBox(height: 2,width: screenWidth*0.96,child: Container(color: Colors.grey,),)),

          TextWithpad(Icon(
            Icons.menu_book,
            color: Color(0xff0000b0),
            size: screenWidth * 0.04,
          ),"Educational",screenWidth*0.02),
          newsList(screenHeight*0.90,allnewsPro.alleducationnews),
          SizedBox(height: 3,),
          Center(child: SizedBox(height: 2,width: screenWidth*0.96,child: Container(color: Colors.grey,),)),

          TextWithpad(Icon(
            Icons.sports_football_outlined,
            color: Colors.brown,
            size: screenWidth * 0.04,
          ),"Sports",screenWidth*0.02),
          newsList(screenHeight*0.90,allnewsPro.allSportsnews),
          SizedBox(height: 3,),
          Center(child: SizedBox(height: 2,width: screenWidth*0.96,child: Container(color: Colors.grey,),)),

          TextWithpad(Icon(
            Icons.policy_outlined,
            color: Colors.red,
            size: screenWidth * 0.04,
          ),"Crime",screenWidth*0.02),
          newsList(screenHeight*0.90,allnewsPro.allcrimenews),
          SizedBox(height: 3,),
          Center(child: SizedBox(height: 2,width: screenWidth*0.96,child: Container(color: Colors.grey,),)),

          TextWithpad(Icon(
            Icons.speaker_notes,
            color: Colors.grey,
            size: screenWidth * 0.04,
          ),"Global Affairs",screenWidth*0.02),
          newsList(screenHeight*0.90,allnewsPro.allpoliticalnews),
          SizedBox(height: 3,),
          Center(child: SizedBox(height: 2,width: screenWidth*0.96,child: Container(color: Colors.grey,),)),

          TextWithpad(Icon(
            Icons.currency_bitcoin,
            color: Colors.deepOrange,
            size: screenWidth * 0.04,
          ),"Economy",screenWidth*0.02),
          newsList(screenHeight*0.90,allnewsPro.alleconomynews),
          SizedBox(height: 3,),
          Center(child: SizedBox(height: 2,width: screenWidth*0.96,child: Container(color: Colors.grey,),)),

          TextWithpad(Icon(
            Icons.camera_alt_outlined,
            color: Colors.purple,
            size: screenWidth * 0.04,
          ),"Entertainment",screenWidth*0.02),
          newsList(screenHeight*0.90,allnewsPro.allentertainmentnews),
          SizedBox(height: 3,),
          Center(child: SizedBox(height: 2,width: screenWidth*0.96,child: Container(color: Colors.grey,),)),

          TextWithpad(Icon(
            Icons.medical_information_outlined,
            color: Colors.green,
            size: screenWidth * 0.04,
          ),"Medical",screenWidth*0.02),
          newsList(screenHeight*0.90,allnewsPro.allmedicalnews),
          SizedBox(height: 3,),
          Center(child: SizedBox(height: 2,width: screenWidth*0.96,child: Container(color: Colors.grey,),)),

          TextWithpad(Icon(
            Icons.science_outlined,
            color: Colors.purple,
            size: screenWidth * 0.04,
          ),"Science",screenWidth*0.02),
          newsList(screenHeight*0.90,allnewsPro.allsciencenews),
          SizedBox(height: 3,),
          Center(child: SizedBox(height: 2,width: screenWidth*0.96,child: Container(color: Colors.grey,),)),
        ]
      ),
    );



  }
  Widget TextWithpad(Icon icon,String name,double padLeftRight){
    return Row(
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Padding(
            padding: EdgeInsets.only(top: 10, bottom: 2, left: padLeftRight),
            child: icon,
          ),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Padding(
            padding:EdgeInsets.only(
              top: 5,
              bottom:2 ,
              left: padLeftRight*.5,
              right: padLeftRight,
            ),
            child: Text("$name",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
          
          
            ),
            ),
          ),
        ),
      ],
    );
  }

  Widget newsList(double screenHeight, Future<List<NewsModel>> listname){
    return SizedBox(
      height: screenHeight*0.4,
      child: Consumer<Allnewsprovider>(
        builder: (context, allnewsPro, child) {
          return FutureBuilder<List<NewsModel>>(
            future: listname,
            builder:
                (BuildContext context, AsyncSnapshot<List<NewsModel>> snapshot) {
              if (!snapshot.hasData) {
                return Shimmermain(child: 1,ratio: 0.5,);
              }
              return snapshot.data!.isEmpty
                  ? Shimmermain(child: 1,ratio: 0.5,)
                  : ListView(
                scrollDirection: Axis.horizontal,
                children: snapshot.data!.map((news) {
                  return NewscardAll(news: news);
                }).toList(),
              );
            },
          );
        },
      ),
    );
  }

}
