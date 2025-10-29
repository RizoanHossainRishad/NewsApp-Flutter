import 'package:flutter/cupertino.dart';

class screenValues extends ChangeNotifier{

  double _screenWidth=0.0;
  double _screenHeight=0.0;

  void init(BuildContext context){
      _screenHeight=MediaQuery.sizeOf(context).height;
      _screenWidth=MediaQuery.sizeOf(context).width;

  }

  double get screenWidth=> _screenWidth;
  double get screenHeight=> _screenHeight;



}