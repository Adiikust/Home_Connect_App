import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Order/Vendor_Order_Progress_View/component/Vendor_Step_Delete/vendor_step_delete_model.dart';
import 'package:vendor_app/services/exception.dart';

class VendorStepsDeleteService extends ChangeNotifier {
  Dio _dio = Dio();
  List<VendorStepsDeleteModel> list = [];
  Future<void> deleteVendorStepsData({
    final inquiryId,
    final activityId,
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
        MapEntry('activity_id', activityId.toString()),
      ]);

      response = await _dio.post(
          'https://learnunstoppable.com/homepro-connect/home-pro/public/api/v1/vendor/order/delete_activity',
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
        list.add(VendorStepsDeleteModel.fromJson(map));
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(list[0].message.toString()),
            duration: Duration(seconds: 5),
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
