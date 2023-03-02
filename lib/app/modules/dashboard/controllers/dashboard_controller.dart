import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  FirebaseAuth _auth = FirebaseAuth.instance;

  final RxInt tabIndex = 0.obs;
  late TabController tabController;
  var user = [].obs;
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
  void onClose() {}
  void increment() => count.value++;

  void changeTab(int index) {
    tabIndex.value = index;
    tabController.animateTo(index);
  }

  getUser() async {
    User? userLogin = _auth.currentUser;
    user.add(userLogin);
    print(user);
  }
}
