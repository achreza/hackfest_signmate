import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController

  final RxInt tabIndex = 0.obs;
  late TabController tabController;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
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
}
