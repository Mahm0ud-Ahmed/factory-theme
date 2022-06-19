import 'package:flutter/material.dart';
import 'package:my_app/theme/app_theme/i_theme.dart';

class DarkTheme implements ITheme{
  
  @override
  late List<Color> color;
  
  @override
  late Map<ThemeTextStyle, TextStyle> style;

  @override
  late ThemeData themeData;

  @override
  MaterialColor primarySwatch = Colors.indigo;

  @override
  List<Color> get appColor {
    return color = [
      Colors.white10,
      Colors.grey.shade300,
      Colors.amber.shade300,

    ];
  }

  @override
  Map<ThemeTextStyle, TextStyle> get appStyle {
    return style = {
      ThemeTextStyle.body : TextStyle(color: color[1], fontSize: 16,),
      ThemeTextStyle.subtitle1 : TextStyle(color: color[2], fontSize: 24,),
      ThemeTextStyle.subtitle2 : TextStyle(color: color[0], fontSize: 40,),
    };
  }
  
  @override
  ThemeData get theme {
    return themeData = ThemeData(
      scaffoldBackgroundColor: color[0],
      primarySwatch: primarySwatch,
      appBarTheme: AppBarTheme(color: primarySwatch),
      brightness: Brightness.dark,
    );
  }
  
  @override
  ThemeMode mode = ThemeMode.dark;
  

}
