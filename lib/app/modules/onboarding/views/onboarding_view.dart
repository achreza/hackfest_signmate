import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:hackfest_signmate/app/routes/app_pages.dart';
import 'package:hackfest_signmate/constant.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: TabBarView(
              children: controller.pages,
              controller: controller.tabController,
              physics: NeverScrollableScrollPhysics(),
            ),
          ),
          Obx(() => controller.tabIndex.value == 3
              ? getStarted()
              : Container(
                  height: 250.h,
                  padding: EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                          child: Obx((() => Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: controller.tabIndex.value == 0
                                          ? pressedColor
                                          : hoverColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    height: 8.h,
                                    width: controller.tabIndex.value == 0
                                        ? 24.w
                                        : 12.w,
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: controller.tabIndex.value == 1
                                          ? pressedColor
                                          : hoverColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    height: 8.h,
                                    width: controller.tabIndex.value == 1
                                        ? 24.w
                                        : 12.w,
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: controller.tabIndex.value == 2
                                          ? pressedColor
                                          : hoverColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    height: 8.h,
                                    width: controller.tabIndex.value == 2
                                        ? 24.w
                                        : 12.w,
                                  ),
                                ],
                              )))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              controller
                                  .changeTab(controller.tabIndex.value + 1);
                            },
                            child: Text(
                              'Skip',
                              style: TextStyle(color: primaryColor),
                            ),
                          ),
                          Container(
                            height: 55.h,
                            width: 120.w,
                            child: TextButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                )),
                                backgroundColor:
                                    MaterialStateProperty.all(primaryColor),
                              ),
                              onPressed: () {
                                controller
                                    .changeTab(controller.tabIndex.value + 1);
                              },
                              child: Text(
                                'Next',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ))
        ],
      ),
    );
  }
}

Widget getStarted() {
  return Container(
    margin: EdgeInsets.all(20).w,
    height: 200.h,
    width: Get.width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: Get.width,
          height: 55.h,
          child: TextButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              )),
              backgroundColor: MaterialStateProperty.all(primaryColor),
            ),
            onPressed: () {
              Get.offAllNamed(Routes.SPEECH);
            },
            child: Text(
              'Get Started',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'SF Pro Display',
                  fontSize: 16.sp),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Already Have an Account ?',
              style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  color: Colors.black,
                  fontSize: 12.sp),
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                      fontSize: 12.sp),
                ))
          ],
        ),
      ],
    ),
  );
}
