import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowSpanishVerb with ChangeNotifier {

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String _showHide = 'showHide';
  bool _showVerb = false;

  Future<void> _getType() async {
    final SharedPreferences prefs = await _prefs;
    _showVerb = (prefs.getBool( _showHide ) ?? false);
    notifyListeners();
  }

  Future<void> _setType( bool type ) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool( _showHide, type);
    notifyListeners();
  }

  bool get showVerb {
    _getType();
    return _showVerb;
  }

  set showVerb(bool value) {
    _setType(value);
  }
}