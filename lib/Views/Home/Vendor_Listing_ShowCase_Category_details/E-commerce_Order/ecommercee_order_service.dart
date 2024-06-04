import 'dart:convert';
import 'package:vendor_app/Views/Home/User/Sub_Categories/sub_categories_model.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/E-commerce_Order/ecommercee_order_model.dart';
import 'package:vendor_app/services/apis_services.dart';
import 'package:vendor_app/services/network_client.dart';
import '../../../../Utils/Exports/all_exports.dart';

class EcommerceOrderService {
  late ApiService apiService =
      ApiService(networkClient: Get.put(NetworkClient()));

  List<EcommerceOrderModel> list = [];

  Future<List<EcommerceOrderModel>> browse() async {
    print("this is srvice ");
    final response = await apiService.getEcommerceOrderData();
    // String content = response.toString();
    print("this is srvice ");
    Map<String, dynamic> map = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      print("this is srvice ");

      print("APi Response");
      list.add(EcommerceOrderModel.fromJson(map));

      print("Ecommerce data  ${response}");
    } else {}

    return list;
  }
}
