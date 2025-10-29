import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsapp_first/Provider/bnavProvider.dart';
import 'package:newsapp_first/auth_services/auth_service.dart';
import 'package:newsapp_first/screens/Auth_screens/welcome_screen.dart';

import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

import '../../Provider/screenValues.dart';
import '../allNewsScreen.dart';
import '../trending_news_screen_main.dart';
import '../category_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {

  late PersistentTabController _controller;
  final auth=AuthService();
  @override
  void initState() {

    super.initState();
    _controller=PersistentTabController(initialIndex: 0);


  }


  List<Widget> _buildScreens() {
    return [
      AllNewsScreen(),
      TrendingNewsScreen(),
      CategoryScreen(),
    ];
  }


  @override
  Widget build(BuildContext context) {
    final screenPro=(context).watch<screenValues>();
    screenPro.init(context);
    final bnav= Provider.of<bnavProvider>(context);
    final screenWidth=MediaQuery.sizeOf(context).width;



      return PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items:bnav.navBarsItems,
        confineToSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: false,
        hideNavigationBarWhenKeyboardAppears: true,

        decoration: NavBarDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(screenWidth*0.08),
              topLeft: Radius.circular(screenWidth*0.08)
          ),
          colorBehindNavBar: Colors.white,
        ),

        popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
        navBarStyle: NavBarStyle.style9,
      );


  }
}


