// The best way to handle network requests in Flutter
// Applications frequently need to perform POST and GET and other HTTP requests.
// Flutter provides an http package that supports making HTTP requests.

// HTTP methods: GET, POST, PATCH, PUT, DELETE

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/global/utils/services/debug.dart';
import 'package:flutter_boiler_plate/global/utils/services/end_point.dart';
import 'package:flutter_boiler_plate/global/utils/share_preference/local_storage.dart';
import 'package:flutter_boiler_plate/global/utils/share_preference/shared_preference_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HttpHandler {
  static String baseURL = APIEndPoint.baseUrl;

  static Future<Map<String, String>> _getHeaders({
    String? manualToken,
  }) async {
    final String? token = await getDataFromLocalStorage(
      dataType: LocalStorage.stringType,
      prefKey: LocalStorage.token,
    );
    devLog("Token -- '$token'");
    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      if (token != "") 'x-access-token': "$token",
    };
  }

  /// For Use Multi File upload
  List imageList = [
    {
      "key": "<key>",
      "path": "<file path>",
    },
  ];

  static Future formDataMethod({
    required String url,
    Map<String, String>? body,
    String? apiMethod,
    List<Map<String, String>>? imageList,
    String? dynamicToken,
    required Function(int, dynamic) successCallBack,
    required Function(int, dynamic) failureCallBack,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString(
      LocalStorage.token,
    );
    var request = http.MultipartRequest(
      (apiMethod ?? "POST").toUpperCase(),
      Uri.parse(
        "$baseURL$url",
      ),
    );
    devLog("POST FORM DATA URL ----  $request");
    devLog("POST TOKEN DATA URL ----  $token");
    request.headers.addAll(
      {
        if (dynamicToken != null)
          'x-api-key': dynamicToken
        else if (token != null)
          'x-api-key': token,
        'Content-Type':
            'multipart/form-data; boundary=<calculated when request is sent>'
      },
    );

    devLog("FORM DATA BODY :-  $body");

    if (imageList != null) {
      for (var element in imageList) {
        request.files.add(
          await http.MultipartFile.fromPath(
              '${element['key']}', '${element['path']}'),
        );
      }
    }
    if (body != null) {
      request.fields.addAll(body);
    }
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    String responseString = String.fromCharCodes(responseData);
    devLog("RESPONSE = $responseString");
    devLog("RESPONSE CODE = ${response.statusCode}");

    formPathHandler(
      response: responseString,
      statusCode: response.statusCode,
      successCallBack: successCallBack,
      failureCallBack: failureCallBack,
    );
  }

  static Future getHttpMethod({
    @required String? url,
    String? manualToken,
    bool isMockUrl = false,
    required Function(int, dynamic) successCallBack,
    required Function(int, dynamic) failureCallBack,
  }) async {
    var header = await _getHeaders(manualToken: manualToken);

    devLog("Get URL -- '${isMockUrl ? "$url" : "$baseURL$url"}");
    http.Response response = await http.get(
      Uri.parse(isMockUrl ? "$url" : "$baseURL$url"),
      headers: header,
    );
    handler(
      response,
      successCallBack: successCallBack,
      failureCallBack: failureCallBack,
    );
  }

  static Future postHttpMethod({
    @required String? url,
    String? manualUrl,
    Map<String, dynamic>? data,
    bool isPassHeader = false,
    required Function(int, dynamic) successCallBack,
    required Function(int, dynamic) failureCallBack,
  }) async {
    var header = await _getHeaders();
    devLog("Post URL -- '${manualUrl ?? "$baseURL$url"}'");
    devLog("Post Data -- '$data'");
    http.Response response = await http.post(
      Uri.parse(manualUrl ?? "$baseURL$url"),
      headers: isPassHeader == true ? null : header,
      body: data == null ? null : jsonEncode(data),
    );
    handler(
      response,
      successCallBack: successCallBack,
      failureCallBack: failureCallBack,
    );
  }

  static Future patchHttpMethod({
    @required String? url,
    Map<String, dynamic>? data,
    required Function(int, dynamic) successCallBack,
    required Function(int, dynamic) failureCallBack,
  }) async {
    var header = await _getHeaders();
    devLog("Patch URL -- '$baseURL$url'");
    devLog("Patch Data -- '$data'");
    http.Response response = await http.patch(
      Uri.parse("$baseURL$url"),
      headers: header,
      body: data == null ? null : jsonEncode(data),
    );
    handler(
      response,
      successCallBack: successCallBack,
      failureCallBack: failureCallBack,
    );
  }

  static Future putHttpMethod({
    @required String? url,
    Map<String, dynamic>? data,
    required Function(int, dynamic) successCallBack,
    required Function(int, dynamic) failureCallBack,
  }) async {
    var header = await _getHeaders();
    devLog("Put URL -- '$baseURL$url'");
    devLog("Put Data -- '$data'");
    http.Response response = await http.put(
      Uri.parse("$baseURL$url"),
      headers: header,
      body: data == null ? null : jsonEncode(data),
    );
    handler(
      response,
      successCallBack: successCallBack,
      failureCallBack: failureCallBack,
    );
  }

  static Future deleteHttpMethod({
    @required String? url,
    required Function(int, dynamic) successCallBack,
    required Function(int, dynamic) failureCallBack,
  }) async {
    var header = await _getHeaders();
    devLog("Delete URL -- '$baseURL$url'");
    http.Response response =
        await http.delete(Uri.parse("$baseURL$url"), headers: header);
    handler(
      response,
      successCallBack: successCallBack,
      failureCallBack: failureCallBack,
    );
  }

  static handler(
    http.Response response, {
    required Function(int, dynamic) successCallBack,
    required Function(int, dynamic) failureCallBack,
  }) {
    devLog("""
    STATUS CODE: ${response.statusCode}
    RESPONSE: ${response.body}
    """, type: response.statusCode == 200 ? "success" : "error");
    switch (response.statusCode) {
      case 200:
        devLog("Status Code : '200'");
        successCallBack(
          response.statusCode,
          jsonDecode(response.body),
        );
        break;
      case 400:
        failureCallBack(
          response.statusCode,
          jsonDecode(response.body),
        );
        break;
      case 401:
        failureCallBack(
          response.statusCode,
          jsonDecode(response.body),
        );
        break;
      case 403:
        failureCallBack(
          response.statusCode,
          jsonDecode(response.body),
        );
        break;
      case 404:
        failureCallBack(
          response.statusCode,
          jsonDecode(response.body),
        );
        break;
      case 500:
        failureCallBack(
          response.statusCode,
          jsonDecode(response.body),
        );
        break;
      default:
        failureCallBack(
          response.statusCode,
          {"message": "Something Went Wrong"},
        );
    }
  }

  static formPathHandler({
    dynamic response,
    required int statusCode,
    required Function(int, dynamic) successCallBack,
    required Function(int, dynamic) failureCallBack,
  }) {
    devLog("""
    STATUS CODE : $statusCode
    RESPONSE : $response
    """, type: statusCode == 200 ? "success" : "error");
    switch (statusCode) {
      case 200:
        successCallBack(
          statusCode,
          jsonDecode(response),
        );
        break;
      case 400:
        failureCallBack(
          statusCode,
          jsonDecode(response),
        );
        break;
      case 401:
        failureCallBack(
          statusCode,
          jsonDecode(response),
        );
        break;
      case 403:
        failureCallBack(
          statusCode,
          jsonDecode(response),
        );
        break;
      case 404:
        failureCallBack(
          statusCode,
          jsonDecode(response),
        );
        break;
      case 500:
        failureCallBack(
          statusCode,
          jsonDecode(response),
        );
        break;
      default:
        failureCallBack(
          statusCode,
          {"message": "Something Went Wrong"},
        );
    }
  }
}
