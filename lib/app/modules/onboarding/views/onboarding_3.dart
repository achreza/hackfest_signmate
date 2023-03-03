import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Onboarding3View extends StatelessWidget {
  const Onboarding3View({super.key});

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
            'assets/images/dashboard_4.png',
            height: 350.h,
          )),
        ),
        Container(
          width: 285.w,
          child: Text(
            'Improve your skill with the help of quizzes and more',
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
            'Become more efficient in sign language by solving the daily quizzes in the app',
            style: Theme.of(context).textTheme.headline2,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ));
  }
}
