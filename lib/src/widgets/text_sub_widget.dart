import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:list_verbs/src/provider/show_spanish_verb.dart';

// ignore: must_be_immutable
class TextSubWidget extends StatelessWidget {
  String textEnglish;
  String _textPron;
  bool _show = false;

  TextSubWidget ( this.textEnglish, [textPron = ""] ){
    this._textPron=textPron;
  }

  @override
  Widget build(BuildContext context) {

    final showVerb = Provider.of<ShowSpanishVerb>(context);

    if(_textPron.isNotEmpty) {
      _show = showVerb.showVerb;
    }

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text( textEnglish,
              style: Theme.of(context).textTheme.headline2
          ),
          Visibility(
            visible: _show,
            child: Text(_textPron,
                style: Theme.of(context).textTheme.headline3
            ),
          ),
        ],
      ),
    );
  }
}