import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {

  String _typeSelected = 'typeSelected';
  String _verbSelected = 'verbSelected';
  String _order = "order";
  String _showHide = 'showHide';
  String _themeSelected = 'themeSelected';

  static final UserPreferences _instancia = new UserPreferences._internal();

  factory UserPreferences() => _instancia;

  UserPreferences._internal();

  SharedPreferences _prefs;

  initPrefs() async => this._prefs = await SharedPreferences.getInstance();

  get typeSelected => _prefs.getInt( _typeSelected ) ?? 2;

  set typeSelected(int value) {
    _prefs.setInt( _typeSelected, value);
  }

  get verbSelected => _prefs.getString( _verbSelected ) ?? 'Todos';

  set verbSelected(String value) {
    _prefs.setString(_verbSelected, value);
  }

  get order => _prefs.getBool( _order ) ?? false;

  set order(bool value) {
    _prefs.setBool(_order, value);
  }

  get showHide => _prefs.getBool( _showHide ) ?? false;

  set showHide(bool value) {
    _prefs.setBool(_showHide, value);
  }

  get themeSelected => _prefs.getBool( _themeSelected ) ?? false;

  set themeSelected(bool value) {
    _prefs.setBool(_themeSelected, value);
  }
}