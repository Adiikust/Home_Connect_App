import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../services/exception.dart';
import '../../../AppLayer/Overseer.dart';
import 'admin_login_model.dart';

class AdminAuthService extends ChangeNotifier {
  Dio _dio = Dio();
  List<AdminLoginModel> adminLoginModel = [];
  Future<void> postAdminLoginFormData({
    required final phone,
    required final password,
    required BuildContext context,
  }) async {
    print("#############${phone.toString()}");
    print("#############${password.toString()}");

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
        MapEntry('phone', phone.toString()),
        MapEntry('password', password.toString()),
      ]);

      response = await _dio.post(
          'https://learnunstoppable.com/homepro-connect/home-pro/public/api/v1/auth/admin/login',
          data: formData, onSendProgress: (startValue, endValue) {
        double multiPValue = startValue / endValue;
        double percentData = multiPValue * 1;
        double showPercent = multiPValue * 100;
        int roundedInt = showPercent.round();
        double roundedDouble = roundedInt.toDouble();
        print('Sending progress: ${roundedDouble}');
        notifyListeners();
      },
          options: Options(
            responseType: ResponseType.json,
            // headers: {
            //   "Accept": "application/json",
            //   "Authorization": "Bearer $userToken"
            // },
          ));

      if (response.statusCode == 200) {
        print("#############%%%%%%%%%%%%%%%%%%%%${response.statusCode}");

        Map<String, dynamic> map = jsonDecode(response.toString());

        SharedPreferences sharedP = await SharedPreferences.getInstance();
        sharedP.setString('userToken', map['token']);
        String? userToken = sharedP.getString('userToken');

        adminLoginModel.add(AdminLoginModel.fromJson(map));

        print(adminLoginModel[0].role.toString());
        Overseer.userLoginType = adminLoginModel[0].role.toString();

        print("^^^^^^^^^^^^^^^^^^^^^Role^^^^^^^^^^^^^^^^^^^^");

        SharedPreferences sharedR = await SharedPreferences.getInstance();
        sharedR.setString('userRole', map['role']);
        sharedR.setString('userImg', adminLoginModel[0].user!.image.toString());
        sharedR.setString(
            'userFName', adminLoginModel[0].user!.fName.toString());
        sharedR.setString(
            'userLName', adminLoginModel[0].user!.lName.toString());
        sharedR.setString(
            'userEmail', adminLoginModel[0].user!.email.toString());
        sharedR.setString(
            'userPhone', adminLoginModel[0].user!.phone.toString());

        Overseer.adminProfileImg = sharedR.getString('userImg')!;
        Overseer.adminProfileFName = sharedR.getString('userFName')!;
        Overseer.adminProfileLName = sharedR.getString('userLName')!;
        Overseer.adminProfileEmail = sharedR.getString('userEmail')!;
        Overseer.adminProfilePhone = sharedR.getString('userPhone')!;

        String? userRole = sharedR.getString('userRole');

        print("User token $userRole");
        print("login token $userToken");

        Navigator.pop(context);
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(adminLoginModel[0].message.toString()),
            duration: Duration(seconds: 2),
          ),
        );

        print("=== Admin Login form submit===");
      } else {
        Navigator.pop(context);
        print("===This is Else=== ");
      }
    } on DioError catch (exception) {
      Navigator.pop(context);
      String content = exception.response.toString();
      Map<String, dynamic> responseJson = jsonDecode(content);
      String message = responseJson['message'];
      print(' Dio error login method api service3 ${DateTime.now().second}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message.toString()),
          duration: Duration(seconds: 2),
        ),
      );
      print("This is dio error response ${content.toString()}");
      throw RemoteException(dioError: exception);
    }
  }
}
