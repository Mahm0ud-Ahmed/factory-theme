import 'package:flutter/material.dart';

abstract class ITheme{
  ITheme._();
  late Map<ThemeTextStyle, TextStyle> style;
  late List<Color> color;
  late ThemeData themeData;
  late MaterialColor primarySwatch;
  late ThemeMode mode;


  Map<ThemeTextStyle, TextStyle> get appStyle;
  List<Color> get appColor;
  ThemeData get theme;

}

enum ThemeTextStyle{
  body,
  subtitle1,
  subtitle2,
}