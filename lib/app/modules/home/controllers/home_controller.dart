import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackfest_signmate/app/modules/dashboard/views/dashboard_view.dart';
import 'package:hackfest_signmate/app/routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

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

  List<Widget> pages = [
    DashboardView(),
    DashboardView(),
    DashboardView(),
  ];

  final currentIndex = 0.obs;
  changeTab(int index) => currentIndex.value = index;

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
