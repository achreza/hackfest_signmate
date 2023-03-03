import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hackfest_signmate/app/modules/dashboard/views/dashboard_view.dart';
import 'package:hackfest_signmate/constant.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.currentIndex.value > -1
        ? Scaffold(
            body: controller.pages[controller.currentIndex.value],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                controller.changeTab(value);
              },
              selectedItemColor: primaryColor,
              currentIndex: controller.currentIndex.value,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.sign_language_outlined),
                  label: 'Sign',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: 'Profile',
                ),
              ],
            ))
        : Container());
  }
}
