import 'package:flutter/widgets.dart';

class SizeConfig{
  static MediaQueryData _mediaQueryData;
  static double screenHeight;
  static double screenWidth;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  void init(BuildContext context){
    _mediaQueryData=MediaQuery.of(context);
    screenHeight = _mediaQueryData.size.width;
    screenWidth = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth/100;
    blockSizeVertical = screenHeight/100;
  }
}
