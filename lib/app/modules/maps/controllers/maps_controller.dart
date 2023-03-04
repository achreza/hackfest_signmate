import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsController extends GetxController {
  //TODO: Implement MapsController

  TextEditingController kataController = TextEditingController();

  final isLoading = true.obs;
  final List handsignAlphabet = [].obs;

  List generateKata = [].obs;
  final isGenerated = false.obs;
  List tiapHuruf = [];

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    getAlphabet();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void clearData() {
    tiapHuruf = [];
    kataController.text = "";
    generateKata = [];
  }

  getTiapHuruf() {
    print(tiapHuruf);
    kataController.text.split('').forEach((element) {
      tiapHuruf.add(element);
    });

    tiapHuruf.forEach((element) {
      var huruf = element.toString().toUpperCase();
      generateKata.add(handsignAlphabet
          .where((element) => element['label'].toString() == huruf.toString())
          .toList());
    });

    print("generate kata : " + generateKata.toString());

    isGenerated.value == true;
  }

  getAlphabet() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection('handsign_alphabet').get();

    handsignAlphabet.assignAll(snapshot.docs.map((e) => e.data()).toList());
    handsignAlphabet.sort((a, b) => a['label'].compareTo(b['label']));
  }
}
