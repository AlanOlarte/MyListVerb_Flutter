import 'package:flutter/material.dart';
import 'package:list_verbs/src/utils/user_preferences.dart';

class FilterTypeVerb with ChangeNotifier {

  final _prefs = new UserPreferences();

  List<String> _filtroVerbo = ['Regulares','Irregulares','Todos'];

  getList() => _filtroVerbo;

  int getTypeVerb() => _prefs.typeSelected;

  setTypeVerb(int value) {
    _prefs.typeSelected = value;
    notifyListeners();
  }

  getVerboSeleccionado() => _prefs.verbSelected;

  setVerboSeleccionado(String value){
    _prefs.verbSelected = value;
    notifyListeners();
  }
}

