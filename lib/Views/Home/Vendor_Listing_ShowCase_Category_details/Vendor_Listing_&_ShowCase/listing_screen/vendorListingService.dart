import 'dart:convert';
import 'package:get/get.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Listing_&_ShowCase/listing_screen/vendorListingModel.dart';
import 'package:vendor_app/services/apis_services.dart';
import 'package:vendor_app/services/network_client.dart';

class VendorListingSubCategoriesIdServices {
  late ApiService apiService =
      ApiService(networkClient: Get.put(NetworkClient()));
  List<VendorListingSubCategoriesIdModel> list = [];
  Future<List<VendorListingSubCategoriesIdModel>> browse() async {
    print("this is srvice ");
    final response = await apiService.getVendorSubCategoriesIdListingData();
    // String content = response.toString();
    print("this is srvice ");
    Map<String, dynamic> map = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      list.clear();
      print("this is srvice ");

      print("APi Response");
      list.add(VendorListingSubCategoriesIdModel.fromJson(map));

      /// print Response Api
      print(response.toString());
    } else {
      print("Error");
    }

    return list;
  }
}
