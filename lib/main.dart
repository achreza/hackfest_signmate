import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:hackfest_signmate/constant.dart';

import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth auth = FirebaseAuth.instance;
  var page = '';

  auth.authStateChanges().listen((User? user) {
    if (user == null) {
      page = AppPages.INITIAL;
      print('User is currently signed out!');
    } else {
      page = AppPages.routes[0].name;
      print('User is signed in!');
    }
    print(page);
  });
  runApp(ScreenUtilInit(
      designSize: Size(394, 916),
      builder: (context, child) {
        return GetMaterialApp(
          theme: themeData,
          debugShowCheckedModeBanner: false,
          title: "Application",
          initialRoute: page,
          getPages: AppPages.routes,
        );
      }));
}
