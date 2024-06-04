import 'dart:convert';

import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Listing_&_ShowCase/Show_Sub_Categories_Listing/sub_categories_id_base_listing_show_model.dart';
import 'package:vendor_app/services/network_client.dart';

import '../../../../../Utils/Exports/all_exports.dart';
import '../../../../../services/apis_services.dart';

class SubCategoriesIdBaseListingShowServices {
  late ApiService apiService =
      ApiService(networkClient: Get.put(NetworkClient()));
  List<SubCategoriesIdBaseListingShowModel> list = [];
  Future<List<SubCategoriesIdBaseListingShowModel>> browse() async {
    print("this is srvice ");
    final response = await apiService.getVendorSubCategoriesData();
    // String content = response.toString();
    print("this is srvice ");
    Map<String, dynamic> map = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      print("this is srvice ");

      print("APi Response");
      list.add(SubCategoriesIdBaseListingShowModel.fromJson(map));

      /// print Response Api
      print(response.toString());
    } else {
      print("Error");
    }

    return list;
  }
}
