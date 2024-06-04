import 'dart:convert';
import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/services/apis_services.dart';
import 'package:vendor_app/services/network_client.dart';

import 'userListingModel.dart';

class UserListingService {
  late ApiService apiService =
      ApiService(networkClient: Get.put(NetworkClient()));
  List<UserListingModel> list = [];
  Future<List<UserListingModel>> browse() async {
    print("this is srvice ");
    final response = await apiService.getUserListingData();
    // String content = response.toString();
    print("this is srvice ");
    Map<String, dynamic> map = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      print("this is srvice ");

      print("APi Response");
      list.add(UserListingModel.fromJson(map));

      /// print Response Api
      print(response.toString());
    } else {
      print("Error");
    }

    return list;
  }
}
