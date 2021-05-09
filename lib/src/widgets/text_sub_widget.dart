import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:list_verbs/src/provider/show_spanish_verb.dart';
import 'package:list_verbs/src/provider/theme_provider.dart';

class TextSubWidget extends StatelessWidget {
  String textEnglish;
  String _textPron = '';
  bool _show = false;

  TextSubWidget(this.textEnglish, [textPron = ""]) {
    this._textPron = textPron;
  }

  @override
  Widget build(BuildContext context) {
    final showVerb = Provider.of<ShowSpanishVerb>(context);
    final theme = Provider.of<ThemeChanger>(context);

    if (_textPron.isNotEmpty) {
      _show = showVerb.showVerb;
    }

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.contain,
            child: Text(
              textEnglish,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                  fontFamily: "BalsamiqSans",
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w200,
                  ),
            ),
          ),
          Visibility(
            visible: _show,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                _textPron,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.015,
                    color: theme.getThemeType() ? Colors.grey[400] : Colors.grey[700],
                    fontFamily: "BalsamiqSans",
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w200,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
