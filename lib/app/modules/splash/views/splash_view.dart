import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hackfest_signmate/constant.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: Stack(
          children: [
            Container(
              height: Get.height,
              width: Get.width,
              child: Center(
                child: Image.asset(
                  "assets/images/splash_img.png",
                ),
              ),
            ),
            Center(
              child: Container(
                height: 200.h,
                width: 200.w,
                child: Center(
                  child: Image.asset(
                    "assets/images/Logo.png",
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
