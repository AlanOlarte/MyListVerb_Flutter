import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderProvider with ChangeNotifier {

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String _order = "order";
  bool _orderVerb = false;

  Future<void> _getOrder() async {
    final SharedPreferences prefs = await _prefs;
    _orderVerb = (prefs.getBool( _order ) ?? false);
    notifyListeners();
  }

  Future<void> _setOrder( bool type ) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool( _order, type);
    notifyListeners();
  }

  bool get orderVerb {
    _getOrder();
    return _orderVerb;
  }

  set orderVerb(bool value) {
    _setOrder(value);
  }
}