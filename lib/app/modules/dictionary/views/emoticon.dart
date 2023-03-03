import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hackfest_signmate/constant.dart';

import '../controllers/dictionary_controller.dart';

class Emoticon extends StatelessWidget {
  const Emoticon({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DictionaryController>();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text(
            'Emoticon',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          centerTitle: false,
        ),
        body: Obx(() => controller.handsignAlphabet.length == 0
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: EdgeInsets.only(top: 10.w, left: 10.w, right: 10.w),
                child: GridView.builder(
                    itemCount: controller.handsignAlphabet.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 3 / 4,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        crossAxisCount: 2),
                    itemBuilder: ((context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: primaryColor, width: 1)),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                                height: 150.h,
                                width: 150.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  border:
                                      Border.all(color: primaryColor, width: 1),
                                  image: DecorationImage(
                                    image: NetworkImage(controller
                                        .handsignAlphabet[index]['image']),
                                    fit: BoxFit.cover,
                                  ),
                                )),
                            SizedBox(
                              height: 30.h,
                            ),
                            Text(
                              controller.handsignAlphabet[index]['label'],
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ],
                        ),
                      );
                    })),
              )));
  }
}
