import 'package:flutter/material.dart';

class MyAppTheme {
  ThemeData _themeLight = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.red[800],
      accentColor: Colors.red[700].withOpacity(0.15),
      backgroundColor: Colors.white,
      splashColor: Colors.red[100],
      );

  ThemeData _themeDark = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.blueGrey[900],
      accentColor: Colors.blueGrey[900],
      backgroundColor: Colors.grey[900],
      splashColor: Colors.grey[500],
      );

  getThemeLight() => _themeLight;

  getThemeDark() => _themeDark;
}
