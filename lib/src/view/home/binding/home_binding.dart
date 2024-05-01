// Simplifies Bindings generation from a single callback.

import 'package:flutter_boiler_plate/src/view/splash/controller/splash_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
  }
}
