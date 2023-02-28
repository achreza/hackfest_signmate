import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechController extends GetxController {
  //TODO: Implement SpeechController

  final count = 0.obs;
  final isListening = false.obs;
  final text = 'Hold mic to start speaking'.obs;
  SpeechToText speech = SpeechToText();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  startListening() async {
    isListening.value = true;
    var available = await speech.initialize();
    if (available) {
      speech.listen(onResult: (result) {
        text.value = result.recognizedWords;
      });
    }
  }

  stopListening() async {
    text.value = await speech.lastRecognizedWords;
    await speech.stop();
    isListening.value = false;
  }
}
