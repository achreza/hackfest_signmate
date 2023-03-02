import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hackfest_signmate/constant.dart';

import '../controllers/login_controller.dart';

class Social extends StatelessWidget {
  const Social({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<LoginController>();
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            controller.loginFacebook();
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: Container(
              width: Get.width,
              height: 65.h,
              padding: EdgeInsets.only(left: 50.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.loginFacebook();
                    },
                    child: Container(
                        margin: EdgeInsets.only(right: 10.w),
                        child:
                            Image.asset('assets/images/social/facebook.png')),
                  ),
                  Text('Continue with Facebook',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          letterSpacing: 1)),
                ],
              )),
        ),
        SizedBox(
          height: 20.h,
        ),
        ElevatedButton(
          onPressed: () {
            controller.loginGoogle();
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade200, width: 1),
                  borderRadius: BorderRadius.circular(10))),
          child: Container(
              width: Get.width,
              height: 65.h,
              padding: EdgeInsets.only(left: 50.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 10.w),
                      child: Image.asset('assets/images/social/google.png')),
                  Text('Continue with Google',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          letterSpacing: 1)),
                ],
              )),
        ),
        SizedBox(
          height: 30.h,
        ),
        Text('Or login with email',
            style: TextStyle(
                color: Colors.black, fontSize: 14.sp, letterSpacing: 1)),
      ],
    );
  }
}
