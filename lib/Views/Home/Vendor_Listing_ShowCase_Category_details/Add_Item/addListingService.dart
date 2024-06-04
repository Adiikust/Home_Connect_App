import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Add_Item/addListingModel.dart';
import '../../../../services/exception.dart';

class AddListingFormService {
  Dio _dio = Dio();
  List<AddVendorListingModel> list = [];
  Future<void> addListingForm(
    final subCategoryID,
    final productPrice,
    final productTitle,
    final productDescription,
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
        MapEntry('sub_category_id', subCategoryID.toString()),
        MapEntry('price', productPrice.toString()),
        MapEntry('name', productTitle.toString()),
        MapEntry('description', productDescription.toString()),
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
          'https://learnunstoppable.com/homepro-connect/home-pro/public/api/v1/vendor/product/store',
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
        list.add(AddVendorListingModel.fromJson(map));
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
