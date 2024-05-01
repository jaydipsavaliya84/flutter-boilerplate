// App Pages

import 'package:flutter_boiler_plate/src/view/home/binding/home_binding.dart';
import 'package:flutter_boiler_plate/src/view/home/view/home_view.dart';
import 'package:flutter_boiler_plate/src/view/intro/binding/on_boarding_binding.dart';
import 'package:flutter_boiler_plate/src/view/intro/view/on_boarding_view.dart';
import 'package:flutter_boiler_plate/src/view/splash/binding/splash_binding.dart';
import 'package:flutter_boiler_plate/src/view/splash/view/splash_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.HOME_SCREEN,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.ON_BOARDING_SCREEN,
      page: () => const OnBoardingView(),
      binding: OnBoardingBinding(),
      transition: Transition.cupertino,
    ),
  ];
}
