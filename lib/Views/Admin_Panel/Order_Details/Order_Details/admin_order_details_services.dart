import 'dart:convert';
import 'package:get/get.dart';
import 'package:vendor_app/services/apis_services.dart';
import 'package:vendor_app/services/network_client.dart';
import 'admin_order_details_model.dart';

class AdminOrderDetailsService {
  late ApiService apiService =
      ApiService(networkClient: Get.put(NetworkClient()));
  List<AdminOrderDetailsModel> list = [];
  Future<List<AdminOrderDetailsModel>> browse() async {
    print("this is AdminOrderDetailsService ");
    final response = await apiService.getAdminOrderDetailsData();
    print("this is AdminOrderDetailsService ");
    Map<String, dynamic> map = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      print("this is ${response.statusCode} AdminOrderDetailsService");
      print("APi Response");
      list.add(AdminOrderDetailsModel.fromJson(map));

      /// print Response Api
      print(response.toString());
    } else {
      print("Error");
    }

    return list;
  }
}
