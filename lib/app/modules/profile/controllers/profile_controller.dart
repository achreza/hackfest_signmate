import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hackfest_signmate/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  FirebaseAuth _auth = FirebaseAuth.instance;

  final user = [].obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getUser();
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

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  getUser() async {
    User? userLogin = _auth.currentUser;
    user.add(userLogin);
  }
}
