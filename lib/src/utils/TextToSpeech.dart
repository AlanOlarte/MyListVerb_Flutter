import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:list_verbs/src/provider/repeat_verb.dart';
import 'package:provider/provider.dart';

class TextToSpeech {
  FlutterTts flutterTts = FlutterTts();

  Future<void> speak( String texto, BuildContext context) async {
    final repeat = Provider.of<RepeatVerb>(context, listen: false);

    await flutterTts.setLanguage('en-US');

    if(repeat.column == repeat.previoCcolumn){
      if(repeat.tap == 1) {
        await flutterTts.setSpeechRate(0.2);
        repeat.tap = 2;
      } else {
        await flutterTts.setSpeechRate(0.7);
        repeat.tap = 1;
      }
    } else {
      await flutterTts.setSpeechRate(0.7);
      repeat.tap = 1;
    }
    repeat.previoCcolumn = repeat.column;

    await flutterTts.speak(texto);
  }

  void stop() {
    flutterTts.stop();
  }
}
