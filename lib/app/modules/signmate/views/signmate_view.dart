import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:hackfest_signmate/constant.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controllers/signmate_controller.dart';

class SignmateView extends GetView<SignmateController> {
  const SignmateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'SignMate',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Heading(),
              SizedBox(
                height: 30.h,
              ),
              //categories
              Container(
                width: Get.width,
                child: Text(
                  'Place Categories',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Column(
                children: [
                  PlaceCategories(context, 'Hospital Care',
                      'Hospital and clinics', 'health.png'),
                  PlaceCategories(
                      context, 'Food', 'Restaurants and Cafes', 'food.png'),
                  PlaceCategories(context, 'Entertainment', 'Recreation Places',
                      'emoticon.png'),
                  PlaceCategories(context, 'Learning Center', 'School Center',
                      'learning_center.png'),
                  PlaceCategories(
                      context, 'Other Categories', '', 'other_categories.png'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container PlaceCategories(
      BuildContext context, String title, String subtitle, String image) {
    return Container(
      width: Get.width,
      height: 100.h,
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: lightColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 10.w),
            width: (Get.width * 0.1).w,
            child: Image.asset('assets/images/place_categories/${image}'),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
                subtitle != ''
                    ? Text(
                        subtitle,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1),
                      )
                    : Container()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Heading extends StatelessWidget {
  const Heading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 120.h,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: HexColor("#BFDCA6"),
          width: 2,
        ),
        color: HexColor('#ecf5e4'),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: (Get.width * 0.4).w,
            child: Text('SignMate to go out with a disabled mate',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                    fontSize: 16.sp)),
          ),
          Container(
            width: (Get.width * 0.3).w,
            child: Image.asset('assets/images/white_skin_handshake.png'),
          ),
        ],
      ),
    );
  }
}
