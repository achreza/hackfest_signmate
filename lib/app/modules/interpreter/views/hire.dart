import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hackfest_signmate/app/modules/interpreter/controllers/interpreter_controller.dart';
import 'package:hackfest_signmate/constant.dart';

class Hire extends StatelessWidget {
  final interpreter;
  const Hire({super.key, required this.interpreter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Hire'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.w),
                  child: Text(
                    interpreter['nickname'],
                    style: Theme.of(context).textTheme.headline1,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Card(
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              child: Container(
                width: Get.width,
                height: 300.h,
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    DataInterpreter(
                      label: 'Full Name',
                      value: interpreter['fullname'],
                    ),
                    DataInterpreter(
                      label: 'Nick Name',
                      value: interpreter['nickname'],
                    ),
                    DataInterpreter(
                      label: 'Email',
                      value: interpreter['email'],
                    ),
                    DataInterpreter(
                      label: 'Education',
                      value: interpreter['education'],
                    ),
                    DataInterpreter(
                      label: 'Price',
                      value: 'Rp ${interpreter['price']}',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {},
              child: Container(
                  alignment: Alignment.center,
                  width: Get.width,
                  height: 50.h,
                  child: Text('Hire')),
            ),
          ],
        ),
      ),
    );
  }
}

class DataInterpreter extends StatelessWidget {
  const DataInterpreter({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final label;
  final value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100.w,
          child: Text(
            label,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          width: 200.w,
          child: Text(
            value,
            style: TextStyle(color: Colors.black),
          ),
        ),
        SizedBox(
          height: 40.h,
        )
      ],
    );
  }
}
