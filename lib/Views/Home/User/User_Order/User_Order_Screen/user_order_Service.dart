import 'dart:convert';
import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Home/User/User_Order/User_Order_Screen/user_order_Model.dart';
import 'package:vendor_app/services/apis_services.dart';
import 'package:vendor_app/services/network_client.dart';

class UserOrderService {
  late ApiService apiService =
      ApiService(networkClient: Get.put(NetworkClient()));
  List<UserOrderDataModel> list = [];
  Future<List<UserOrderDataModel>> browse() async {
    print("this is UserOrderService ");
    final response = await apiService.getUserOrderData();
    print("this is UserOrderService ");
    Map<String, dynamic> map = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      print("this is UserOrderService ");

      print("APi Response");
      list.add(UserOrderDataModel.fromJson(map));

      /// print Response Api
      print(response.toString());
    } else {
      print("Error");
    }

    return list;
  }
}
