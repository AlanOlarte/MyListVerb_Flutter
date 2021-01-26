import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:list_verbs/src/utils/TextToSpeech.dart';

import 'package:list_verbs/src/widgets/BarTypeVerb.dart';
import 'package:list_verbs/src/widgets/app_bar.dart';
import 'package:list_verbs/src/widgets/list_items.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: MyAppBar(),
        body: SizedBox(
          child: Stack(
            children: <Widget>[
              BarTypeVerb(),
              Container(
                  decoration: BoxDecoration(
                      //color: Colors.black38,
                      ),
                  margin: EdgeInsets.only(top: 55.0),
                  padding: EdgeInsets.all(5.0),
                  alignment: Alignment.bottomCenter,
                  child: ListItems(),
              ),
            ],
          ),
        ));
  }

  @override
  // ignore: must_call_super
  void dispose() {
    TextToSpeech().stop();
  }
}