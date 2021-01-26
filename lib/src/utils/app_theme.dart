import 'package:flutter/material.dart';

class MyAppTheme {

  ThemeData _themeLight = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.red[800],
      accentColor: Colors.redAccent[100],
      dividerColor: Colors.red[900],
      splashColor: Colors.red[100],
      cardColor: Colors.black,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        centerTitle: true,
        textTheme: TextTheme(
          title: TextStyle(
            fontFamily: "BalsamiqSans",
            fontSize: 30.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w800,
            color: Color(0xFFFFFFFF)
          ),
        ),
      ),
      textTheme: TextTheme(
        button: TextStyle(
            fontFamily: "BalsamiqSans",
            fontSize: 18.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            color: Color(0xFFFFFFFF)
        ),
        headline1: TextStyle(
            fontFamily: "BalsamiqSans",
            fontSize: 18.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            color: Color(0xFF000000)
        ),
        headline2: TextStyle(
            fontFamily: "BalsamiqSans",
            fontSize: 16.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w200,
            color: Color(0xFF000000)
        ),
        headline3: TextStyle(
            fontFamily: "BalsamiqSans",
            fontSize: 13.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w100,
            color: Color(0xFF616161)
        ),
        headline4: TextStyle(
            fontFamily: "BalsamiqSans",
            fontSize: 18.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: Color(0xFF000000)
        ),
      ));

  ThemeData _themeDark = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.red[800],
      accentColor: Color(0xFFA90A0A),
      dividerColor: Colors.red[500],
      splashColor: Colors.red[900],
      cardColor: Color(0xFFFFFFFF),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        centerTitle: true,
        textTheme: TextTheme(
          title: TextStyle(
              fontFamily: "BalsamiqSans",
              fontSize: 30.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w800,
              color: Color(0xFFFFFFFF)
          ),
        ),
      ),
      textTheme: TextTheme(
        button: TextStyle(
            fontFamily: "BalsamiqSans",
            fontSize: 18.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            color: Color(0xFFFFFFFF)
        ),
        headline1: TextStyle(
            fontFamily: "BalsamiqSans",
            fontSize: 18.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            color: Color(0xFFFFFFFF)
        ),
        headline2: TextStyle(
            fontFamily: "BalsamiqSans",
            fontSize: 16.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            color: Color(0xFFFFFFFF)
        ),
        headline3: TextStyle(
            fontFamily: "BalsamiqSans",
            fontSize: 13.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w100,
            color: Color(0xFFBDBDBD)
        ),
        headline4: TextStyle(
            fontFamily: "BalsamiqSans",
            fontSize: 18.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: Color(0xFFFFFFFF)
        ),
      ));

  getThemeLight() => _themeLight;
  getThemeDark() => _themeDark;
}
