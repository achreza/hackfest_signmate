import 'package:flutter/material.dart';
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
          'Alphabet',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
      ),
      body: Container(child: Text('Alphabet')),
    );
  }
}
