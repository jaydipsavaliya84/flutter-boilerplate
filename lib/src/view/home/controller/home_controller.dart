//Holds the state of the application and provides an API to access/filter/manipulate that data.
// Its concern is data encapsulation and management.
// It contains logic to structure, validate or compare different pieces of data that we call Domain Logic.
// Model File : A perfect tool to make Models easily.
// https://app.quicktype.io/

import 'package:flutter_boiler_plate/global/utils/services/debug.dart';
import 'package:flutter_boiler_plate/global/utils/services/end_point.dart';
import 'package:flutter_boiler_plate/global/utils/services/network_http.dart';
import 'package:flutter_boiler_plate/global/widgets/loading_dialog.dart';
import 'package:flutter_boiler_plate/global/widgets/snackbar.dart';
import 'package:flutter_boiler_plate/src/models/get_user_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final Rx<GetUserModel> getUserModel = GetUserModel().obs;

  @override
  void onInit() {
    super.onInit();

    Future.delayed(
      Duration.zero,
      () {
        getHomeAPI();
      },
    );
  }

  getHomeAPI() async {
    try {
      showLoadingDialog();
      await HttpHandler.getHttpMethod(
        url: APIEndPoint.randomUser,
        successCallBack: (statusCode, response) {
          hideLoadingDialog();
          getUserModel.value = GetUserModel.fromJson(response);

          CommonSnackBar.success(
            message: "Success",
          );
          devLog(
            "response Success",
          );
        },
        failureCallBack: (statusCode, response) {
          hideLoadingDialog();
          CommonSnackBar.success(
            message: "Success",
          );
          devLog(
            "response Error  $response",
          );
        },
      );
    } catch (e, s) {
      devLog(
        "try catch Error -- $e  $s",
      );
      hideLoadingDialog();
      CommonSnackBar.error(
        message: "Error",
      );
    }
  }

  Future<void> refreshData() async {
    getHomeAPI();
  }
}
