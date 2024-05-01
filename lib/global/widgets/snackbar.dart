import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/global/constants/app_color.dart';
import 'package:get/get.dart';

class CommonSnackBar {
  static void error({
    String? title,
    String? message,
    Duration? duration,
  }) {
    Get.snackbar(
      title ?? 'Error',
      message ?? '',
      margin: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      backgroundColor: AppColor.red,
      colorText: AppColor.white,
      animationDuration: duration ?? const Duration(seconds: 1),
      duration: duration ?? const Duration(seconds: 1),
    );
  }

  static void success({
    String? title,
    String? message,
    Duration? duration,
  }) {
    Get.snackbar(
      title ?? 'Success',
      message ?? '',
      margin: const EdgeInsets.all(16),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColor.green,
      colorText: AppColor.white,
      animationDuration: duration ?? const Duration(seconds: 1),
      duration: duration ?? const Duration(seconds: 1),
    );
  }
}
