import 'dart:convert';
import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Order/Vendor_Order_Screen/vendor_order_Model.dart';
import 'package:vendor_app/services/apis_services.dart';
import 'package:vendor_app/services/network_client.dart';

class VendorOrderService {
  late ApiService apiService =
      ApiService(networkClient: Get.put(NetworkClient()));
  List<VendorOrderDataModel> list = [];
  Future<List<VendorOrderDataModel>> browse() async {
    print("this is VendorOrderService ");
    final response = await apiService.getVendorOrderData();
    print("this is VendorOrderService ");
    Map<String, dynamic> map = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      print("this is VendorOrderService ");

      print("APi Response");
      list.add(VendorOrderDataModel.fromJson(map));

      /// print Response Api
      print(response.toString());
    } else {
      print("Error");
    }

    return list;
  }
}
