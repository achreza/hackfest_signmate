import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DictionaryController extends GetxController {
  //TODO: Implement DictionaryController
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final count = 0.obs;
  final List youtubeTutorials = [].obs;
  final isLoadingYoutubeTutorials = true.obs;

  @override
  void onInit() {
    super.onInit();
    getYoutubeTutorials();
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

  Future<void> getYoutubeTutorials() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection('tutorial_videos').get();

    youtubeTutorials.assignAll(snapshot.docs.map((e) => e.data()).toList());
    isLoadingYoutubeTutorials.value = false;
  }

  getYoutubeThumbnail(String url) {
    final Uri? uri = Uri.tryParse(url);
    if (uri == null) {
      return null;
    }

    return 'https://img.youtube.com/vi/${uri.queryParameters['v']}/0.jpg';
  }
}
