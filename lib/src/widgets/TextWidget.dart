import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  String texto = '';

  TextWidget({
    this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Text(texto,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.019,
            fontFamily: "BalsamiqSans",
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
            color: Colors.white
          )),
    );
  }
}
