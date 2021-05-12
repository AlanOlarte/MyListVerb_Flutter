import 'package:flutter/material.dart';
import 'package:list_verbs/src/utils/user_preferences.dart';

class ShowSpanishVerb with ChangeNotifier {

  final _prefs = new UserPreferences();

  bool get showVerb => _prefs.showHide;

  set showVerb(bool value) {
    _prefs.showHide = value;
    notifyListeners();
  }
}