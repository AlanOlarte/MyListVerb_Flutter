import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list_verbs/src/provider/theme_provider.dart';
import 'package:list_verbs/src/widgets/TextWidget.dart';
import 'package:provider/provider.dart';

class BarTypeVerb extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final theme = Provider.of<ThemeChanger>(context);

    return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.0)),
        ),
        padding: EdgeInsets.only(top: 5.0),
        height: 55.0,
        child: Row(
          children: [
            Expanded(
              child:Container(
                width: 100,
                height: 50.0,
                child: Center(
                  child: TextWidget(
                      texto:'Infinitive'.toUpperCase()
                  ),
                ),
              ),
            ),
            Expanded(
              child:Container(
                width: MediaQuery.of(context).size.width,
                height: 50.0,
                child: Center(
                  child: TextWidget(
                      texto:'Past'.toUpperCase()
                  )
                ),
                ),
              ),
            Expanded(
              child:Container(
                width: MediaQuery.of(context).size.width,
                height: 50.0,
                child: Center(
                  child: TextWidget(
                      texto:'Participle'.toUpperCase()
                  ),
                ),
              ),
            ),
            Expanded(
              child:Container(
                width: MediaQuery.of(context).size.width,
                height: 50.0,
                child: Center(
                  child: TextWidget(
                      texto:'Spanish'.toUpperCase()
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}

/*



 */