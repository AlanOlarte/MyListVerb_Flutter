import 'package:flutter/material.dart';

import 'package:list_verbs/src/provider/order_provider.dart';
import 'package:list_verbs/src/provider/repeat_verb.dart';
import 'package:list_verbs/src/provider/search_provider.dart';
import 'package:list_verbs/src/provider/theme_provider.dart';
import 'package:list_verbs/src/provider/filter_verb.dart';
import 'package:list_verbs/src/provider/list_provider.dart';

import 'package:provider/provider.dart';


import 'package:list_verbs/src/widgets/list_empty.dart';
import 'package:list_verbs/src/widgets/text_sub_widget.dart';

import '../utils/TextToSpeech.dart';

class ListItems extends StatelessWidget {

  List<dynamic> list = [];

  @override
  Widget build(BuildContext context) {

    final type = Provider.of<FilterTypeVerb>(context);
    final order = Provider.of<OrderProvider>(context);
    final search = Provider.of<SearchProvider>(context);
    final theme = Provider.of<ThemeChanger>(context);

    return FutureBuilder(
      future: listProvider.cargarData(type.getTypeVerb(), order.orderVerb),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot ){
        return ListView(
          children: _listItems( snapshot.data, context, search, theme.getThemeType()),
        );
      },
    );
  }

  List<Widget> _listItems( List<dynamic> data, BuildContext context, SearchProvider search, bool theme) {
    final List<Widget> options = [];

    if (search.getSearch().isEmpty) {
      list = data;
    } else {
      list = data.where((element) =>
        element['infinitive'].toLowerCase().contains(search.getSearch().toLowerCase()) ||
        element['past'].toLowerCase().contains(search.getSearch().toLowerCase()) ||
        element['participle'].toLowerCase().contains(search.getSearch().toLowerCase()) ||
        element['spanish'].toLowerCase().contains(search.getSearch().toLowerCase())).toList();
    }

    if(list.isNotEmpty){
      list.forEach((opt) {

        final widgetTemp = Container(
              margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _buttonVerb(opt["infinitive"],opt["pronInfinitive"], "${opt["id"]}"+"0", context),
                  _buttonVerb(opt["past"],opt["pronPast"], "${opt["id"]}"+"1", context),
                  _buttonVerb(opt["participle"],opt["pronParticiple"], "${opt["id"]}"+"2", context),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 55.0,
                      child: Center(
                        child: TextSubWidget( opt["spanish"] )
                      ),
                    ),
                  ),
                ],
              ),
            );

        options..add(widgetTemp);
      });
    } else {
      options.add(ListEmpty());
    }

    return options;
  }

  Widget _buttonVerb(String text, String pronunciation, String column, BuildContext context) {
    final tapColumn = Provider.of<RepeatVerb>(context, listen: false);

    return Expanded(
      flex: 1,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Container(
            padding: EdgeInsets.only(right: 2),
            height: 55.0,
            child: TextSubWidget(text, pronunciation )
        ),
        onTap: () {
          tapColumn.column = int.parse(column);
          _speak(text, context);
        },
      ),
    );
  }

  _speak(String text, BuildContext context) {
    TextToSpeech().speak(text, context);
  }
}
