import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendor_app/services/exception.dart';
import '../Utils/Colors/app_color.dart';

class NetworkClient {
  Dio _dio = Dio();
  String baseUrl = 'https://learnunstoppable.com/homepro-connect/home-pro/public/';
  //https://mocki.io/
  NetworkClient() {
    BaseOptions baseOptions = BaseOptions(
      // receiveTimeout: 50000,
      // connectTimeout: 30000,
      baseUrl: baseUrl,
      maxRedirects: 2,
    );
    _dio = Dio(baseOptions);
    // adding logging interceptor.
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      error: true,
      request: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));
  }

  // for HTTP.GET Request.
  Future<Response> get(String url, Map<String, Object> params) async {
    SharedPreferences sharedP = await SharedPreferences.getInstance();

    String? userToken = sharedP.getString('userToken');
    Response response;
    try {
      response = await _dio.get(url,
          queryParameters: params,
          options: Options(responseType: ResponseType.json, headers: {
            // "Accept": "application/json",
            // "Content-Type": "application/json",
            "Authorization": "Bearer ${userToken}"
          }));
    } on DioError catch (exception) {
      throw RemoteException(dioError: exception);
    }
    return response;
  }

  // for HTTP.POST Request.
  Future<Response> post(String url, Map<String, Object> params) async {
    SharedPreferences sharedP = await SharedPreferences.getInstance();

    String? userToken = sharedP.getString('userToken');

    Response response;
    try {
      response = await _dio.post(url,
          data: params,
          options: Options(responseType: ResponseType.json, headers: {
            // "Accept": "application/json",
            // "Content-Type": "application/json",
            "Authorization": "Bearer $userToken"
          }));
      print("token${userToken}");
      // String? role =
      //     response.data.toString().split('role').last.substring(0, 8);
      // SharedPreferences shared = await SharedPreferences.getInstance();
      // String? roles = shared.get(role) as String;
      // print("role adnan $roles");
    } on DioError catch (exception) {
      String? message =
          exception.response?.data.toString().split('message:').last;
      print("adnan  ${message!}");
      Get.snackbar(
        "Error",
        backgroundColor: AppColors.kDArkBlackColor,
        "${message.toString()}",
        icon: const Icon(Icons.error_outline, color: Colors.white),
        snackPosition: SnackPosition.TOP,
      );

      throw RemoteException(dioError: exception);
    }
    return response;
  }

  // for HTTP.DELETE Request.
  Future<Response> delete(String url, Map<String, Object> params) async {
    SharedPreferences sharedP = await SharedPreferences.getInstance();
    String? userToken = sharedP.getString('userToken');
    Response response;
    try {
      response = await _dio.delete(url,
          data: params,
          options: Options(responseType: ResponseType.json, headers: {
            "Accept": "application/json",
            // "Content-Type": "application/json",
            // "Content-Type": "multipart/form-data",
            "Authorization": "Bearer $userToken"
          }));
    } on DioError catch (exception) {
      String content = exception.response.toString();
      print('login method api sevice3 ${DateTime.now().second}');
      throw RemoteException(dioError: exception);
    }
    return response;
  }

  // for HTTP.POST Request.
  Future<Response> forGotPassword(
      String url, Map<String, Object> params) async {
    Response response;

    try {
      response = await _dio.post(url,
          data: params,
          options: Options(responseType: ResponseType.json, headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
          }));
    } on DioError catch (exception) {
      throw RemoteException(dioError: exception);
    }
    return response;
  }

  // for HTTP.PATCH Request.
  Future<Response> patch(String url, Map<String, Object> params) async {
    Response response;
    try {
      response = await _dio.patch(url,
          data: params,
          options: Options(
            responseType: ResponseType.json,
          ));
    } on DioError catch (exception) {
      throw RemoteException(dioError: exception);
    }
    return response;
  }

  // for dwonload Request.
  Future<Response> download(String url, String pathName,
      void Function(int, int)? onReceiveProgress) async {
    Response response;
    try {
      response = await _dio.download(
        url,
        pathName,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioError catch (exception) {
      throw RemoteException(dioError: exception);
    }
    return response;
  }
}
