import 'package:get/get.dart';

import '../controllers/signscan_controller.dart';

class SignscanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignscanController>(
      () => SignscanController(),
    );
  }
}
