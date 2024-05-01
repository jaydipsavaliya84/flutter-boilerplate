// Views are all the Widgets and Pages within the Flutter Application.
// These views may contain a “view controller” themselves,
// But that is still considered part of the view application tier.

import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/global/constants/app_color.dart';
import 'package:flutter_boiler_plate/src/view/home/controller/home_controller.dart';
import 'package:flutter_boiler_plate/src/view/home/widgets/home_widgets.dart';
import 'package:get/get.dart';

class HomeView extends GetWidget<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Obx(
          () {
            return Scaffold(
              backgroundColor: AppColor.white,
              body: controller.getUserModel.value.results == null
                  ? const SizedBox()
                  : RefreshIndicator(
                      onRefresh: controller.refreshData,
                      color: AppColor.blue,
                      backgroundColor: AppColor.white,
                      child: ListView(
                        padding: const EdgeInsets.only(
                          top: 50,
                        ),
                        children: [
                          commonDataShowView(
                            title: "Name:",
                            description:
                                " ${controller.getUserModel.value.results![0].name!.title} ${controller.getUserModel.value.results![0].name!.first} ${controller.getUserModel.value.results![0].name!.last}",
                          ),
                          commonDataShowView(
                            title: "Email:",
                            description:
                                " ${controller.getUserModel.value.results![0].email}",
                          ),
                          commonDataShowView(
                            title: "Location:",
                            description:
                                " ${controller.getUserModel.value.results![0].location!.street!.number}, ${controller.getUserModel.value.results![0].location!.street!.name}, ${controller.getUserModel.value.results![0].location!.country}",
                          ),
                          commonDataShowView(
                            title: "Coordinates:",
                            description:
                                " ${controller.getUserModel.value.results![0].location!.coordinates!.longitude}, ${controller.getUserModel.value.results![0].location!.coordinates!.longitude}",
                          ),
                        ],
                      ),
                    ),
            );
          },
        );
      },
    );
  }
}
