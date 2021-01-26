import 'package:flutter/material.dart';

class SelectedAppBar with ChangeNotifier {
  int _selectedAppBar = 0;

  int get selectedAppBarOpt {
    return this._selectedAppBar;
  }

  set selectedAppBarOpt( int i ) {
    this._selectedAppBar = i;
    notifyListeners();
  }
}