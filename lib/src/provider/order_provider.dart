import 'package:flutter/material.dart';
import 'package:list_verbs/src/utils/user_preferences.dart';

class OrderProvider with ChangeNotifier {

  final _prefs = new UserPreferences();

  bool get orderVerb => _prefs.order;

  set orderVerb(bool value) {
    _prefs.order = value;
    notifyListeners();
  }
}