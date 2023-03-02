import 'package:get/get.dart';

import '../controllers/signmate_controller.dart';

class SignmateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignmateController>(
      () => SignmateController(),
    );
  }
}
