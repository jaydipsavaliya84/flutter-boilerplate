// Common TextField

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boiler_plate/global/constants/app_color.dart';

Widget commonTextField({
  TextEditingController? controller,
  String? hintText,
  String? labelText,
  String? counterText,
  bool needValidation = false,
  bool? urlValidation = false,
  String? validationMessage,
  double? horizontal,
  iconButton,
  double? vertical,
  double? lcPadding,
  double? tcPadding,
  double? rcPadding,
  double? bcPadding,
  bool readyOnly = false,
  Function? onPressed,
  bool hintTextBold = false,
  bool showBfBorder = true,
  bool showBeBorder = true,
  bool titleTextBold = false,
  bool labelTextBold = false,
  bool fillColor = false,
  bool textAlign = false,
  bool showNumber = false,
  double? hintFontSize,
  double? labelFontSize,
  double? textSize,
  Color? fbColor,
  Color? ebColor,
  Color? hintTextColor,
  Color? labelTextColor,
  Color? textColor,
  int? maxLength,
  int? maxLines,
  List<TextInputFormatter>? inputFormatters,
  TextInputType? keyBoardTypeEnter,
  bool? isPassWordValidation = false,
  bool obscureText = false,
  Function(String?)? onChangedValue,
  TextInputAction? textInputAction,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: horizontal ?? 5,
      vertical: vertical ?? 5,
    ),
    child: TextFormField(
      onChanged: onChangedValue,
      obscureText: obscureText,
      controller: controller,
      keyboardType: showNumber ? TextInputType.number : TextInputType.text,
      textAlign: textAlign ? TextAlign.right : TextAlign.start,
      textInputAction: textInputAction ?? TextInputAction.done,
      style: TextStyle(
        color: textColor ?? AppColor.grey,
        fontWeight: titleTextBold ? FontWeight.bold : FontWeight.normal,
        fontSize: textSize ?? 16,
      ),
      maxLines: maxLines,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(
          left: lcPadding ?? 0,
          top: tcPadding ?? 0,
          right: rcPadding ?? 0,
          bottom: bcPadding ?? 0,
        ),
        fillColor: fillColor ? AppColor.transparent : AppColor.grey,
        focusedBorder: showBfBorder
            ? OutlineInputBorder(
                borderSide: BorderSide(
                  color: fbColor ?? AppColor.grey,
                ),
              )
            : UnderlineInputBorder(
                borderSide: BorderSide(
                  color: fbColor ?? AppColor.grey,
                ),
              ),
        enabledBorder: showBeBorder
            ? OutlineInputBorder(
                borderSide: BorderSide(
                  color: fbColor ?? AppColor.grey,
                ),
              )
            : UnderlineInputBorder(
                borderSide: BorderSide(
                  color: fbColor ?? AppColor.grey,
                ),
              ),
        counterText: counterText == "" ? null : "",
        filled: true,
        suffixIcon: iconButton,
        labelText: labelText,
        labelStyle: TextStyle(
          color: labelTextColor ?? AppColor.grey,
          fontWeight: labelTextBold ? FontWeight.bold : FontWeight.normal,
          fontSize: labelFontSize ?? 16,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintTextColor ?? AppColor.grey,
          fontWeight: hintTextBold ? FontWeight.bold : FontWeight.normal,
          fontSize: hintFontSize ?? 16,
        ),
        border: const OutlineInputBorder(),
      ),
      inputFormatters: inputFormatters ?? [],
      onTap: onPressed as void Function()?,
      maxLength: maxLength,
      readOnly: readyOnly,
      validator: needValidation
          ? isPassWordValidation!
              ? (value) {
                  if (value!.isEmpty) {
                    return '$validationMessage is Required !';
                  } else if (value.length < 8) {
                    return 'Your password is short !';
                  } else if (!RegExp(
                          r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
                      .hasMatch(value)) {
                    return 'Your password not contain rules!';
                  }
                  return null;
                }
              : urlValidation!
                  ? (value) {
                      if (value!.isEmpty) {
                        return '$validationMessage is Required !';
                      } else if (!RegExp(
                              r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+')
                          .hasMatch(value)) {
                        return 'Please enter valid URL';
                      }
                      return null;
                    }
                  : (value) {
                      if (value!.isEmpty) {
                        return "$validationMessage is Required !";
                      } else {
                        return null;
                      }
                    }
          : null,
    ),
  );
}
