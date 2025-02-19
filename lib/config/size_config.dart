import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenheigth;
  static double? blockHorizontal;
  static double? blockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenheigth = _mediaQueryData!.size.height;
    blockHorizontal = screenWidth! / 100;
    blockVertical = screenheigth! / 100;
  }
}