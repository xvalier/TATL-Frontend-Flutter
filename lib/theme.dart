import 'package:flutter/material.dart';

final ThemeData appTheme = new ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(AppColors.bluePrimary),
    primaryColorBrightness: Brightness.light,
    accentColor: Color(AppColors.blueSaturated),
    accentColorBrightness: Brightness.light,
    backgroundColor: Color(AppColors.whiteWarm),

    //Text & Font Style
    fontFamily: 'Montserrat',
    textTheme: TextTheme(
      title: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color: Color(AppColors.whiteWarm)),
      headline: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Color(AppColors.blackCool) ),
      caption: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color: Color(AppColors.blackCool)),
      button: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Color(AppColors.whiteWarm)),
      body1: TextStyle(fontSize: 14.0, color: Color(AppColors.blackCool)),
      body2: TextStyle(fontSize: 17.0, color: Color(AppColors.blackCool)),
      display1: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color: Color(AppColors.redSaturated)),
      display2: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color: Color(AppColors.blueLight)),
      display3: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,color: Color(AppColors.blackWarm)),
    )
);

class AppColors {
  //Required Constructor
  AppColors._();
  //Hex Codes for Colors (Note Android has 2 extra FF at beggining)
  static const redSaturated   = 0xFFE64029;
  static const redPrimary     = 0xFFCC5C4D;
  static const redLight       = 0xFFD36969;
  static const blueSaturated  = 0xFF29A6E5;
  static const bluePrimary    = 0xFF4DA1CC;
  static const blueLight      = 0xFF69BCD3;
  static const yellowSaturated= 0xFFE5E529;
  static const yellowPrimary  = 0xFFCCCC4D;
  static const yellowLight    = 0xFFD3C769;
  static const purpleSaturated= 0xFFA629E5;
  static const purplePrimary  = 0xFFA14DCC;
  static const purpleLight    = 0xFFA469D3;
  static const greenSaturated = 0xFF29E587;
  static const greenPrimary   = 0xFF4DCC8C;
  static const greenLight     = 0xFF69D392;
  static const blackCool      = 0xFF4A5F6D;
  static const blackWarm      = 0xFF605466;
  static const gray           = 0xFFBCCAD1;
  static const whiteCool      = 0xFFE7E7EA;
  static const whiteWarm      = 0xFFE7EBE6;
  static const white          = 0xFFFFFFF0;
}

