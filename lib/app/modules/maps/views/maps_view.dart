// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hackfest_signmate/app/modules/maps/controllers/maps_controller.dart';
import 'package:hackfest_signmate/constant.dart';

class MapsView extends GetView<MapsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                child: TextFormField(
                  controller: controller.kataController,
                  decoration: InputDecoration(
                    hintText: 'Inputkan Kata',
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                width: double.infinity,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(primaryColor),
                    ),
                    onPressed: () {
                      controller.getTiapHuruf();
                      controller.isGenerated.value = true;
                    },
                    child: Text('Generate')),
              ),
            ),
            Flexible(
              flex: 5,
              child: Container(
                  child: Obx(() => controller.generateKata.isEmpty
                      ? Center(
                          child: Text('Silahkan Masukkan Kata'),
                        )
                      : Padding(
                          padding: EdgeInsets.only(
                              top: 10.w, left: 10.w, right: 10.w),
                          child: GridView.builder(
                              itemCount: controller.generateKata.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 3 / 4,
                                      mainAxisSpacing: 5,
                                      crossAxisSpacing: 5,
                                      crossAxisCount: 2),
                              itemBuilder: ((context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: primaryColor, width: 1)),
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Container(
                                          height: 150.h,
                                          width: 150.w,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: primaryColor, width: 1),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  controller.generateKata[index]
                                                      [0]['image']),
                                              fit: BoxFit.cover,
                                            ),
                                          )),
                                      Text(
                                        controller.generateKata[index][0]
                                            ['label'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1,
                                      ),
                                    ],
                                  ),
                                );
                              })),
                        ))),
            )
          ],
        ),
      ),
    );
  }
}
