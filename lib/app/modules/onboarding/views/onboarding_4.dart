import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Onboarding4View extends StatelessWidget {
  const Onboarding4View({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(24).w,
          child: Container(
              child: Image.asset(
            'assets/images/dashboard_1.png',
            height: 350.h,
          )),
        ),
        Container(
          width: 300.w,
          child: Text(
            'Let’s overcome the language barrier, Together',
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    ));
  }
}
