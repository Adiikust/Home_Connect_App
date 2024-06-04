import 'dart:convert';
import 'package:vendor_app/Views/Home/User/Sub_Categories/sub_categories_model.dart';
import 'package:vendor_app/services/apis_services.dart';
import 'package:vendor_app/services/network_client.dart';
import '../../../../Utils/Exports/all_exports.dart';

class SubCategoriesService {
  late ApiService apiService =
      ApiService(networkClient: Get.put(NetworkClient()));
  List<SubCategoriesModel> list = [];
  Future<List<SubCategoriesModel>> browse() async {
    print("this is srvice ");
    final response = await apiService.getSubCategoriesData();
    // String content = response.toString();
    print("this is srvice ");
    Map<String, dynamic> map = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      print("this is srvice ");

      print("APi Response");
      list.add(SubCategoriesModel.fromJson(map));

      print("img url ${response}");

      /// print Response Api
      print(response.toString());
    } else {}

    return list;
  }
}
