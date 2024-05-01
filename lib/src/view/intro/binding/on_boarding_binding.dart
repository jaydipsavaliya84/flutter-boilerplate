// Simplifies Bindings generation from a single callback.

import 'package:flutter_boiler_plate/src/view/intro/controller/on_boarding_controller.dart';
import 'package:get/get.dart';

class OnBoardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBoardingController>(
      () => OnBoardingController(),
    );
  }
}
