import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hackfest_signmate/app/modules/login/controllers/login_controller.dart';
import 'package:hackfest_signmate/constant.dart';

import 'social.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                'Create Your Account',
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
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  LoginForm({
    Key? key,
  }) : super(key: key);

  final _formRegister = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<LoginController>();
    controller.isProcessingRegister.value = false;

    return Obx(() => Container(
          alignment: Alignment.centerLeft,
          width: Get.width,
          child: Form(
            key: _formRegister,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Email address',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  controller: controller.emailDaftar,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 20.w, right: 20.w, top: 10.h, bottom: 10.h),
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(
                          color: Colors.grey.shade400, fontSize: 14.sp),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      focusColor: primaryColor,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.grey.shade300, width: 1))),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Password',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w300),
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  controller: controller.passwordDaftar,
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
                      hintStyle: TextStyle(
                          color: Colors.grey.shade400, fontSize: 14.sp),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      focusColor: primaryColor,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.grey.shade300, width: 1))),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  width: Get.width,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formRegister.currentState!.validate()) {
                        controller.register();
                      }
                    },
                    child: Text(
                      controller.isProcessingRegister.value == false
                          ? 'Sign Up'
                          : 'Loading...',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, letterSpacing: 1),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: Get.width,
                    height: 50.h,
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                          text: 'Already have an account ? ',
                          style:
                              TextStyle(color: Colors.black, fontSize: 15.sp),
                          children: [
                            TextSpan(
                                text: 'Sign In',
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
        ));
  }
}
