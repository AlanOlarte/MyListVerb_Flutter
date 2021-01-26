import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech {
  FlutterTts flutterTts = FlutterTts();

  bool _rate = true;
  bool _firstTouch = true;
  int _repeat;

  Future<void> speak( String texto, int num) async {
    await flutterTts.setLanguage('en-US');

    if (_repeat == num) {
      _firstTouch = false;
    }

    if (_firstTouch || _rate) {
      await flutterTts.setSpeechRate(0.8);
      _repeat = num;
      _rate = false;
    } else {
      await flutterTts.setSpeechRate(0.4);
      _firstTouch = true;
      _rate = true;
    }
    await flutterTts.speak(texto);
  }

  void stop() {
    flutterTts.stop();
    print('Speak Detenida');
  }
}
