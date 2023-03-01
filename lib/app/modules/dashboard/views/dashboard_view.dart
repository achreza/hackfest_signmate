import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:hackfest_signmate/app/modules/dashboard/views/signscan_view.dart';
import 'package:hackfest_signmate/app/modules/signscan/views/signscan_view.dart';
import 'package:hackfest_signmate/constant.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: 250.h,
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            decoration: new BoxDecoration(
              color: primaryColor,
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.elliptical(1000, 100)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: RichText(
                    text: TextSpan(
                      text: 'Welcome, \n',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w300,
                        height: 1.5,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'John Doe',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Image.asset('assets/images/profile.png')
              ],
            ),
          ),
          Container(
            width: Get.width,
            height: 160.h,
            margin: EdgeInsets.only(top: 200.h, left: 30.w, right: 30.w),
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: lightColor, width: 4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Use your phone to \ncommunicate with \r\n',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                        letterSpacing: 0.5),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Deaf Mate',
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset('assets/images/white_skin_hand_phone.png')
              ],
            ),
          ),
          Container(
              width: Get.width,
              margin: EdgeInsets.only(
                  top: 350.h, left: 30.w, right: 30.w, bottom: 0),
              padding: EdgeInsets.symmetric(vertical: 30.h),
              child: Text('Feature',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700))),
          Container(
              width: Get.width,
              margin: EdgeInsets.only(top: 350.h, left: 30.w, right: 30.w),
              padding: EdgeInsets.symmetric(vertical: 30.h),
              child: Features()),
          Container(
              width: Get.width,
              margin: EdgeInsets.only(top: 530.h, left: 30.w, right: 30.w),
              padding: EdgeInsets.symmetric(vertical: 30.h),
              child: Text('SignMate Around',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700))),
          Container(
              width: Get.width,
              margin: EdgeInsets.only(top: 555.h, left: 30.w, right: 30.w),
              padding: EdgeInsets.only(top: 30.h),
              child: SignMate()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primaryColor,
        currentIndex: 0,
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
      ),
    );
  }
}

class Features extends StatelessWidget {
  const Features({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      shrinkWrap: true,
      crossAxisSpacing: 5,
      children: [
        FeatureItems(context, 'Dictionary', 'dictionary.png'),
        FeatureItems(context, 'SignMate', 'signmate.png'),
        FeatureItems(context, 'Interpreter', 'interpreter.png'),
      ],
    );
  }

  GestureDetector FeatureItems(context, text, image) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: primaryColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50.w,
              height: 50.h,
              child: Image.asset('assets/images/feature/${image}'),
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignMate extends StatelessWidget {
  const SignMate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1,
      shrinkWrap: true,
      crossAxisSpacing: 5,
      children: [
        FeatureItems(context, 'Dictionary', 'dictionary.png'),
        FeatureItems(context, 'SignMate', 'signmate.png'),
        FeatureItems(context, 'Interpreter', 'interpreter.png'),
      ],
    );
  }

  GestureDetector FeatureItems(context, text, image) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: primaryColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50.w,
              height: 50.h,
              child: Image.asset('assets/images/feature/${image}'),
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
