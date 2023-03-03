import 'package:get/get.dart';

import '../controllers/interpreter_controller.dart';

class InterpreterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InterpreterController>(
      () => InterpreterController(),
    );
  }
}
