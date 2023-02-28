import 'package:get/get.dart';

import '../controllers/dictionary_controller.dart';

class DictionaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DictionaryController>(
      () => DictionaryController(),
    );
  }
}
