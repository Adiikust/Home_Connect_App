import 'dart:convert';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Delete_Listing/delete_listing_model.dart';
import 'package:vendor_app/services/apis_services.dart';
import 'package:vendor_app/services/network_client.dart';

import '../../../../Utils/Exports/all_exports.dart';

class VendorListingDeleteServices {
  late ApiService apiService =
      ApiService(networkClient: Get.put(NetworkClient()));
  List<VendorListingDeleteModel> list = [];
  Future<List<VendorListingDeleteModel>> deleteVendorListing(
    String subCategoriesId,
    BuildContext context,
  ) async {
    print("this is srvice ");
    final response = await apiService.getDeleteVendorListingData(
        userId: subCategoriesId.toString());
    String content = response.toString();
    print(content.toString());
    print("this is srvice ");
    Map<String, dynamic> map = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      print("this is srvice ");

      print("APi Response");
      list.add(VendorListingDeleteModel.fromJson(map));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(list[0].message.toString()),
        ),
      );

      /// print Response Api
      print(response.toString());
    } else {
      print("Error");
    }
    return list;
  }
}
