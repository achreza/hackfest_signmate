import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

var primaryColor = HexColor("#7FBA4E");
var hoverColor = HexColor("#94C56B");
var pressedColor = HexColor("#699B41");

ThemeData themeData = ThemeData(
    primaryColor: primaryColor,
    hoverColor: hoverColor,
    textTheme: TextTheme(
      bodyText1: TextStyle(
          fontFamily: 'SF Pro Display',
          fontStyle: FontStyle.normal,
          fontSize: 14,
          color: Colors.white),
      bodyText2: TextStyle(
          fontFamily: 'SF Pro Display',
          fontStyle: FontStyle.normal,
          fontSize: 16,
          color: Colors.white),
      headline1: TextStyle(
          fontFamily: 'SF Pro Display',
          fontStyle: FontStyle.normal,
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: HexColor("#000000")),
      headline2: TextStyle(
          fontFamily: 'SF Pro Display',
          fontStyle: FontStyle.normal,
          fontSize: 12,
          color: HexColor("#000000")),
    ));
