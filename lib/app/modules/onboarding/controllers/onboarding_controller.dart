import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackfest_signmate/app/modules/onboarding/views/onboarding_1.dart';
import 'package:hackfest_signmate/app/modules/onboarding/views/onboarding_2.dart';
import 'package:hackfest_signmate/app/modules/onboarding/views/onboarding_3.dart';
import 'package:hackfest_signmate/app/modules/onboarding/views/onboarding_4.dart';

class OnboardingController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement OnboardingController

  final RxInt tabIndex = 0.obs;
  late TabController tabController;
  final db = FirebaseFirestore.instance;

  void changeTab(int index) {
    tabIndex.value = index;
    tabController.animateTo(index);
  }

  final List<Widget> pages = [
    Onboarding1View(),
    Onboarding2View(),
    Onboarding3View(),
    Onboarding4View()
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: pages.length, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  List users = [];

  Future getUsers() async {
    var data = await db.collection('handsign').get();
    users = data.docs;
  }
}
