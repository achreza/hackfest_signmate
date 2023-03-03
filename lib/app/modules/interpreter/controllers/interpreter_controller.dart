import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class InterpreterController extends GetxController {
  //TODO: Implement InterpreterController
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final isLoading = true.obs;
  final List interpreter = [].obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getInterpreter();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  getInterpreter() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection('interpreter').get();
    for (final data in snapshot.docs) {
      interpreter.add({'id': data.id, ...data.data()});
    }

    isLoading.value = false;
  }
}
