import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/onboarding_controller.dart';

class Onboarding1View extends GetView<OnboardingController> {
  const Onboarding1View({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(24).w,
          child: Image.asset(
            'assets/images/dashboard_3.png',
            height: 350.h,
          ),
        ),
        Container(
          width: 220.w,
          child: Text(
            'Learn the ISL anytime anywhere',
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          width: 300.w,
          child: Text(
            'You can learn about sign language anytime and anywhere only with a smartphone',
            style: Theme.of(context).textTheme.headline2,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ));
  }
}
