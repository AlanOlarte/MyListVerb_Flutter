import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  String texto;

  TextWidget({
    @required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Text(texto,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.height * 0.019,
          fontFamily: "BalsamiqSans",
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700,
          color: Colors.white
        ));
  }
}
