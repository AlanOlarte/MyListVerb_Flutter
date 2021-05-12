import 'package:flutter/material.dart';
import 'package:list_verbs/src/utils/app_theme.dart';
import 'package:list_verbs/src/utils/user_preferences.dart';

class ThemeChanger with ChangeNotifier {

  final _prefs = new UserPreferences();

  ThemeData _themeData = MyAppTheme().getThemeLight();

  getTheme() {
    (_prefs.themeSelected)? _themeData = MyAppTheme().getThemeDark() : _themeData = MyAppTheme().getThemeLight();
    return _themeData;
  }

  getThemeType() => _prefs.themeSelected;

  setTheme(bool typeTheme) async {
    _prefs.themeSelected = typeTheme;
    notifyListeners();
  }


}
