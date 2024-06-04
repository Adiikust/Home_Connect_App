import 'dart:convert';
import 'package:get/get.dart';
import '../../../../../services/apis_services.dart';
import '../../../../../services/network_client.dart';
import 'admin_vendor_type_model.dart';

class AdminVendorTypeService {
  late ApiService apiService =
      ApiService(networkClient: Get.put(NetworkClient()));
  List<AdminVendorTypeModel> list = [];
  Future<List<AdminVendorTypeModel>> browse() async {
    print("this is AdminVendorTypeService ");
    final response = await apiService.getAdminVendorTypeData();
    print("this is AdminVendorTypeService ");
    Map<String, dynamic> map = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      print("this is ${response.statusCode} AdminVendorTypeService");
      print("APi Response");
      list.add(AdminVendorTypeModel.fromJson(map));

      /// print Response Api
      print(response.toString());
    } else {
      print("Error");
    }

    return list;
  }
}
