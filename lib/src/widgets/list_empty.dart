import 'package:flutter/material.dart';

class ListEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: [
            Image.asset(
              "assets/cheems.png",
              width: 300.0,
            ),
            Text(
              'Lo siento, no se encontró el verbo buscado',
              style: Theme.of(context).textTheme.headline2,
            )
          ],
        )
        ),
      );
  }
}