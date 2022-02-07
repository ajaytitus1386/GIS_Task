import 'package:flutter/widgets.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double cardWidth;
  static late double cardHeight;
  static late double tileWidth;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    cardWidth = screenWidth * 0.75;
    cardHeight = screenHeight * 0.15;
    tileWidth = screenWidth * 0.25;
  }
}
