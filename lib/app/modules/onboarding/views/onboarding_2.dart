import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Onboarding2View extends StatelessWidget {
  const Onboarding2View({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(24).w,
          child: Image.asset(
            'assets/images/dashboard_2.png',
            height: 350.h,
          ),
        ),
        Container(
          width: 240.w,
          child: Flexible(
            child: Text(
              'Search and learn for the signs effortlessly',
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          width: 300.w,
          child: Flexible(
            child: Text(
              'Just enter the related keywords about the sign in the search box and get instant search result',
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    ));
  }
}
