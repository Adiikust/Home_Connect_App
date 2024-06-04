import 'dart:convert';
import 'package:vendor_app/Views/Home/User/Shopping/shopping_model.dart';
import 'package:vendor_app/services/apis_services.dart';
import 'package:vendor_app/services/network_client.dart';
import '../../../../Utils/Exports/all_exports.dart';

class ShoppingService {
  late ApiService apiService =
      ApiService(networkClient: Get.put(NetworkClient()));

  ///change model name
  List<ShoppingModel> list = [];

  Future<List<ShoppingModel>> browse() async {
    print("this is srvice ");
    final response = await apiService.getUserShoppingData();
    print("this is srvice ");
    Map<String, dynamic> map = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      print("this is srvice ");

      print("APi Response");
      list.add(ShoppingModel.fromJson(map));

      print(" Shopping Model Data ${response}");

      /// print Response Api
      print(response.toString());
    } else {}

    return list;
  }
}
