//Holds the state of the application and provides an API to access/filter/manipulate that data.
// Its concern is data encapsulation and management.
// It contains logic to structure, validate or compare different pieces of data that we call Domain Logic.
// Model File : A perfect tool to make Models easily.
// https://app.quicktype.io/

import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/global/constants/app_asset.dart';
import 'package:flutter_boiler_plate/src/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingController extends GetxController {
  var pageDecoration = const PageDecoration(
    titleTextStyle: TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
    ),
    bodyTextStyle: TextStyle(fontSize: 19.0),
    bodyPadding: EdgeInsets.fromLTRB(
      16.0,
      0.0,
      16.0,
      16.0,
    ),
    pageColor: Colors.white,
    imagePadding: EdgeInsets.zero,
  );

  final introKey = GlobalKey<IntroductionScreenState>();

  void onIntroEnd(context) {
    Get.offAllNamed(
      Routes.HOME_SCREEN,
    );
  }

  Widget buildFullscreenImage() {
    return Image.asset(
      AppAsset.img4,
      fit: BoxFit.fill,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget buildImage(String assetName, [double width = 350]) {
    return Image.asset(
      assetName,
      width: width,
    );
  }
}
