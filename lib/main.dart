import 'package:camera/camera.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:hackfest_signmate/constant.dart';

import 'app/routes/app_pages.dart';
import 'firebase_options.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';

List<CameraDescription> cameras = [];
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth auth = FirebaseAuth.instance;
  var page = '';

  auth.authStateChanges().listen((User? user) {
    if (user == null) {
      page = AppPages.INITIAL;
    } else {
      page = AppPages.routes[0].name;
    }
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
