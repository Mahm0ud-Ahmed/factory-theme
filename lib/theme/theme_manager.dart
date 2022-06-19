import 'package:flutter/material.dart';
import 'package:my_app/theme/app_theme/dark_theme.dart';
import 'package:my_app/theme/app_theme/i_theme.dart';
import 'package:my_app/theme/app_theme/light_theme.dart';

class ThemeManager extends ChangeNotifier{

  late ITheme theme;

  void initTheme(ITheme argTheme){
    if(argTheme is LightTheme){
      theme = LightTheme();
    }else{
      theme = DarkTheme();
    }
    theme.appColor;
    theme.appStyle;
    theme.theme;
    notifyListeners();
  }

  static ThemeManager? _instance;

  ThemeManager._init();

  factory ThemeManager() { return _instance ??= ThemeManager._init();}
}