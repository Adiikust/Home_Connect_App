import 'dart:convert';

import 'package:vendor_app/services/apis_services.dart';
import 'package:vendor_app/services/network_client.dart';
import '../../../../Utils/Exports/all_exports.dart';
import 'delete_showcase_model.dart';

class VendorShowCaseDeleteServices {
  late ApiService apiService =
      ApiService(networkClient: Get.put(NetworkClient()));
  List<DeleteShowCaseModel> list = [];

  Future<List<DeleteShowCaseModel>> deleteVendorShowCase({
    required String subCategoriesId,
    required BuildContext context,
  }) async {
    final response = await apiService.getDeleteVendorShowCaseData(
        userId: subCategoriesId.toString());
    String content = response.toString();
    print(content.toString());
    print("this is srvice ");
    Map<String, dynamic> map = jsonDecode(response.toString());
    print("after ${response.statusCode.toString()}");
    print(" id  ${subCategoriesId.toString()} ");
    if (response.statusCode == 200) {
      print("this is srvice ");

      print("APi Response");
      list.add(DeleteShowCaseModel.fromJson(map));
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
