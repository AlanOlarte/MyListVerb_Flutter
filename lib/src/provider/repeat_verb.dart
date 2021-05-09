import 'package:flutter/material.dart';

class RepeatVerb with ChangeNotifier {

  int _column = 0;
  int _previoCcolumn = 0;
  int _tap = 1;

  int get column => _column;

  set column(int value) {
    _column = value;
    notifyListeners();
  }

  int get tap => _tap;

  set tap(int value) {
    _tap = value;
    notifyListeners();
  }

  int get previoCcolumn => _previoCcolumn;

  set previoCcolumn(int value) {
    _previoCcolumn = value;
    notifyListeners();
  }
}