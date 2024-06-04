import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../services/exception.dart';
import 'inquiry_form_model.dart';

class InquiryFormService extends ChangeNotifier {
  double percentage = 0.0;
  Dio _dio = Dio();
  List<InquiryFormModel> inquiryFormModel = [];
  Future<void> postInquiryFormData({
    required final categoryId,
    required final subCategoryId,
    required final List<String> vendorTypeId,
    required final name,
    required final phone,
    required final email,
    required final city,
    required final area,
    required final List<String> choiceIds,
    required final latitude,
    required final long,
    required final List<File> images,
    required final List<File> videos,
    required BuildContext context,
  }) async {
    print("#############${categoryId.toString()}");
    print("#############${subCategoryId.toString()}");
    print("#############${vendorTypeId.toString()}");
    print("#############${choiceIds.toString()}");
    print("#############${images.toString()}");
    print("#############${videos.toString()}");

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
        MapEntry('category_id', categoryId.toString()),
        MapEntry('sub_category_id', subCategoryId.toString()),
        MapEntry('vendor_type_id', vendorTypeId.toString()),
        MapEntry('name', name.toString()),
        MapEntry('phone', phone.toString()),
        MapEntry('email', email.toString()),
        MapEntry('city', city.toString()),
        MapEntry('area', area.toString()),
        MapEntry('choice_ids', choiceIds.toString()),
        MapEntry('latitude', latitude.toString()),
        MapEntry('long', long.toString()),
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

      for (int i = 0; i < videos.length; i++) {
        File videoFile = videos[i];
        formData.files.add(MapEntry(
          'video[]',
          await MultipartFile.fromFile(
            videoFile.path,
            filename: videoFile.path.split('/').last,
          ),
        ));
      }

      response = await _dio.post(
          'https://learnunstoppable.com/homepro-connect/home-pro/public/api/v1/customer/inquiry/submit',
          data: formData, onSendProgress: (startValue, endValue) {
        double multiPValue = startValue / endValue;
        double percentData = multiPValue * 1;
        double showPercent = multiPValue * 100;
        int roundedInt = showPercent.round();
        double roundedDouble = roundedInt.toDouble();
        percentage = roundedDouble;
        print('Sending progress: ${roundedDouble}');
        notifyListeners();
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
        inquiryFormModel.add(InquiryFormModel.fromJson(map));
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(inquiryFormModel[0].message.toString()),
            duration: Duration(seconds: 2),
          ),
        );

        print("=== Inquiry form submit===");
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
