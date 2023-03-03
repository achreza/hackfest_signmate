import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:hackfest_signmate/constant.dart';

import '../controllers/speech_controller.dart';

class SpeechView extends GetView<SpeechController> {
  const SpeechView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(() => AvatarGlow(
            endRadius: 75,
            animate: controller.isListening.value,
            glowColor: primaryColor,
            duration: Duration(milliseconds: 2000),
            repeat: true,
            repeatPauseDuration: Duration(milliseconds: 100),
            showTwoGlows: true,
            child: GestureDetector(
              onTapDown: (details) {
                controller.startListening();
              },
              onTapUp: (details) {
                controller.stopListening();
              },
              child: CircleAvatar(
                  backgroundColor: primaryColor,
                  radius: 35,
                  child: Icon(
                      controller.isListening.value ? Icons.mic : Icons.mic_none,
                      color: Colors.white)),
            ),
          )),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Speech To Text'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          height: Get.height * 0.8,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          margin: EdgeInsets.only(bottom: 150.w),
          child: Obx(() => Text(controller.text.value,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500))),
        ),
      ),
    );
  }
}
