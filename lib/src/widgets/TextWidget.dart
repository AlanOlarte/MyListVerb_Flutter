import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TextWidget extends StatelessWidget {
  String texto;
  TextStyle textStyle;

  TextWidget({
    @required this.texto,
    @required this.textStyle
});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(texto,
      style: textStyle,
      minFontSize: 15,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
