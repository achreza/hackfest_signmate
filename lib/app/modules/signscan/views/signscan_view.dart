import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signscan_controller.dart';

class SignscanView extends GetView<SignscanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignscanView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SignscanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
