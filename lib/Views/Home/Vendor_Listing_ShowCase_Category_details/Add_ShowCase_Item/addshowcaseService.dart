import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../services/exception.dart';
import 'addShowcaseModel.dart';

class AddShowCaseFormService {
  Dio _dio = Dio();
  List<AddVendorShowCaseModel> list = [];
  Future<void> addShowCaseForm(
    final productTitle,
    final productDescription,
    final categoryID,
    final List<File>? images,
    BuildContext context,
  ) async {
    SharedPreferences sharedP = await SharedPreferences.getInstance();
    String? userToken = sharedP.getString('userToken');

    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      error: true,
      request: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));

    Response response;

    try {
      FormData formData = FormData();

      formData.fields.addAll([
        MapEntry('name', productTitle.toString()),
        MapEntry('description', productDescription.toString()),
        MapEntry('sub_category_id', categoryID.toString()),
      ]);

      if (images != null && images.isNotEmpty) {
        for (int i = 0; i < images.length; i++) {
          File imageFile = images[i];
          formData.files.add(MapEntry(
            'image[]',
            await MultipartFile.fromFile(
              imageFile.path,
              filename: imageFile.path.split('/').last,
            ),
          ));
        }
      }

      response = await _dio.post(
          'https://learnunstoppable.com/homepro-connect/home-pro/public/api/v1/vendor/showcase/store',
          data: formData, onSendProgress: (startValue, endValue) {
        double multiPValue = startValue / endValue;
        double percentData = multiPValue * 1;
        double showPercent = multiPValue * 100;
      },
          options: Options(
            responseType: ResponseType.json,
            headers: {
              "Accept": "application/json",
              "Authorization": "Bearer $userToken"
            },
          ));

      if (response.statusCode == 200) {
        Map<String, dynamic> map = jsonDecode(response.toString());
        list.add(AddVendorShowCaseModel.fromJson(map));
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(list[0].message.toString()),
            duration: Duration(seconds: 2),
          ),
        );

        print("===uploaded===");
      } else {
        Navigator.pop(context);
        print("===This is Else=== ");
      }
    } on DioError catch (exception) {
      Navigator.pop(context);
      String content = exception.response.toString();
      print(' Dio error login method api service3 ${DateTime.now().second}');
      print("This is dio error response ${content.toString()}");
      throw RemoteException(dioError: exception);
    }
  }
}
