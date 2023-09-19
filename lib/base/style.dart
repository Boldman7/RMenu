import 'dart:ui';

import 'package:flutter/material.dart';

class MyColorStyle {
  static const background = Color(0xFFF7F8FA);
  static const normalGreyColor = Color(0xFF888888);
  static const darkGreyColor = Color(0xFF444444);
  static const lighterGreyColor = Color(0xFFECECEC);
}

double zoom(size, context) =>
    (MediaQuery.of(context).size.width * size / 480.0).roundToDouble();

class MyFontStyle {
  static double h1(context) => zoom(35.0, context);
  static double h2(context) => zoom(28.0, context);
  static double h3(context) => zoom(24.0, context);
  static double h4(context) => zoom(22.0, context);
  static double text(context) => zoom(14.0, context);
  static double small(context) => zoom(12.0, context);
}

class MySizeStyle {
  static double design(size, context) => zoom(size, context);
  static double pageVertical(context) => zoom(10.0, context);
  static double pageHorizontal(context) => zoom(20.0, context);
  static double fullWidth(context) => MediaQuery.of(context).size.width;
}

class MyTextStyle {
  static TextStyle pageTitleStyle(context) => TextStyle(
      fontFamily: "Arimo",
      fontSize: MyFontStyle.h3(context),
      decoration: TextDecoration.none,
      color: Colors.black);

  static TextStyle titleStyle(context) => TextStyle(
      fontFamily: "Arimo",
      fontSize: MyFontStyle.h2(context),
      decoration: TextDecoration.none,
      color: Colors.white);

  static TextStyle textStyle(context,
          {color = Colors.black,
          size = 19,
          fontWeight = FontWeight.normal,
          sameWidth = false}) =>
      TextStyle(
          fontFamily: "Arimo",
          fontSize: zoom(size, context),
          decoration: TextDecoration.none,
          fontWeight: fontWeight,
          fontFeatures: sameWidth ? [const FontFeature.tabularFigures()] : [],
          color: color);

  static TextStyle h1Style(context,
          {color = Colors.black, fontWeight = FontWeight.normal}) =>
      TextStyle(
          fontFamily: "Arimo",
          fontSize: MyFontStyle.h1(context),
          decoration: TextDecoration.none,
          fontWeight: fontWeight,
          color: color);

  static TextStyle h2Style(context,
          {color = Colors.black, fontWeight = FontWeight.normal}) =>
      TextStyle(
          fontFamily: "Arimo",
          fontSize: MyFontStyle.h2(context),
          decoration: TextDecoration.none,
          fontWeight: fontWeight,
          color: color);

  static TextStyle h3Style(context,
          {color = Colors.black, fontWeight = FontWeight.normal}) =>
      TextStyle(
          fontFamily: "Arimo",
          fontSize: MyFontStyle.h3(context),
          decoration: TextDecoration.none,
          fontWeight: fontWeight,
          color: color);

  static TextStyle h4Style(context,
          {color = Colors.black, fontWeight = FontWeight.normal}) =>
      TextStyle(
          fontFamily: "Arimo",
          fontSize: MyFontStyle.h4(context),
          decoration: TextDecoration.none,
          fontWeight: fontWeight,
          color: color);
}
