import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:hackfest_signmate/constant.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: Get.width,
            height: (Get.height * 0.3).h,
            color: primaryColor,
            padding: EdgeInsets.only(top: 70.h, left: 20.w, right: 20.w),
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 50.r,
                    backgroundImage: NetworkImage(
                      controller.user[0].photoURL,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    controller.user[0].displayName,
                    style: TextStyle(
                        fontWeight: FontWeight.w800, letterSpacing: 1),
                  )
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(20),
            child: Text(
              'Personal details',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                controller.logout();
              },
              child: Container(
                  alignment: Alignment.center,
                  width: Get.width,
                  height: 50.h,
                  child: Text(
                    'LOG OUT',
                    style: TextStyle(
                        fontWeight: FontWeight.w900, letterSpacing: 1),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
