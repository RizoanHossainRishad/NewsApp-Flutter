import 'package:flutter/material.dart';
import 'package:newsapp_first/Provider/allnewsProvider.dart';
import 'package:newsapp_first/Provider/bnavProvider.dart';
import 'package:newsapp_first/Provider/newsDetails_pro.dart';
import 'package:newsapp_first/Provider/screenValues.dart';
import 'package:newsapp_first/Provider/searchPro.dart';
import 'package:newsapp_first/Provider/trending_news_provider.dart';
import 'package:newsapp_first/screens/Auth_screens/welcome_screen.dart';
import 'package:newsapp_first/screens/bottomNav/BottomNav.dart';
import 'package:newsapp_first/screens/bottomNav/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>bnavProvider()),
        ChangeNotifierProvider(create: (_)=>Allnewsprovider()),
        ChangeNotifierProvider(create: (_)=>screenValues()),
        ChangeNotifierProvider(create:(_)=>NewsdetailsProvider()),
        ChangeNotifierProvider(create:(_)=>TrendingNewsProvider()),
        ChangeNotifierProvider(create:(_)=>Searchpro()),
      ],

      child:const MyApp(),
    ),

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade50),
      ),
      home:const AuthWrapper(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

    );
  }
}
