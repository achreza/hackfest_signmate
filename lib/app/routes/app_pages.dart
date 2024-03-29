import 'package:get/get.dart';

import 'package:hackfest_signmate/app/modules/maps/bindings/maps_binding.dart';
import 'package:hackfest_signmate/app/modules/maps/views/maps_view.dart';

import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/dictionary/bindings/dictionary_binding.dart';
import '../modules/dictionary/views/dictionary_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/interpreter/bindings/interpreter_binding.dart';
import '../modules/interpreter/views/interpreter_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/signmate/bindings/signmate_binding.dart';
import '../modules/signmate/views/signmate_view.dart';
import '../modules/signscan/bindings/signscan_binding.dart';
import '../modules/signscan/views/signscan_view.dart';
import '../modules/speech/bindings/speech_binding.dart';
import '../modules/speech/views/speech_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();


  static const INITIAL = Routes.SPLASH;


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
    GetPage(
      name: _Paths.SPEECH,
      page: () => const SpeechView(),
      binding: SpeechBinding(),
    ),
    GetPage(
      name: _Paths.DICTIONARY,
      page: () => const DictionaryView(),
      binding: DictionaryBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNMATE,
      page: () => const SignmateView(),
      binding: SignmateBinding(),
    ),
    GetPage(
      name: _Paths.INTERPRETER,
      page: () => const InterpreterView(),
      binding: InterpreterBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.MAPS,
      page: () => MapsView(),
      binding: MapsBinding(),
    ),
  ];
}
