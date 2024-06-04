import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendor_app/Views/Home/User/User_Profile/Update_User_Profile/update_user_profile_model.dart';
import '../../../../../services/exception.dart';

class UpdateUserFormService {
  Dio _dio = Dio();
  List<UpdateUserProfileModel> updateUserProfileModel = [];
  Future<void> postUserProfileFormData({
    required final name,
    required final phone,
    required final email,
    required final city,
    required final area,
    required final address,
    required final profileImg,
    required BuildContext context,
  }) async {
    print("#############${name.toString()}");
    print("#############${email.toString()}");
    print("#############${address.toString()}");
    print("#############${area.toString()}");
    print("#############${city.toString()}");
    print("#############${profileImg.toString()}");

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
        MapEntry('name', name.toString()),
        MapEntry('email', email.toString()),
        MapEntry('phone', phone.toString()),
        MapEntry('city', city.toString()),
        MapEntry('area', area.toString()),
        MapEntry('address', address.toString()),
      ]);

      profileImg == null
          ? formData.files.add(MapEntry(
              'image',
              await MultipartFile.fromFile(
                profileImg.path,
                filename: profileImg.path.split('/').last,
              ),
            ))
          : SizedBox();

      response = await _dio.post(
          'https://learnunstoppable.com/homepro-connect/home-pro/public/api/v1/customer/update-profile',
          data: formData, onSendProgress: (startValue, endValue) {
        double multiPValue = startValue / endValue;
        double percentData = multiPValue * 1;
        double showPercent = multiPValue * 100;
        int roundedInt = showPercent.round();
        double roundedDouble = roundedInt.toDouble();
        print('Sending progress: ${roundedDouble}');
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
        updateUserProfileModel.add(UpdateUserProfileModel.fromJson(map));
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(updateUserProfileModel[0].message.toString()),
            duration: Duration(seconds: 5),
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
