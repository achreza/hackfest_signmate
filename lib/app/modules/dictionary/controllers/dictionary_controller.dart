import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class DictionaryController extends GetxController {
  //TODO: Implement DictionaryController
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final count = 0.obs;
  final List youtubeTutorials = [].obs;
  final isLoadingYoutubeTutorials = true.obs;
  final List handsignAlphabet = [].obs;

  @override
  void onInit() {
    super.onInit();
    getYoutubeTutorials();
    getAlphabet();
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

  getAlphabet() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection('handsign_alphabet').get();

    handsignAlphabet.assignAll(snapshot.docs.map((e) => e.data()).toList());
    handsignAlphabet.sort((a, b) => a['label'].compareTo(b['label']));
  }

  insertAlphabetImage() async {
    //loop a to z
    // for (var i = 71; i <= 90; i++) {
    //   var letter = String.fromCharCode(i);
    //   var ext = '';
    //   if (i == 74 || i == 90) {
    //     ext = '.png';
    //   } else if (i == 71) {
    //     ext = '.jpeg';
    //   } else {
    //     ext = '.jpg';
    //   }
    //   final ref =
    //       FirebaseStorage.instance.ref().child('ASL_HANDSIGN/${letter + ext}');

    //   // Get the download URL of the file
    //   final downloadUrl = await ref.getDownloadURL();

    //   await firestore
    //       .collection('handsign_alphabet')
    //       .add({'label': letter, 'image': downloadUrl}).then(
    //           (value) => print('Alphabet ${letter} Added'));
    //   print(downloadUrl);
    // }
    // final storageRef = FirebaseStorage.instance.ref().child("ASL_HANDSIGN");
    // final listResult = await storageRef.listAll();
    // print(listResult);
    // for (var prefix in listResult.prefixes) {
    //   // print(prefix);
    // }
    // for (var item in listResult.items) {
    //   // print(item);
    // }
  }
}
