import 'package:flutter/material.dart';
import 'file:///C:/Users/xlxn_/Documents/Android_Studio/list_verbs/list_verbs/lib/src/utils/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeChanger with ChangeNotifier {

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String _themeSelected = 'themeSelected';
  ThemeData _themeData = MyAppTheme().getThemeLight();
  bool _typeTheme = true;

  Future<void> _getType() async {
    final SharedPreferences prefs = await _prefs;
    _typeTheme = (prefs.getBool( _themeSelected ) ?? false);
    notifyListeners();
  }

  Future<void> _setType( bool type ) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool( _themeSelected, type);
    notifyListeners();
  }

  getTheme() {
    _getType();
    if (_typeTheme) {
      _themeData = MyAppTheme().getThemeDark();
    } else {
      _themeData = MyAppTheme().getThemeLight();
    }
    return _themeData;
  }

  setTheme(bool typeTheme) async {
    _setType(typeTheme);
  }

  getThemeType() => _typeTheme;
}
