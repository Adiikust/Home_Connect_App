import 'dart:convert';

import 'package:get/get.dart';
import 'package:vendor_app/Views/Home/User/Inquiry_Form_View/user_Inquiry_form_view_model.dart';
import 'package:vendor_app/services/apis_services.dart';
import 'package:vendor_app/services/network_client.dart';

class UserInquiryFormViewService {
  late ApiService apiService =
      ApiService(networkClient: Get.put(NetworkClient()));
  List<UserInquiryFormViewModel> list = [];
  Future<List<UserInquiryFormViewModel>> browse() async {
    print("this is UserInquiryFormViewService ");
    final response = await apiService.getUserInquiryData();
    print("this is UserInquiryFormViewService ");
    Map<String, dynamic> map = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      print("this is ${response.statusCode} UserInquiryFormViewService");
      print("APi Response");
      list.add(UserInquiryFormViewModel.fromJson(map));

      /// print Response Api
      print(response.toString());
    } else {
      print("Error");
    }

    return list;
  }
}
