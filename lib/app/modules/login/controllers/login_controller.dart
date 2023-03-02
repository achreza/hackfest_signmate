import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hackfest_signmate/app/routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController emailDaftar = TextEditingController();
  TextEditingController passwordDaftar = TextEditingController();
  TextEditingController emailLogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();

  final count = 0.obs;
  final showPasswordLogin = false.obs;
  final isProcessingRegister = false.obs;
  final isProcessingLogin = false.obs;

  @override
  void onInit() {
    super.onInit();
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

  void showPassword() => showPasswordLogin.value = !showPasswordLogin.value;

  login() async {
    isProcessingLogin.value = true;

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailLogin.text,
        password: passwordLogin.text,
      );
      User user = userCredential.user!;
      Get.snackbar('Login', 'Login in as ${user.email}');
      emailDaftar.clear();
      passwordDaftar.clear();
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Login', 'Wrong password provided for that user.');
      } else {
        Get.snackbar('Login', 'System Error ');
      }
    } finally {
      isProcessingLogin.value = false;
    }
  }

  loginGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth!.accessToken,
        idToken: googleAuth.idToken,
      );
      print(credential);
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User user = userCredential.user!;
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Login', 'Failed to sign in with Google: $e');
    } catch (e) {
      Get.snackbar('Login', 'Failed to sign in with Google: $e');
    }
  }

  loginFacebook() async {
    try {
      LoginResult accessToken = await FacebookAuth.instance.login();
      var token = accessToken.accessToken!.token;
      OAuthCredential credential = FacebookAuthProvider.credential(token);
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User user = userCredential.user!;
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        Get.snackbar(
            'Login', 'The account already exists with a different credential.');
      } else {
        Get.snackbar('Login', 'Failed to sign in with Facebook');
      }
    }
  }

  register() async {
    isProcessingRegister.value = true;
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: emailDaftar.text, password: passwordDaftar.text);
      print(userCredential);
      Get.snackbar('Register', 'Register Success');
      Get.offAllNamed(Routes.LOGIN);
      emailDaftar.clear();
      passwordDaftar.clear();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('Register', 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Register', 'The account already exists for that email.');
      }
    } catch (e) {
      Get.snackbar('Register', 'System Error');
    } finally {
      isProcessingRegister.value = false;
    }
  }

  logout() async {
    await _auth.signOut();
    Get.snackbar('Logout', 'Logout Success');
  }
}
