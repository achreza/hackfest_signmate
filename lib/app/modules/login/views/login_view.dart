import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:hackfest_signmate/app/modules/login/views/register_view.dart';
import 'package:hackfest_signmate/constant.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(top: 100.w, left: 30.w, right: 30.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Welcome Back !',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(
                height: 30.h,
              ),
              Social(),
              SizedBox(
                height: 40.h,
              ),
              LoginForm(),
              SizedBox(
                height: 40.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Register(),
                    ),
                  );
                },
                child: Container(
                  width: Get.width,
                  height: 50.h,
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                        text: 'Don\'t have an account ? ',
                        style: TextStyle(color: Colors.black, fontSize: 15.sp),
                        children: [
                          TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600))
                        ]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<LoginController>();
    return Obx(() => Container(
          alignment: Alignment.centerLeft,
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email address',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 10.h,
              ),
              TextFormField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        left: 20.w, right: 20.w, top: 10.h, bottom: 10.h),
                    hintText: 'Enter your email',
                    hintStyle:
                        TextStyle(color: Colors.grey.shade400, fontSize: 14.sp),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    focusColor: primaryColor,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: primaryColor),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.grey.shade300, width: 1))),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Password',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
              ),
              TextFormField(
                obscureText: !controller.showPasswordLogin.value,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          controller.showPassword();
                        },
                        icon: Icon(
                          controller.showPasswordLogin.value == true
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: primaryColor,
                        )),
                    contentPadding: EdgeInsets.only(
                        left: 20.w, right: 20.w, top: 10.h, bottom: 10.h),
                    hintText: 'Enter your password',
                    hintStyle:
                        TextStyle(color: Colors.grey.shade400, fontSize: 14.sp),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    focusColor: primaryColor,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: primaryColor),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.grey.shade300, width: 1))),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                width: Get.width,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, letterSpacing: 1),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
            ],
          ),
        ));
  }
}

class Social extends StatelessWidget {
  const Social({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: Get.width,
            height: 65.h,
            padding: EdgeInsets.only(left: 50.w),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(right: 10.w),
                    child: Image.asset('assets/images/social/facebook.png')),
                Text('Continue with Facebook',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        letterSpacing: 1)),
              ],
            )),
        SizedBox(
          height: 20.h,
        ),
        Container(
            width: Get.width,
            height: 65.h,
            padding: EdgeInsets.only(left: 50.w),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.grey.shade300, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
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
