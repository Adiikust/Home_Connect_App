import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../services/exception.dart';
import 'editListingModel.dart';

class EditListingFormService {
  Dio _dio = Dio();
  List<EditListingModel> editListingModel = [];
  Future<void> editListingFormData({
    required final id,
    required final productPrice,
    required final productTitle,
    required final productDescription,
    required final productSubCategoryID,
    required final List<File> images,
    required BuildContext context,
  }) async {
    print("#############${id.toString()}");
    print("#############${productPrice.toString()}");
    print("#############${productTitle.toString()}");
    print("#############${productDescription.toString()}");
    print("#############${productSubCategoryID.toString()}");
    print("#############${images.toString()}");

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
        MapEntry('id', id.toString()),
        MapEntry('price', productPrice.toString()),
        MapEntry('name', productTitle.toString()),
        MapEntry('description', productDescription.toString()),
        MapEntry('sub_category_id', productSubCategoryID.toString()),
      ]);

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

      response = await _dio.post(
          'https://learnunstoppable.com/homepro-connect/home-pro/public/api/v1/vendor/product/update',
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
        print("#############%%%%%%%%%%%%%%%%%%%%${response.statusCode}");
        Map<String, dynamic> map = jsonDecode(response.toString());
        editListingModel.add(EditListingModel.fromJson(map));
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(editListingModel[0].message.toString()),
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
