import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list_verbs/src/widgets/TextWidget.dart';

class BarTypeVerb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
        padding: EdgeInsets.only(top: 5.0),
        height: 55.0,
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15.0), bottomRight: Radius.circular(15.0)),
          boxShadow: <BoxShadow>[BoxShadow(color: Colors.blueGrey[300], offset: Offset(0.0, 5.0), blurRadius: 5.0, spreadRadius: 0.0)],
        ),
        child: Row(
          children: [
            Expanded(
              child:Container(
                width: 100,
                height: 50.0,
                child: Center(
                  child: TextWidget(
                      texto:'Infinitive'.toUpperCase(),
                      textStyle:Theme.of(context).textTheme.headline1
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
                      texto:'Past'.toUpperCase(),
                      textStyle:Theme.of(context).textTheme.headline1)
                ),
                ),
              ),
            Expanded(
              child:Container(
                width: MediaQuery.of(context).size.width,
                height: 50.0,
                child: Center(
                  child: TextWidget(
                      texto:'Participle'.toUpperCase(),
                      textStyle:Theme.of(context).textTheme.headline1
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
                      texto:'Spanish'.toUpperCase(),
                      textStyle:Theme.of(context).textTheme.headline1
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