import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:hackfest_signmate/app/modules/interpreter/controllers/interpreter_controller.dart';
import 'package:hackfest_signmate/app/modules/interpreter/views/hire.dart';
import 'package:hackfest_signmate/constant.dart';
import 'package:hexcolor/hexcolor.dart';

class InterpreterView extends GetView<InterpreterController> {
  const InterpreterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Interpreter',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
      ),
      body: Padding(
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
                'Available Interpreter',
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
            Expanded(
                child: Obx(
              () => controller.isLoading.value == true
                  ? Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    )
                  : ListView.builder(
                      itemBuilder: ((context, index) {
                        return Card(
                          shadowColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 2,
                          child: ListTile(
                              leading: Container(
                                padding: EdgeInsets.all(5),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      AssetImage('assets/images/profile.png'),
                                ),
                              ),
                              title: Text(
                                  controller.interpreter[index]['nickname'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.sp)),
                              subtitle: Text(
                                  controller.interpreter[index]['education'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 14.sp)),
                              trailing: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => Hire(
                                          interpreter:
                                              controller.interpreter[index]),
                                    ),
                                  );
                                },
                                child: Container(
                                    padding: EdgeInsets.all(5),
                                    child: Center(child: Text('Hire')),
                                    width: 60.w,
                                    height: 35.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color: primaryColor,
                                    )),
                              )),
                        );
                      }),
                      itemCount: controller.interpreter.length,
                    ),
            ))
          ],
        ),
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
      height: 140.h,
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
            child: Text('Hire your Interpreter also helper for deaf mate',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                    fontSize: 16.sp)),
          ),
          Container(
            width: (Get.width * 0.3).w,
            child: Image.asset('assets/images/white_skin_phone2.png'),
          ),
        ],
      ),
    );
  }
}
