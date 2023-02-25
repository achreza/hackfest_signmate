import 'package:get/get.dart';

import 'package:hackfest_signmate/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:hackfest_signmate/app/modules/dashboard/views/dashboard_view.dart';
import 'package:hackfest_signmate/app/modules/home/bindings/home_binding.dart';
import 'package:hackfest_signmate/app/modules/home/views/home_view.dart';
import 'package:hackfest_signmate/app/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:hackfest_signmate/app/modules/onboarding/views/onboarding_view.dart';
import 'package:hackfest_signmate/app/modules/signscan/bindings/signscan_binding.dart';
import 'package:hackfest_signmate/app/modules/signscan/views/signscan_view.dart';
import 'package:hackfest_signmate/app/modules/splash/bindings/splash_binding.dart';
import 'package:hackfest_signmate/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.SIGNSCAN,
      page: () => SignscanView(),
      binding: SignscanBinding(),
    ),
  ];
}
