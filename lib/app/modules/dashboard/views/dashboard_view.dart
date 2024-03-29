import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'package:hackfest_signmate/app/modules/dashboard/views/signscan_view.dart';

import 'package:hackfest_signmate/app/routes/app_pages.dart';

import 'package:hackfest_signmate/constant.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
                clipBehavior: Clip.none,
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
                        text: controller.user[0].displayName ??
                            controller.user[0].email,
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
              controller.user[0].photoURL == null
                  ? CircleAvatar(
                      radius: 30.r,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    )
                  : CircleAvatar(
                      radius: 30.r,
                      backgroundImage: NetworkImage(
                        controller.user[0].photoURL,
                      ),
                    ),
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
            margin:
                EdgeInsets.only(top: 350.h, left: 30.w, right: 30.w, bottom: 0),
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
      crossAxisSpacing: 5.w,
      children: [
        FeatureItems(context, 'Dictionary', 'dictionary.png'),
        FeatureItems(context, 'SignMate', 'signmate.png'),
        FeatureItems(context, 'Interpreter', 'interpreter.png'),
      ],
    );
  }

  GestureDetector FeatureItems(context, text, image) {
    return GestureDetector(
      onTap: () {
        if (text == 'Dictionary') {
          Get.toNamed(Routes.DICTIONARY);
        } else if (text == 'SignMate') {
          Get.toNamed(Routes.SIGNMATE);
        } else if (text == 'Interpreter') {
          Get.toNamed(Routes.INTERPRETER);
        }
      },
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

class SignMateView {}

class SignMate extends StatelessWidget {
  const SignMate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadowColor: Colors.grey,
          elevation: 4,
          child: Container(
            width: Get.width,
            height: 200.h,
            child: Stack(children: [
              Column(
                children: [
                  Container(
                    width: Get.width,
                    height: 120.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/images/map.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width,
                    height: 80.h,
                    child: Center(
                      child: Text(
                        'SignMate Name',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 90.h,
                left: 130.w,
                child: Container(
                  width: 50.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.r),
                    image: DecorationImage(
                      image: AssetImage('assets/images/profile.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        );
      },
      itemCount: 5,
    );
  }
}
