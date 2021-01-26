import 'package:flutter/material.dart';

class SearchProvider with ChangeNotifier {

  String _search = "";

  String getSearch() => _search;

  setSearch(String valor) {
    this._search = valor;
    notifyListeners();
  }
}