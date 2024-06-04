import 'dart:convert';
import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Home/User/Listing_ShowCase_User/ShowCase_Vendor/userShowcaseModel.dart';
import 'package:vendor_app/services/apis_services.dart';
import 'package:vendor_app/services/network_client.dart';

class UserShowCaseService {
  late ApiService apiService =
      ApiService(networkClient: Get.put(NetworkClient()));
  List<UserShowCaseModel> list = [];
  Future<List<UserShowCaseModel>> browse() async {
    print("this is srvice ");
    final response = await apiService.getUserShowCaseData();
    // String content = response.toString();
    print("this is srvice ");
    Map<String, dynamic> map = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      print("this is srvice ");

      print("APi Response");
      list.add(UserShowCaseModel.fromJson(map));

      /// print Response Api
      print(response.toString());
    } else {
      print("Error");
    }

    return list;
  }
}
