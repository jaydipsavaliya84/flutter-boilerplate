// Views are all the Widgets and Pages within the Flutter Application.
// These views may contain a “view controller” themselves,
// But that is still considered part of the view application tier.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/global/constants/app_asset.dart';
import 'package:flutter_boiler_plate/src/view/intro/controller/on_boarding_controller.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingView extends GetWidget<OnBoardingController> {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(
      init: OnBoardingController(),
      builder: (controller) {
        return IntroductionScreen(
          key: controller.introKey,
          globalBackgroundColor: Colors.white,
          allowImplicitScrolling: true,
          autoScrollDuration: 3000,
          infiniteAutoScroll: true,
          globalHeader: Align(
            alignment: Alignment.topRight,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  right: 16,
                ),
                child: controller.buildImage(
                  AppAsset.img3,
                  100,
                ),
              ),
            ),
          ),
          globalFooter: Container(
            margin: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 16,
            ),
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              child: const Text(
                'Let\'s go right away!',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () => controller.onIntroEnd(context),
            ),
          ),
          pages: [
            PageViewModel(
              title: "Fractional shares",
              body:
                  "Instead of having to buy an entire share, invest any amount you want.",
              image: controller.buildImage(
                AppAsset.img1,
              ),
              decoration: controller.pageDecoration,
            ),
            PageViewModel(
              title: "Learn as you go",
              body:
                  "Download the Stockpile app and master the market with our mini-lesson.",
              image: controller.buildImage(
                AppAsset.img2,
              ),
              decoration: controller.pageDecoration,
            ),
            PageViewModel(
              title: "Kids and teens",
              body:
                  "Kids and teens can track their stocks 24/7 and place trades that you approve.",
              image: controller.buildImage(
                AppAsset.img3,
              ),
              decoration: controller.pageDecoration,
            ),
            PageViewModel(
              title: "Full Screen Page",
              body:
                  "Pages can be full screen as well.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id euismod lectus, non tempor felis. Nam rutrum rhoncus est ac venenatis.",
              image: controller.buildFullscreenImage(),
              decoration: controller.pageDecoration.copyWith(
                contentMargin: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                fullScreen: true,
                bodyFlex: 2,
                imageFlex: 3,
                safeArea: 100,
              ),
            ),
            PageViewModel(
              title: "Another title page",
              body: "Another beautiful body text for this example onboarding",
              image: controller.buildImage(
                AppAsset.img2,
              ),
              footer: ElevatedButton(
                onPressed: () {
                  controller.introKey.currentState?.animateScroll(0);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'FooButton',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              decoration: controller.pageDecoration.copyWith(
                bodyFlex: 6,
                imageFlex: 6,
                safeArea: 80,
              ),
            ),
            PageViewModel(
              title: "Title of last page - reversed",
              bodyWidget: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Click on ",
                    style: TextStyle(
                      fontSize: 19.0,
                    ),
                  ),
                  Icon(
                    Icons.edit,
                  ),
                  Text(
                    " to edit a post",
                    style: TextStyle(
                      fontSize: 19.0,
                    ),
                  ),
                ],
              ),
              decoration: controller.pageDecoration.copyWith(
                bodyFlex: 2,
                imageFlex: 4,
                bodyAlignment: Alignment.bottomCenter,
                imageAlignment: Alignment.topCenter,
              ),
              image: controller.buildImage(
                AppAsset.img1,
              ),
              reverse: true,
            ),
          ],
          onDone: () => controller.onIntroEnd(context),
          onSkip: () => controller.onIntroEnd(context),
          // You can override onSkip callback
          showSkipButton: true,
          skipOrBackFlex: 0,
          nextFlex: 0,
          showBackButton: false,
          //rtl: true, // Display as right-to-left
          back: const Icon(
            Icons.arrow_back,
          ),
          skip: const Text(
            'Skip',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          next: const Icon(
            Icons.arrow_forward,
          ),
          done: const Text(
            'Done',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          curve: Curves.fastLinearToSlowEaseIn,
          controlsMargin: const EdgeInsets.all(16),
          controlsPadding: kIsWeb
              ? const EdgeInsets.all(12.0)
              : const EdgeInsets.fromLTRB(
                  8.0,
                  4.0,
                  8.0,
                  4.0,
                ),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            color: Color(0xFFBDBDBD),
            activeSize: Size(22.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(25.0),
              ),
            ),
          ),
          dotsContainerDecorator: const ShapeDecoration(
            color: Colors.black87,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
        );
      },
    );
  }
}
