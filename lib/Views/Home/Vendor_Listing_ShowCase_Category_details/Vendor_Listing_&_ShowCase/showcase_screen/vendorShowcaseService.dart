import 'dart:convert';

import 'package:get/get.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Listing_&_ShowCase/showcase_screen/vendorShowcaseModel.dart';
import 'package:vendor_app/services/apis_services.dart';
import 'package:vendor_app/services/network_client.dart';

class VendorShowCaseServices {
  late ApiService apiService =
      ApiService(networkClient: Get.put(NetworkClient()));
  List<VendorShowCaseModel> list = [];
  Future<List<VendorShowCaseModel>> browse() async {
    print("this is srvice ");
    final response = await apiService.getVendorShowCaseData();
    // String content = response.toString();
    print("this is srvice ");
    Map<String, dynamic> map = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      print("this is srvice ");

      print("APi Response");
      list.add(VendorShowCaseModel.fromJson(map));

      /// print Response Api
      print(response.toString());
    } else {
      print("Error");
    }

    return list;
  }
}
