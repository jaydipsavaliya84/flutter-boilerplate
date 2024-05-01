//The controller layer is represented by various Commands which contain the Application Logic of the app.
// Commands are used to complete any significant action within your app.

import 'dart:async';
import 'package:flutter_boiler_plate/global/utils/share_preference/local_storage.dart';
import 'package:flutter_boiler_plate/global/utils/share_preference/shared_preference_services.dart';
import 'package:flutter_boiler_plate/src/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(
      const Duration(
        seconds: 2,
      ),
      () async {
        bool? isLogin = await getDataFromLocalStorage(
          dataType: LocalStorage.boolType,
          prefKey: LocalStorage.isLogin,
        );

        if (isLogin == true) {
          Get.offAllNamed(
            Routes.HOME_SCREEN,
          );
        } else {
          Get.offAllNamed(
            Routes.ON_BOARDING_SCREEN,
          );
        }
      },
    );
  }
}
