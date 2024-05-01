import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/global/constants/app_asset.dart';
import 'package:get/get.dart';

void showLoadingDialog() {
  Get.dialog(
    Center(
      child: Material(
        color: Colors.transparent,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 86,
              width: 86,
              padding: const EdgeInsets.all(17),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const CircularProgressIndicator(
                strokeWidth: 1.3,
                color: Colors.white,
                valueColor: AlwaysStoppedAnimation(
                  Colors.white,
                ),
              ),
            ),
            Image.asset(
              AppAsset.logo,
              height: 38,
              width: 38,
            ),
          ],
        ),
      ),
    ),
    barrierDismissible: false,
  );
}

void hideLoadingDialog() {
  Get.back();
}
