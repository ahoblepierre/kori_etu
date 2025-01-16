import 'package:flutter/material.dart';

const Color kscaffoldBackgroundColor = Color(0xffF5F5F5);

const Color kprimary = Color(0xff232759);

const Color kborderColors = Color(0xffC5C9FB);

const Color ksecondary = Color(0xfffed301);

const Color ksecondaryLigth = Color(0xffFDFEE8);

const Color kLink = Color(0xff4263eb);

const double kborder = 15.0;

const double kespacing = 15.0;

const double kespacingScaffoldMessage = 09.0;

const double kborderInput = 10.0;

const double iconSize = 30.0;

const Color kgrey = Color(0xff7D7C93);

const String ksecondFont = "Inter";

const boldStyle = TextStyle(
  fontWeight: FontWeight.w900,
  fontSize: 70,
  color: kprimary,
);

koriTextStyle(
        {double fontSize = 15,
        Color color = kprimary,
        FontWeight? fontWeight,
        String? fontFamily = "FamiljenGrotesk"}) =>
    TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        fontFamily: fontFamily);
