import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class _ListProvider with ChangeNotifier {
  List<dynamic> _temp = [];
  List<dynamic> _listVerb = [];

  Future<List<dynamic>> cargarData(int type, bool order) async {
    final res = await rootBundle.loadString('data/list_verb.json');
    Map dataMap = json.decode(res);
    _temp = dataMap['verbs'];

    if( type == 2 ){
      _listVerb = _temp;
    } else {
      _listVerb = _temp.where((element) => element["type"] == type).toList();
    }

    if (order) _listVerb.sort((a,b) => a["infinitive"].toString().compareTo(b["infinitive"].toString()));

    return _listVerb;
  }
}

final listProvider = new _ListProvider();
