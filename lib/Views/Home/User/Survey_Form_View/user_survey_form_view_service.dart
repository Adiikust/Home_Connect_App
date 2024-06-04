import 'dart:convert';
import 'package:get/get.dart';
import 'package:vendor_app/Views/Home/User/Survey_Form_View/user_survey_form_view_model.dart';
import '../../../../services/apis_services.dart';
import '../../../../services/network_client.dart';

class UserSurveyFormViewService {
  late ApiService apiService =
      ApiService(networkClient: Get.put(NetworkClient()));
  List<UserSurveyFormViewModel> list = [];
  Future<List<UserSurveyFormViewModel>> browse() async {
    print("this is UserInquiryFormViewService ");
    final response = await apiService.getUserSurveyData();
    print("this is UserInquiryFormViewService ");
    Map<String, dynamic> map = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      print("this is ${response.statusCode} UserInquiryFormViewService");
      print("APi Response");
      list.add(UserSurveyFormViewModel.fromJson(map));

      /// print Response Api
      print(response.toString());
    } else {
      print("Error");
    }

    return list;
  }
}
