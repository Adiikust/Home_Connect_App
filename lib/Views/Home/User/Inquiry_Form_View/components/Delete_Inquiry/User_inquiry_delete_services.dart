import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/services/apis_services.dart';
import 'package:vendor_app/services/network_client.dart';
import 'User_inquiry_delete_model.dart';

class UserInquiryDeleteServices {
  late ApiService apiService =
      ApiService(networkClient: Get.put(NetworkClient()));
  List<DeleteUserInquiryModel> list = [];
  Future<List<DeleteUserInquiryModel>> deleteUserInquiryData(
      {required BuildContext context}) async {
    print("this is UserInquiryDeleteServices ");
    final response = await apiService.deleteUserInquiryData();
    String content = response.toString();
    print(content.toString());
    print("this is UserInquiryDeleteServices ");
    Map<String, dynamic> map = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      print("this is UserInquiryDeleteServices ");

      print("APi Response");
      list.add(DeleteUserInquiryModel.fromJson(map));

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(list[0].message.toString()),
        ),
      );
      Navigator.pop(context);

      /// print Response Api
      print(response.toString());
    } else {
      Navigator.pop(context);
      print("Error");
    }
    return list;
  }
}
