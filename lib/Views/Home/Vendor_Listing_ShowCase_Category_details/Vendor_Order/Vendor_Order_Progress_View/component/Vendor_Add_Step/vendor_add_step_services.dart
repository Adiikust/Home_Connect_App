import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Order/Vendor_Order_Progress_View/component/Vendor_Add_Step/vendor_add_step_model.dart';
import 'package:vendor_app/services/exception.dart';

class VendorAddStepFormService extends ChangeNotifier {
  double percentage = 0.0;
  Dio _dio = Dio();
  List<VendorAddStepModel> list = [];
  Future<void> postVendorAddStepData({
    required final inquiryId,
    required final userId,
    required final comment,
    required final List<File>? images,
    required final List<File>? videos,
    required final List<File>? audios,
    required BuildContext context,
  }) async {
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
        MapEntry('inquiry_id', inquiryId.toString()),
        MapEntry('user_id', userId.toString()),
        MapEntry('comment', comment.toString()),
      ]);

      for (int i = 0; i < images!.length; i++) {
        File imageFile = images[i];
        formData.files.add(
          MapEntry(
            'image[]',
            await MultipartFile.fromFile(
              imageFile.path,
              filename: imageFile.path.split('/').last,
            ),
          ),
        );
      }

      for (int i = 0; i < videos!.length; i++) {
        File videoFile = videos[i];
        formData.files.add(
          MapEntry(
            'video[]',
            await MultipartFile.fromFile(
              videoFile.path,
              filename: videoFile.path.split('/').last,
            ),
          ),
        );
      }

      for (int i = 0; i < audios!.length; i++) {
        File audiosFile = audios[i];
        formData.files.add(
          MapEntry(
            'audio[]',
            await MultipartFile.fromFile(
              audiosFile.path,
              filename: audiosFile.path.split('/').last,
            ),
          ),
        );
      }

      response = await _dio.post(
          'https://learnunstoppable.com/homepro-connect/home-pro/public/api/v1/vendor/order/submit_activity',
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
        Map<String, dynamic> map = jsonDecode(response.toString());
        list.add(VendorAddStepModel.fromJson(map));
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
