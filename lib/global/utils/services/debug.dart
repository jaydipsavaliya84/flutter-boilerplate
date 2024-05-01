import 'package:flutter_boiler_plate/global/utils/services/app_config.dart';
import 'package:logger/logger.dart';

devLog(
  dynamic data, {
  String? type,
}) {
  if (BuildConfiguration.shared.environment == Environment.staging) {
    // print("$data");
    // log("$data");
    demo(
      data: data,
    );
  }
}

var logger = Logger(
  printer: PrettyPrinter(),
);

var loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);

void demo({
  String? type,
  dynamic data,
}) {
  /*
📕: error message
📙: warning message
📗: ok status message
📘: action message
📓: canceled status message
📔: Or anything you like and want to recognize immediately by color
  */

  if (type == null) {
    Logger(printer: SimplePrinter(colors: true)).t("📘 $data");
  } else if (type == "success") {
    Logger(printer: SimplePrinter(colors: true)).t("📗 $data");
  } else if (type == "error") {
    logger.e(
      'Error! Something bad happened',
      error: data,
    );
  } else if (type == "warning") {
    loggerNoStack.w(data);
  } else if (type == "info") {
    loggerNoStack.i(data);
  } else if (type == "text") {
    loggerNoStack.t(data);
  } else {
    // logger.d('Log message with 2 methods');
  }
}
