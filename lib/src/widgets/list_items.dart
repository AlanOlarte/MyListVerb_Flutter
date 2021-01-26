import 'package:flutter/material.dart';
import 'package:list_verbs/src/provider/order_provider.dart';
import 'package:list_verbs/src/provider/search_provider.dart';
import 'package:provider/provider.dart';

import 'package:list_verbs/src/provider/list_provider.dart';
import 'package:list_verbs/src/provider/filter_verb.dart';

import 'package:list_verbs/src/widgets/list_empty.dart';
import 'package:list_verbs/src/widgets/text_sub_widget.dart';

import '../utils/TextToSpeech.dart';

// ignore: must_be_immutable
class ListItems extends StatelessWidget {

  List<dynamic> list = [];

  @override
  Widget build(BuildContext context) {

    final type = Provider.of<FilterTypeVerb>(context);
    final order = Provider.of<OrderProvider>(context);
    final search = Provider.of<SearchProvider>(context);

    return FutureBuilder(
      future: listProvider.cargarData(type.getTypeVerb(), order.orderVerb),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot ){
        return ListView(
          children: _listItems( snapshot.data, context, search),
        );
      },
    );
  }

  List<Widget> _listItems( List<dynamic> data, BuildContext context, SearchProvider search) {
    final List<Widget> options = [];

    speak(String text, int num) {
      TextToSpeech().speak(text, num);
    }

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
              //padding: EdgeInsets.symmetric(vertical: 20.0),
              margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 55.0,
                        child: TextSubWidget(opt["infinitive"], opt["pronInfinitive"] )
                      ),
                      onTap: () => speak(opt["infinitive"], 0),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 55.0,
                          child: TextSubWidget(opt["past"], opt["pronPast"] )
                      ),
                      onTap: () => speak(opt["past"], 1),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 55.0,
                          child: TextSubWidget(opt["participle"], opt["pronParticiple"] )
                      ),
                      onTap: () => speak(opt["participle"], 2),
                    ),
                  ),
                  Expanded(
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
}
