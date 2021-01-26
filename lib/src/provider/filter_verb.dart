import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilterTypeVerb with ChangeNotifier {

  String _typeSelected = 'typeSelected';
  String _verbSelected = 'verbSelected';

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  int _type = 0;
  List<String> _filtroVerbo = ['Regulares','Irregulares','Todos'];
  String _verboSeleccionado = '';

  getList() => _filtroVerbo;

  Future<void> _getType() async {
    final SharedPreferences prefs = await _prefs;
    _type = (prefs.getInt( _typeSelected ) ?? 2);
    notifyListeners();
  }

  Future<void> _setType( int type ) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt( _typeSelected, type);
    notifyListeners();
  }

  int getTypeVerb() {
    _getType();
    return _type;
  }

    setTypeVerb(int value) {
      _setType(value);
    }

  Future<void> _getSelected() async {
    final SharedPreferences prefs = await _prefs;
    _verboSeleccionado = (prefs.getString( _verbSelected ) ?? 'Todos');
    notifyListeners();
  }

  Future<void> _setSelected( String type ) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString( _verbSelected, type);
    notifyListeners();
  }

  getVerboSeleccionado() {
    _getSelected();
    return _verboSeleccionado;
  }

  setVerboSeleccionado(String value){
     _setSelected(value);
  }
}

