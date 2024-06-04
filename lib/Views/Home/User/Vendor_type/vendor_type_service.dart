import 'dart:convert';
import 'package:get/get.dart';
import 'package:vendor_app/Views/Home/User/Vendor_type/vendor_type_model.dart';
import 'package:vendor_app/services/apis_services.dart';
import '../../../../services/network_client.dart';

class VendorTypeService {
  late ApiService apiService =
      ApiService(networkClient: Get.put(NetworkClient()));
  List<VendorTypeModel> list = [];
  Future<List<VendorTypeModel>> browse() async {
    print("this is srvice ");
    final response = await apiService.getCategoriesVendorTypeData();
    // String content = response.toString();
    print("this is srvice ");
    Map<String, dynamic> map = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      print("this is srvice ");

      print("APi Response");
      list.add(VendorTypeModel.fromJson(map));

      print("img url ${response}");

      /// print Response Api
      print(response.toString());
    } else {}

    return list;
  }
}
