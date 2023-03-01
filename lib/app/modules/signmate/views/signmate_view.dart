import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signmate_controller.dart';

class SignmateView extends GetView<SignmateController> {
  const SignmateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignmateView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SignmateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
