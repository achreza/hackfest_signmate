import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hackfest_signmate/app/routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    checkUser();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  checkUser() {
    print('asd');
  }
}
